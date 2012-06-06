module.exports = 
    parse: (config, data, callback) ->
        callback null, JSON.parse data
    stringify: (config, data, callback) ->
        callback null, JSON.stringify data, null, 4