// import gulp and plugins
var gulp = require('gulp');
var sass = require('gulp-sass');
var browserSync = require('browser-sync').create();
const gulp = require('gulp');
const imagemin = require('gulp-imagemin');

// complie sass with gulp
gulp.task('sass', function(){
    return gulp.src('./sass/**/*.scss')
    .pipe(sass({outputStyle : "compressed"}).on('error', sass.logError))
    .pipe(gulp.dest('./css'));
});

gulp.task('sass:watch', function () {
    gulp.watch('./sass/**/*.scss', ['sass']);
  });


gulp.task('serve', function(){
    browserSync.init({
        server: {
            baseDir: './',
            index: 'index.html'
        }
    })
});