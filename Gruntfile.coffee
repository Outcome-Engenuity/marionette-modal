module.exports = (grunt) ->
  fs = require('fs')

  grunt.initConfig
    open:
      default:
        url: 'http://localhost:8000'

    connect:
      default:
        options:
          base: './'
          middleware: (connect, options) ->
            [connect.static(options.base), (req, res, next) ->
              fs.readFile "#{options.base}/test/spec.html", (err, data) ->
                res.writeHead(200)
                res.end(data)
            ]
      examples:
        options:
          port: 5000
          base: './examples/'
          middleware: (connect, options) ->
            [connect.static(options.base), (req, res, next) ->
              fs.readFile "#{options.base}/1_single_view.html", (err, data) ->
                res.writeHead(200)
                res.end(data)
            ]

    uglify:
      modal:
        src: 'dist/backbone.modal.js'
        dest: 'dist/backbone.modal-min.js'
      marionettemodal:
        src: 'dist/marionette.modal.js'
        dest: 'dist/marionette.modal-min.js'
      modals:
        src: 'dist/backbone.marionette.modals.js'
        dest: 'dist/backbone.marionette.modals-min.js'
      bundled:
        src: 'dist/marionette.modal-bundled.js'
        dest: 'dist/marionette.modal-bundled-min.js'

    jasmine:
      all:
        src: ['dist/backbone.modal.js', 'dist/marionette.modal.js', 'dist/backbone.marionette.modals.js']
        options:
          specs: 'test/spec/**/*.js'
          outfile: 'test/spec.html'
          host: 'http://127.0.0.1:8000/'
          vendor: ['examples/vendor/jquery-1.9.1.js', 'examples/vendor/underscore.js', 'examples/vendor/backbone.js', 'examples/vendor/marionette.js']

    clean: ['dist', 'test/spec']

    coffee:
      all:
        files:
          'dist/backbone.modal.js': 'src/backbone.modal.coffee'
          'dist/marionette.modal.js': 'src/marionette.modal.coffee'
          'dist/backbone.marionette.modals.js': 'src/backbone.marionette.modals.coffee'
          'dist/marionette.modal-bundled.js': ['src/backbone.modal.coffee', 'src/marionette.modal.coffee', 'src/backbone.marionette.modals.coffee']

          'examples/vendor/backbone.modal.js': 'src/backbone.modal.coffee'
          'examples/vendor/marionette.modal.js': 'src/marionette.modal.coffee'
          'examples/vendor/backbone.marionette.modals.js': 'src/backbone.marionette.modals.coffee'
      specs:
        files:
          grunt.file.expandMapping(['test/src/**/*.coffee'], 'test/spec/',
            rename: (destBase, destPath) ->
              return destBase + destPath.slice(9, destPath.length).replace(/\.coffee$/, '.js')
          )

    sass:
      compile:
        files:
          'dist/marionette.modal.css': 'src/marionette.modal.sass'
          'dist/marionette.modal.theme.css': 'src/marionette.modal.theme.sass'
          'examples/vendor/marionette.modal.css': 'src/marionette.modal.sass'
          'examples/vendor/marionette.modal.theme.css': 'src/marionette.modal.theme.sass'
          'examples/style.css': 'src/style.sass'

    concurrent:
      compile: ['coffee', 'sass']

    regarde:
      livereloadJS:
        files: ['test/**/*.js', 'examples/vendor/*.js']
        tasks: ['livereload']
      livereloadCSS:
        files: ['examples/vendor/marionette.modal.css', 'examples/vendor/marionette.modal.theme.css', 'examples/style.css']
        tasks: ['livereload:dist/marionette.modal.css', 'livereload:examples/vendor/marionette.modal.theme.css', 'livereload:examples/style.css']
      sass:
        files: ['src/**/*.sass']
        tasks: ['sass']
      coffee:
        files: ['src/**/*.coffee', 'test/src/**/*.coffee']
        tasks: ['uglify', 'coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-regarde'
  grunt.loadNpmTasks 'grunt-open'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-livereload'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-concurrent'

  grunt.registerTask 'build', ['clean', 'concurrent', 'uglify', 'jasmine:all:build']
  grunt.registerTask 'watch', ['connect', 'clean', 'build', 'livereload-start', 'open', 'regarde']