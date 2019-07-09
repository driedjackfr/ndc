# frozen_string_literal: true

class Admin::TlgMessagesController < Admin::ApplicationController
  include TelegramReqs

  def create
    send_message params[:body]
    redirect_to new_admin_tlg_message_path
  end
end
