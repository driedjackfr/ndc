# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :post

  validates :title, presence: true
  validates :point, presence: true,
                    numericality: { only_integer: true }
end
