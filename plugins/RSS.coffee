module.exports =
    parse: (config, data, callback) ->
        callback null, data
    stringify: (config, data, callback) ->
        if config?.items?
            original_items = eval "data.#{config.items}"
        else
            original_items = data
        items = []
        
        for item in original_items
            title = eval "item.#{config.item_title}"
            link = eval "item.#{config.item_link}"
            description = eval "item.#{config.item_description}"
            published = eval "item.#{config.item_published}"
            
            items.push """
            <item rdf:about="#{link||""}">
                <title>#{title||""}</title>
                <link>#{link||""}</link>
                <description><![CDATA[#{description||""}]]></description>
                <pubDate>#{published||""}</pubDate>
            </item>
            """
        data = """
        <?xml version="1.0" encoding="UTF-8"?>
        <rss version="2.0"
            xmlns:dc="http://purl.org/dc/elements/1.1/"
            xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
            xmlns:admin="http://webns.net/mvcb/"
            xmlns:rdf="http://www.w3c.org/1999/02/22-rdf-syntax-ns#">
            <channel>
                <title>#{config.title||""}</title>
                <link>#{config.link||""}</link>
                <description>#{config.description||""}</description>
                #{items.join  ''}
            </channnel>
        </rss>
        """
        callback null, data