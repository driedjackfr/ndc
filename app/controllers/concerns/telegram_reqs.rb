# frozen_string_literal: true

module TelegramReqs
  extend ActiveSupport::Concern

  API = "https://api.telegram.org/bot#{ENV['TELEGRAM_TOKEN']}/"

  included do
    def send_message(body)
      uri = URI("#{ API }sendMessage")
      req = Net::HTTP::Post.new(uri)
      req.set_form_data(
        chat_id: '@code_sharing',
        parse_mode: 'Markdown',
        text: body
      )

      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end
    end
  end
end
