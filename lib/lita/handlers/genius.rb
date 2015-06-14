module Lita
  module Handlers
    class Genius < Handler

      API_URL = "http://api.genius.com"

      config :access_token, type: String, required: true

      route(/^genius\s+(.+)/i, :search, command:true,
            help: {t("help.search_key") => t("help.search_value")})

      def search(response)
        query = response.matches.first.first
        search_response = http.get(
          "#{API_URL}/search",
          {q: query},
          {"Authorization" => "Bearer #{config.access_token}"}
        )
        songs = MultiJson.load(search_response.body)["response"]["hits"]
        return response.reply "No songs found for '#{query}'" if songs.empty?
        song = songs.first
        id = song["result"]["id"]
        song_response = http.get(
          "#{API_URL}/songs/#{id}",
          {text_format: "plain"},
          {"Authorization" => "Bearer #{config.access_token}"}
        )
        description = MultiJson.load(song_response.body)["response"]["song"]["description"]["plain"].gsub(/\n+/, " ")
        artist = song["result"]["primary_artist"]["name"]
        title = song["result"]["title"]
        response.reply description
        response.reply "#{artist} - #{title} | http://genius.com/songs/#{id}"
      end

    end

    Lita.register_handler(Genius)
  end
end
