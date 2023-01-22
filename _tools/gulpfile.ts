import * as gulp from "gulp";
import * as gulpReplace from "gulp-replace";
import * as gulpPbo from "gulp-armapbo";
import * as gulpModify from "gulp-modify-file";
import * as gulpZip from "gulp-zip";
import * as vinylPaths from "vinyl-paths";
import * as del from "del";

import { resolve } from "path";

import { MissionPaths, uploadLegacy } from "./src";
import { Preset, FolderStructureInfo } from "./src";


const presets: Preset[] = require('./_presets.json');

/**
 * Mission folders configuration
*/
const paths: FolderStructureInfo = {
    frameworkFolder: resolve('..', 'Missionframework'),
    missionsFolder: resolve('..', 'Missionbasefiles'),
    workDir: resolve("./build")
};


/**
 * Create gulp tasks
 */
let taskNames: string[] = [];
let taskNamesPbo: string[] = [];
let taskNamesZip: string[] = [];
let taskNamesWorkshop: string[] = [];

for (let preset of presets) {
    const mission = new MissionPaths(preset, paths);
    const taskName = [preset.missionName, preset.map].join('.');

    taskNames.push('mission_' + taskName);

    console.log(preset);

    // TODO: TBD: somewhere in this mix we should align addons, mod bundles as well...
    gulp.task('mission_' + taskName, gulp.series(
        /** Copy mission framework to output dir */
        function frameworkCopy () {
            return gulp.src(mission.getFrameworkPath().concat('/**/*'))
                .pipe(gulp.dest(mission.getOutputDir()));
        },

        /** Copy mission.sqm to output dir */
        function missionSqmCopy () {
            return gulp.src(mission.getMissionSqmPath())
                .pipe(gulp.dest(mission.getOutputDir()));
        },

        /** Replace variables values in configuration file */
        function configReplace () {
            // https://jsfiddle.net/ute7x6ob/97
            let src = gulp.src(mission.getMissionConfigFilePath());
            const variables = Object.getOwnPropertyNames(preset.variables);
            for (let variable of variables) {
                const value = preset.variables[variable];
                // Allowing for SCALAR, STRING, and even ARRAY value substitution via build presets
                const re = new RegExp(`(${variable}\\s*=\\s*)(?:\\d+|".+"|\\[.*\\])(\\s*;)`);
                // Allowing for NESTED ARRAY use cases with trailing "];"          ^^^^^^^
                // Also doing a gulpReplace(), could just do a RegExp replace, possibly, but that is okay
                src = src.pipe(gulpReplace(re, `$1${value}$2`));
                // Include the trailing semicolon here due to the above match
            }
            return src.pipe(gulp.dest(mission.getOutputDir()));
        },

        /** Replace values in stringtable */
        function stringTableReplace () {
            // I know, replacing XML with regex... :|
            // https://regex101.com/r/TSfish/2
            const versionRegex = /(<Key ID="STR_MISSION_VERSION">\s*<Original>)(?<version>.+)(<\/Original>)/;
            const nameRegex = /(<Key ID="STR_MISSION_TITLE">\s*<Original>)(?<name>.+)(<\/Original>)/;

            return gulp.src(mission.getFrameworkPath().concat('/stringtable.xml'))
                .pipe(gulpModify((content: string) => {
                    var contentMatch = content.match(versionRegex);
                    // TODO: TBD: is this adequately sufficient to the task? i.e. guarding match and the 'groups'
                    if (contentMatch !== null) {
                        var matchedGroups = contentMatch['groups'];
                        if (matchedGroups) {
                            let version: string = matchedGroups['version'];

                            // append commit hash and mark as dev version in PRs
                            if ('pull_request' === process.env.GITHUB_EVENT_NAME) {
                                content = content.replace(versionRegex, `$1${version}-${process.env.GITHUB_SHA}$3`);
                                version = version.concat('-dev');
                            }
    
                            // add version number and map name to mission name
                            return content.replace(nameRegex, `$1CTI 34 KP Liberation ${preset.mapDisplay || preset.map} ${version}$3`);
                        }
                    };
                }))
                .pipe(gulp.dest(mission.getOutputDir(), { overwrite: true, }))
            ;
        }
    ));

    /**
     * Pack PBOs
     */
    taskNamesPbo.push('pack_' + taskName);

    gulp.task('pack_' + taskName, () => {
        return gulp.src(mission.getOutputDir() + '/**/*')
            .pipe(gulpPbo({
                fileName: mission.getFullName() + '.pbo',
                progress: false,
                verbose: false,
                // Do not compress (SLOW)
                compress: true ? [] : [
                    '**/*.sqf',
                    'mission.sqm',
                    'description.ext'
                ]
            }))
            .pipe(gulp.dest(mission.getWorkDir() + '/pbo'));
    });

    /**
     * Create ZIP files
     */
    taskNamesZip.push('zip_' + taskName);

    gulp.task('zip_' + taskName, () => {
        return gulp.src([
            resolve('..', './userconfig/**/*'),
            resolve('..', 'LICENSE.md'),
            resolve('..', 'README.md'),
            resolve('..', 'CHANGELOG.md')
        ], {
                base: resolve('..') // Change base dir to have correct relative paths in ZIP
            })
            .pipe(
                gulp.src(
                    resolve(mission.getWorkDir(), 'pbo', mission.getFullName() + '.pbo'), {
                        base: resolve(mission.getWorkDir(), 'pbo') // Change base dir to have correct relative paths in ZIP
                    })
            )
            .pipe(gulpZip(
                mission.getFullName() + '.zip'
            ))
            .pipe(gulp.dest(mission.getWorkDir()))
    });

    // TODO: TBD: not sure how we would validate otherwise
    // We 'have' a WORKSHOPID present, and it is at least non-empty
    if (!!preset.workshopId) {
        if (preset.workshopId !== "") {
            taskNamesWorkshop.push('workshop_' + taskName);

            gulp.task('workshop_' + taskName, async () => {
                const pboPath = resolve(mission.getWorkDir(), 'pbo', mission.getFullName() + '.pbo');
                console.log(pboPath);

                await uploadLegacy(preset.workshopId, pboPath);
            });
        }
    }
}

// Main tasks
gulp.task('clean', () => {
    return gulp.src(paths.workDir)
        .pipe(vinylPaths(del));
});

gulp.task('build', gulp.series(taskNames));

gulp.task('pbo', gulp.series(taskNamesPbo));

gulp.task('zip', gulp.series(taskNamesZip));

gulp.task('workshop', gulp.series(taskNamesWorkshop));

gulp.task('default',
    gulp.series(
        gulp.task('build'),
        gulp.task('pbo'),
        gulp.task('zip'),
    )
);
