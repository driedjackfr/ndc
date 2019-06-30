# frozen_string_literal: true

class Post < ApplicationRecord
  include Timeable
  extend FriendlyId

  CATEGORY = { common: 0, til: 1 }.freeze

  belongs_to :author, class_name: 'Admin', foreign_key: 'user_id'

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :views_count, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal: 0 }

  enum category: CATEGORY
  friendly_id :title, use: :slugged
end
