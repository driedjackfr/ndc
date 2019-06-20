# frozen_string_literal: true

class Post < ApplicationRecord
  include Timeable

  enum status: { publish: 0, draft: 1 }

  belongs_to :author, class_name: 'Admin', foreign_key: 'user_id'
  belongs_to :public_post, class_name: 'Post', optional: true

  has_one :draft, class_name: 'Post', foreign_key: 'public_post_id'

  validates :title, presence: true
  validates :body, presence: true
  validates :views_count, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal: 0 }
end
