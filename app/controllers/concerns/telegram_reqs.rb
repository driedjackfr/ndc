# frozen_string_literal: true

module TelegramReqs
  extend ActiveSupport::Concern

  API = "https://api.telegram.org/bot#{ENV['TELEGRAM_TOKEN']}/"

  included do
    def send_message(chat_id, body)
      uri = URI("#{ API }sendMessage")
      req = Net::HTTP::Post.new(uri)
      req.set_form_data(
        chat_id: chat_id,
        parse_mode: 'Markdown',
        text: body
      )

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
      p res.body
    end

    def send_quote(chat_id)
      uri = URI('http://quotes.stormconsultancy.co.uk/random.json')
      res = Net::HTTP.get_response(uri)
      quote = JSON.parse(res.body)
      p quote
      text = "_#{quote['quote']}_\r\n\r\n-#{quote['author']}"
      send_message chat_id, text
    end
  end
end
