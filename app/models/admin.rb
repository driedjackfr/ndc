# frozen_string_literal: true

class Admin < User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable

  has_many :posts, foreign_key: 'user_id'
end
