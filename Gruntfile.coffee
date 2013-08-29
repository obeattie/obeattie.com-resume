module.exports = (grunt) ->
    grunt.initConfig {
        pkg: grunt.file.readJSON('package.json'),
        
        less: {
            production: {
                options: {
                    yuicompress: true
                },
                files: {
                    'static/obeattie.css': [
                        'static/mixins.less',
                        'static/*.css',
                        'static/*.less'
                    ]
                }
            }
        },
        
        cssmin: {
            production: {
                files: {
                    'static/obeattie.css': ['static/obeattie.css']
                },
                options: {
                    keepSpecialComments: 0
                }
            }
        }
        
        watch: {
            files: [
                'static/*.css',
                'static/*.less',
            ],
            tasks: ['build']
        }
    }
    
    # Load plugins
    grunt.loadNpmTasks('grunt-contrib-watch')
    grunt.loadNpmTasks('grunt-contrib-less')
    grunt.loadNpmTasks('grunt-contrib-cssmin')
    
    # Default tasks
    grunt.registerTask('build', ['less', 'cssmin'])