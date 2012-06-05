config = require "./config.json"
async = require "async"

execute = (config) ->
    data = null
    tasks = [(callback) -> callback(null, {count:0, data:data})]

    for item in config
        tasks.push (args, callback) ->
            task = config[args.count]
            array = task.module.split "::", 2
            module = require "./plugins/"+array[0]
            module[array[1]] task.config, args.data, (err, data) ->
                callback err, {"count":args.count+1, data:data}

    tasks.push (data) -> data
    async.waterfall tasks

execute config
