# frozen_string_literal: true

class Post < ApplicationRecord
  include Timeable
  extend FriendlyId

  CATEGORY = { common: 0, til: 1, review: 2 }.freeze
  STATUS = { wip: 0, publish: 1 }.freeze

  belongs_to :author, class_name: 'Admin', foreign_key: 'user_id'

  has_many :comments, dependent: :destroy
  has_one :book
  accepts_nested_attributes_for :book

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  validates :views_count, presence: true,
                          numericality: { only_integer: true, greater_than_or_equal: 0 }

  enum category: CATEGORY
  enum status: STATUS

  friendly_id :title, use: :slugged

  scope :new_to_old, -> { order created_at: :desc }
end
