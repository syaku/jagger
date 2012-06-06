module.exports =
    log: (config, data, callback) ->
        if config?.text?
            console.log config.text
        else
            console.log data.toString
        callback null, data
