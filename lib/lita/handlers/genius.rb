require "rapgenius"

module Lita
  module Handlers
    class Genius < Handler

      route(/^genius\s+(.+)/i, :search, command:true,
            help: {t("help.search_key") => t("help.search_value")})

      def search(response)
        query = response.matches.first.first
        songs = RapGenius.search(query)
        if !songs.empty?
          song = songs.first
          response.reply song.description.gsub(/\n+/, " ")
          response.reply "#{song.artist.name} - #{song.title} | http://genius.com/songs/#{song.id}"
        else
          response.reply "No songs found for '#{query}'"
        end
      end

    end

    Lita.register_handler(Genius)
  end
end
