# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'Admin', foreign_key: 'user_id'
end
