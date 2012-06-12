module.exports =
  tweet: (config, data, next) ->
    console.log config.secret_token
    console.log config.token
    next null, data
  timeline: (config, data, next) ->
    next null, data
