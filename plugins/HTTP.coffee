http = require "http"
https = require "https"
url = require "url"

module.exports =
    get: (config, data, callback) ->
        myUrl = url.parse config.url, true
        
        protocol = http
        if "https:" == myUrl.protocol
            protocol = https
        
        protocol.get myUrl, (res) ->
            body = ""
            res.on "data", (buff) -> 
                body += buff
            res.on "end", -> 
                callback null, body

    post: (config, data, callback) ->
        callback null, data
    