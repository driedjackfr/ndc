# frozen_string_literal: true

module Timeable
  extend ActiveSupport::Concern

  included do
    def display_created_at
      created_at.strftime('%d/%m/%Y')
    end
  end
end
