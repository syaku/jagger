fs = require "fs"

module.exports =
    load: (config, data, callback) ->
        fs.readFile config.path, (err, data) ->
            throw err if err
            callback null, data
    save: (config, data, callback) ->
        fs.writeFileSync config.path, data
        callback null, data