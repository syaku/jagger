http = require "http"
https = require "https"
url = require "url"

module.exports = 
    load: (config, data, callback) ->
        myUrl = url.parse config.url, true

        protocol = http
        if "https:" == myUrl.protocol
            protocol = https

        protocol.get myUrl, (res) ->
            body = ""
            res.on "data", (buff) -> 
                body += buff
            res.on "end", -> 
                data = JSON.parse body
                callback null, data