# frozen_string_literal: true

class Post < ApplicationRecord
  include Timeable

  CATEGORY = { common: 0, til: 1 }.freeze

  enum category: CATEGORY

  belongs_to :author, class_name: 'Admin', foreign_key: 'user_id'

  validates :title, presence: true
  validates :body, presence: true
  validates :views_count, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal: 0 }
end
