# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :post

  validates :title, :author, :cover, :feature_image, :page, presence: true
  validates :point, presence: true,
                    numericality: { only_integer: true }
end
