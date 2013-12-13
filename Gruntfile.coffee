"use strict"

markdown = require("marked")
semver = require("semver")

module.exports = (grunt) ->

  require("load-grunt-tasks") grunt
  require("time-grunt") grunt

  grunt.initConfig

    meta: grunt.file.readJSON("package.json")


    paths:
      app: "app"
      dist: "dist"


    jade:
      index:
        options:
          pretty: true
          data:
            version: "<%= meta.version %>"
            name: "<%= meta.name %>"
            description: "<%= meta.description %>"
        files:
          ".tmp/popup.html": ["<%= paths.app %>/popup.jade"]
      views:
        options:
          pretty: true
        files: [
          expand: true
          cwd: "<%= paths.app %>"
          dest: ".tmp"
          src: "views/*.jade"
          ext: ".html"
        ]


    watch:
      jade:
        files: ["<%= paths.app %>/{,*/}*.jade"]
        tasks: ["jade"]
      coffee:
        files: ["<%= paths.app %>/scripts/{,*/}*.coffee"]
        tasks: ["coffee:dist"]
      coffeeTest:
        files: [
          "test/coffee/spec/{,*/}*.coffee"
          "test/coffee/e2e/{,*/}*.coffee"
        ]
        tasks: [
          "coffee:testUnit"
          "coffee:testEnd"
        ]
      # styles:
      #   files: ["<%= paths.app %>/styles/{,*/}*.css"]
      #   tasks: [
      #     "copy:styles"
      #     "autoprefixer"
      #   ]
      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"
        files: [
          ".tmp/{,*/}*.html"
          "{.tmp,<%= paths.app %>}/styles/{,*/}*.css"
          "{.tmp,<%= paths.app %>}/scripts/{,*/}*.js"
          "<%= paths.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
        ]
      compass:
        files: ["<%= paths.app %>/styles/{,*/}*.{scss,sass}"]
        tasks: ["compass:server"]


    chromeManifest:
      dist:
        options:
          buildnumber: true
          background:
            target: "scripts/background.js"
        src: "<%= paths.app %>"
        dest: "<%= paths.dist %>"


    compress:
      dist:
        options:
          archive: "package/standby-chrome-extension.zip"
        files: [
          expand: true
          cwd: "dist/"
          src: ["**"]
          dest: ""
        ]

    autoprefixer:
      options: ["last 1 version"]
      dist:
        files: [
          expand: true
          cwd: ".tmp/styles/"
          src: "{,*/}*.css"
          dest: ".tmp/styles/"
        ]


    connect:
      options:
        port: 9000
        # Change this to '0.0.0.0' to access the server from outside.
        hostname: '0.0.0.0' #"localhost"
        livereload: 35729
      livereload:
        options:
          open: false
          base: [
            ".tmp"
            "<%= paths.app %>"
          ]
      test:
        options:
          port: 9001
          base: [
            ".tmp"
            "test"
            "<%= paths.app %>"
          ]
      dist:
        options:
          base: "<%= paths.dist %>"


    clean:
      dist:
        files: [
          dot: true
          src: [
            ".tmp"
            "<%= paths.dist %>/*"
            "!<%= paths.dist %>/.git*"
          ]
        ]
      server: ".tmp"


    jshint:
      options:
        jshintrc: ".jshintrc"
        reporter: require("jshint-stylish")
      all: [
        # TODO: Should not be a coffee file instead??
        "Gruntfile.js",
        ".tmp/scripts/{,*/}*.js"
      ]


    coffeelint:
      options:
        no_trailing_whitespace:
          level: "error"
      app: ["<%= paths.app %>/scripts/{,*/}*.coffee"]
      tests:
        files:
          src: [
            "test/e2e/{,*/}*.coffee"
            "test/spec/{,*/}*.coffee"
          ]


    coffee:
      options:
        sourceMap: true
        sourceRoot: ""
      dist:
        files: [
          expand: true
          cwd: "<%= paths.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]
      testUnit:
        files: [
          expand: true
          cwd: "test/coffee/spec"
          src: "{,*/}*.coffee"
          dest: "test/tests/spec"
          ext: ".js"
        ]
      testEnd:
        files: [
          expand: true
          cwd: "test/coffee/e2e"
          src: "{,*/}*.coffee"
          dest: "test/tests/e2e"
          ext: ".js"
        ]


    compass:
      options:
        sassDir: "<%= paths.app %>/styles"
        cssDir: ".tmp/styles"
        generatedImagesDir: ".tmp/images/generated"
        imagesDir: "<%= paths.app %>/images"
        javascriptsDir: "<%= paths.app %>/scripts"
        fontsDir: "<%= paths.app %>/styles/fonts"
        importPath: "<%= paths.app %>/vendors"
        httpImagesPath: "/images"
        httpGeneratedImagesPath: "/images/generated"
        httpFontsPath: "/styles/fonts"
        relativeAssets: false
      dist: {}
      server:
        options:
          debugInfo: true


    # not used since Uglify task does concat, but still available if needed
    # concat:
    #   dist: {}


    rev:
      dist:
        files:
          src: [
            "<%= paths.dist %>/scripts/main.js"
            "<%= paths.dist %>/styles/{,*/}*.css"
            "<%= paths.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
            "<%= paths.dist %>/styles/fonts/*"
          ]


    useminPrepare:
      html: ".tmp/index.html"
      options:
        dest: "<%= paths.dist %>"


    usemin:
      html: ["<%= paths.dist %>/{,*/}*.html"]
      css: ["<%= paths.dist %>/styles/{,*/}*.css"]
      options:
        dirs: ["<%= paths.dist %>"]


    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= paths.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg}"
          dest: "<%= paths.dist %>/images"
        ]


    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= paths.app %>/images"
          src: "{,*/}*.svg"
          dest: "<%= paths.dist %>/images"
        ]


    # cssmin:
    # By default, your `index.html` <!-- Usemin Block --> will take care of
    # minification. This option is pre-configured if you do not wish to use
    # Usemin blocks.
    #  dist:
    #    files:
    #      "<%= yeoman.dist %>/styles/main.css": [
    #        ".tmp/styles/{,*/}*.css",
    #        "<%= yeoman.app %>/styles/{,*/}*.css"
    #      ]


    htmlmin:
      dist:
        options:
          removeCommentsFromCDATA: false
          collapseWhitespace: true
          collapseBooleanAttributes: true
          removeAttributeQuotes: false
          removeRedundantAttributes: true
          useShortDoctype: false
          removeEmptyAttributes: true
          removeOptionalTags: true
        files: [
          expand: true
          cwd: ".tmp"
          src: [
            "*.html"
            "views/*.html"
          ]
          dest: "<%= paths.dist %>"
        ]


    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= paths.app %>"
          dest: "<%= paths.dist %>"
          src: [
            "*.{ico,png,txt}"
            "vendors/**/*"
            "images/{,*/}*.{gif,webp}"
            "styles/fonts/*"
            "_locales/{,*/}*.json"
          ]
        ]
      styles:
        expand: true
        cwd: "<%= paths.app %>/styles"
        dest: ".tmp/styles/"
        src: "{,*/}*.css"


    concurrent:
      server: [
        "coffee:dist"
        "compass:server"
        "jade"
        "copy:styles"
      ]
      test: [
        "coffee:testUnit"
        "coffee:testEnd"
        "compass"
        "copy:styles"
      ]
      dist: [
        "coffee:dist"
        "compass:dist"
        "copy:styles"
        "imagemin"
        "svgmin"
        "htmlmin"
      ]


    karma:
      unit:
        configFile: "karma.conf.coffee"
        singleRun: false
      end:
        configFile: "karma-e2e.conf.coffee"
        singleRun: false


    # TODO: Still needed since requirejs is in action?
    cdnify:
      dist:
        html: ["<%= paths.dist %>/*.html"]


    # TODO: Check whether ngminifying is done well?
    ngmin:
      dist:
        files: [
          expand: true
          cwd: "<%= paths.dist %>/scripts"
          src: "**/*.js"
          dest: "<%= paths.dist %>/scripts"
        ]


    # TODO: Locate produced js file for the process since main file in coffee?
    requirejs:
      compile:
        options:
          appDir: "app/scripts/"
          baseUrl: "."
          dir: "dist/scripts/"
          optimize: "uglify"
          mainConfigFile: "./.tmp/scripts/main.js"
          logLevel: 0
          findNestedDependencies: true
          fileExclusionRegExp: /^\./
          inlineText: true


    # TODO: Still needed a uglifier since it is already implemented in requirejs?
    # uglify:
    #   dist:
    #     files:
    #       "<%= yeoman.dist %>/scripts/scripts.js": [
    #         "<%= yeoman.dist %>/scripts/scripts.js"
    #       ]


    changelog:
      options:
        dest: "CHANGELOG.md"
        versionFile: "package.json"


    release:
      options:
        commitMessage: "<%= version %>"
        tagName: "v<%= version %>"
        tagMessage: "tagging version <%= version %>"
        bump: false
        file: "package.json"
        add: true
        commit: true
        tag: true
        push: true
        pushTags: true
        npm: false


    stage:
      options:
        files: ["CHANGELOG.md"]


    replace:
      dist:
        options:
          variables:
            version: "<%= meta.version %>"
            released: grunt.template.today("dddd, mmmm dS, yyyy, h:MM:ss TT")
        prefix: "@@"
        files: [
          expand: true
          flatten: true
          src: ["<%= paths.dist %>/scripts/config.js"]
          dest: "<%= paths.dist %>/scripts/"
        ]


  # TODO: Check for inconsistencies
  grunt.registerTask "bump", "bump manifest version", (type) ->
    setup = (file, type) ->
      pkg = grunt.file.readJSON(file)
      newVersion = pkg.version = semver.inc(pkg.version, type or "patch")
      file: file
      meta: pkg
      newVersion: newVersion
    options = @options(file: grunt.config("pkgFile") or "package.json")
    config = setup(options.file, type)
    grunt.file.write config.file, JSON.stringify(config.meta, null, "  ") + "\n"
    grunt.log.ok "Version bumped to " + config.newVersion


  # TODO: Check for inconsistencies
  grunt.registerTask "stage", "git add files before running the release task", ->
    files = @options().files
    grunt.util.spawn
    # TODO (Test this if it is really needed git.cmd??)
      cmd: (if process.platform is "win32" then "git.cmd" else "git")
      args: ["add"].concat(files)
    , grunt.task.current.async()


  grunt.registerTask "server", "start a web server with extras", (target) ->
    return grunt.task.run(["build", "connect:dist:keepalive"])  if target is "dist"
    grunt.task.run [
      "clean:server"
      "chromeManifest:dist"
      "concurrent:server"
      "autoprefixer"
      "connect:livereload"
      "watch"
    ]


  grunt.registerTask "test", [
    "clean:server"
    "concurrent:test"
    "autoprefixer"
    "connect:test"
    "karma"
  ]


  grunt.registerTask "build", [
    "clean:dist"
    "chromeManifest:dist"
    "coffee:dist"
    "coffee:testUnit"
    "coffee:testEnd"
    "compass:dist"
    "jade"
    "useminPrepare"
    "imagemin"
    "svgmin"
    "htmlmin"
    "copy"
    "autoprefixer"
    "ngmin"
    # "cssmin"
    "requirejs"
    "rev"
    "usemin"
    "replace"
    "compress"
  ]


  grunt.registerTask "patch", [
    "bump:patch"
    "changelog"
    "stage"
    "release:patch"
    "replace"
  ]


  grunt.registerTask "minor", [
    "bump:minor"
    "changelog"
    "stage"
    "release:minor"
    "replace"
  ]

  grunt.registerTask "major", [
    "bump:major"
    "changelog"
    "stage"
    "release:major"
    "replace"
  ]

  grunt.registerTask "default", [
    "coffeelint"
    "jshint"
    "test"
    "build"
  ]