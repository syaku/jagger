$ = require "jquery"

module.exports =
    parse: (config, data, callback) ->
        callback null, data
    stringify: (config, data, callback) ->
        root = $("<root />")
        rss = $("<rss />")
        channel = $("""
            <channel>
            <title>#{data.title}</title>
            </channel>
            """)
        for item in data.items
            link = """<link>#{item.url}</link>"""
            channel.append("""
                <item rdf:about="#{item.url}">
                <title>#{item.title}</title>
                #{link}
                <description>#{item.object.content}</description>
                </item>
                """)

        $(rss).append(channel)
        $(root).append(rss)
        data = """
        <?xml version="1.0" encoding="utf-8"?>
        #{$(root).html()}
        """
        callback null, data