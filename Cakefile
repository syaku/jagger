{exec} = require "child_process"
{filter} = require "underscore"
fs = require "fs"

getFiles = (ext)->
  files = fs.readdirSync "./"
  plugins = fs.readdirSync "./plugins/"

  for plugin in plugins
    files.push "plugins/#{plugin}"

  re = new RegExp("\.#{ext}$")
  return filter files, (filename) ->
    if re.test(filename)
      true
    else
      false

task "test", "Lint .coffee files.", (options) ->
  files = getFiles "coffee"
  exec "coffeelint #{files.join ' '}", (err, stdout, stderr) ->
    console.log stdout+stderr
    throw err if err

task "build", "Compile .coffee files.", (options) ->
  files = getFiles "coffee"
  exec "coffee -c #{files.join ' '}", (err, stdout, stderr) ->
    throw err if err
    console.log stdout+stderr
    console.log "Done."
task "clean", "Clean up .js files.", (options) ->
  files = getFiles "js"
  exec "rm #{files.join ' '}", (err, stdout, stderr) ->
    throw err if err
    console.log stdout+stderr
    console.log "Done."
