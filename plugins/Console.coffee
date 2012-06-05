module.exports =
        log: (config, data, callback) ->
                console.log config.text
                callback null, data
