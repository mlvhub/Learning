'use strict';

module.exports = function(grunt) {

  require('load-grunt-tasks')(grunt);

  require('time-grunt')(grunt);

  grunt.initConfig({
    
    yeoman: {
      app: 'app',
      scripts: 'scripts',
      styles: 'styles',
      templates: 'templates',
      dist: 'dist'
    },

    watch: {
      haml: {
        files: ['<%= yeoman.app %>/**/*.haml'],
        tasks: ['haml']
      },
      coffee: {
        files: ['<%= yeoman.app %>/<%= yeoman.scripts %>/**/*.coffee'],
        tasks: ['coffee']
      },
      compass: {
        files: ['<%= yeoman.app %>/<%= yeoman.styles %>/**/*.scss'],
        tasks: ['compass:server'],
      },
      gruntFile: {
        files: ['Gruntfile.js']
      },
      livereload: {
        options: {
          livereload: '<%= connect.options.livereload %>'
        },
        files: [
          '<%= yeoman.app %>/*.haml',
          '<%= yeoman.app %>/<%= yeoman.templates%>/**/*.haml',
          '<%= yeoman.app %>/<%= yeoman.scripts%>/**/*.coffee',
          '<%= yeoman.app %>/<%= yeoman.styles%>/**/*.scss',
          '<$= yeoman.app %>/<%= yeoman.dist %>/**/*',
          '<%= yeoman.app %>/<%= yeoman.images %>/**/*.{png,jpg,jpeg,gif,webp,svg}'
        ]
      }
    },

    connect: {
      options: {
        port: 9000,
        hostname: 'localhost',
        livereload: 35729
      },
      livereload: {
        options: {
          open: true,
          base: ['<%= yeoman.app %>']
        }
      },
      dist: {
        options: {
          base: '<%= yeoman.app %>/<%= yeoman.dist %>'
        }
      }
    },

    haml: {
      index: {
        files: {
          '<%= yeoman.app %>/index.html': '<%= yeoman.app %>/index.haml'
        }
      },
      templates: {
        files: grunt.file.expandMapping(['<%= yeoman.app %>/<%= yeoman.templates %>/**/*.haml'], '<%= yeoman.app %>/<%= yeoman.dist %>/<%= yeoman.templates %>', {
          rename: function(base, path) {
            return base + path.replace(/\.haml$/, 'html');
          }
        })
      }
    },

    coffee: {
      glob_to_multiple: {
        expand: true,
        cwd: '<%= yeoman.app %>/',
        src: ['<%= yeoman.scripts %>/**/*.coffee'],
        dest: '<%= yeoman.app %>/<%= yeoman.dist %>/',
        ext: '.js'
      }
    },

    compass: {
      options: {
        sassDir: '<%= yeoman.app %>/styles',
        cssDir: '<%= yeoman.app %>/<%= yeoman.dist %>/<%= yeoman.styles %>',
        generatedImagesDir: '.tmp/images/generated',
        imagesDir: '<%= yeoman.app %>/images',
        javascriptsDir: '<%= yeoman.app %>/scripts',
        fontsDir: '<%= yeoman.app %>/styles/fonts',
        importPath: 'bower_components',
        httpImagesPath: '/images',
        httpGeneratedImagesPath: '/images/generated',
        httpFontsPath: '/styles/fonts',
        relativeAssets: false,
        assetCacheBuster: false,
        raw: 'Sass::Script::Number.precision = 10\n'
      },
      dist: {
        options: {
          generatedImagesDir: '<%= yeoman.dist %>/images/generated'
        }
      },
      server: {
        options: {
          debugInfo: true
        }
      }
    },

    concurrent: {
      server: [
        'compass:server',
        'coffee',
        'haml',
      ]
    }

  });

  grunt.registerTask('serve', function (target) {
    if (target === 'dist') {
      return grunt.task.run(['build', 'connect:dist:keepalive']);
    }

    grunt.task.run([
      'concurrent:server',
      'connect:livereload',
      'watch'
    ]);
  });

};

