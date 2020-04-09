require "cgi"
require "httparty"
require "json"

module Jekyll
    class Scryfall < Liquid::Tag
        include HTTParty

        def initialize(tag_name, text, tokens)
            super
            @text = text
        end 

        def render(context)
            # Assign name to a variable and strip leading or trailing whitespace
            @card_name = @text.strip

            # Construct Scryfall request url
            request = HTTParty.get "https://api.scryfall.com/cards/named?exact=#{CGI.escape(@card_name)}"

            # Parse the JSON response
            response = JSON.parse(request&.body)

            # Assign the "normal" art to a variable
            @card_art = response['image_uris']['normal']

            # Render the card
            "<img alt='#{@card_name}' src='#{@card_art}' />"
        end

    end
end

Liquid::Template.register_tag('card', Jekyll::Scryfall)
