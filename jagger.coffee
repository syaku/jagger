opts = require "opts"
async = require "async"
{each} = require "underscore"

opts.parse [
    {
        "short":"c"
        ,"long":"config"
        ,"description":"config file"
        ,"value":true
        ,"required":false
    }
]

config = require opts.get("config")||"./config.json"

execute = (config) ->
    data = null
    tasks = [(callback) -> callback(null, {count:0, data:data})]
    
    each config, (task) ->
        array = task.module.split "::", 2
        func = (require "./plugins/#{array[0]}")[array[1]]
        tasks.push (data, next) ->
            func task.config, data, (err, result) ->
                next err, result

    tasks.push (data) -> data
    async.waterfall tasks

execute config