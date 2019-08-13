# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, counter_cache: true

  validates :body, presence: true, length: { minimum: 5, allow_blank: true }

  before_save :set_name

  private

  def set_name
    return self.commenter = user.username if user
    self.commenter = 'Làm biếng viết tên' if commenter.blank?
  end
end
