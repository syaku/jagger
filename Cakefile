{exec} = require "child_process"

files =
[
    "main.coffee"
    "./plugins/Console.coffee"
    "./plugins/HTTP.coffee"
    "./plugins/JSON.coffee"
]

jsFiles =
[
    "main.js"
    "./plugins/Console.js"
    "./plugins/HTTP.js"
    "./plugins/JSON.js"
]

task "make", "Compile .coffee files.", (options) ->
    console.log "Execute make task."
    exec "coffee -c #{files.join ' '}", (err, stdout, stderr) ->
        throw err if err
        console.log stdout+stderr

task "clean", "Clean up .js files.", (options) ->
    console.log "Execute clean up task"
    exec "rm #{jsFiles.join ' '}", (err, stdout, stderr) ->
        throw err if err
        console.log stdout+stderr