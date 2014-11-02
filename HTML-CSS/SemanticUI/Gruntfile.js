'use strict';

module.exports = function(grunt) {

  require('load-grunt-tasks')(grunt);

  require('time-grunt')(grunt);

  grunt.initConfig({
    
    yeoman: {
      app: 'app',
      srcApp: 'src-app',
      assets: 'assets',
      images: 'images'
    },

    watch: {
      jade: {
        files: ['<%= yeoman.srcApp %>/**/*.jade'],
        tasks: ['clean:jade', 'jade']
      },
      stylus: {
        files: ['<%= yeoman.srcApp %>/**/*.styl'],
        tasks: ['clean:stylus', 'stylus'],
      },
      gruntFile: {
        files: ['Gruntfile.js']
      },
      livereload: {
        options: {
          livereload: '<%= connect.options.livereload %>'
        },
        files: [
          '<%= yeoman.srcApp %>/**/*.jade',
          '<%= yeoman.srcApp %>/**/*.styl',
          '<%= yeoman.srcApp %>/<% yeoman.assets %>/<%= yeoman.images %>/**/*.{png,jpg,jpeg,gif,webp,svg}'
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
      }
    },

    jade: {
      index: {
        files: {
          '<%= yeoman.app %>/index.html': '<%= yeoman.srcApp %>/index.jade'
        }
      },
      templates: {
        expand: true,
        cwd: '<%= yeoman.srcApp %>',
        src: ['**/*.jade'],
        dest: '<%= yeoman.app %>',
        ext: '.html'
      }
    },

    stylus: {
      compile: {
        files: {
          '<%= yeoman.app %>/<%= yeoman.assets %>/main.css': ['<%= yeoman.srcApp %>/**/*.styl']
        }
      }
    },

    concurrent: {
      server: [
        'jade',
        'stylus'
      ]
    },

    clean: {
      jade: {
        src: ['<%= yeoman.app %>/**/*.html']
      },
      stylus: {
        src: ['<%= yeoman.app %>/**/*.css']
      }
    }

  });

  grunt.registerTask('serve', function (target) {
    if (target === 'dist') {
      return grunt.task.run(['build', 'connect:dist:keepalive']);
    }

    grunt.task.run([
      'clean',
      'concurrent:server',
      'connect:livereload',
      'watch'
    ]);
  });

};

