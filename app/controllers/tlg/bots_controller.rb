# frozen_string_literal: true

class Tlg::BotsController < ApplicationController
  include TelegramReqs

  skip_before_action :verify_authenticity_token

  def hook
    case params[:message][:text]
    when /^\/hello.*/
      send_message params[:message][:chat][:id], 'I am here for *serving you*. But now what I can do are not a lot. I will learn more!'
    when /^\/quote.*/
      send_quote params[:message][:chat][:id]
    end
    render json: {}
  end
end
