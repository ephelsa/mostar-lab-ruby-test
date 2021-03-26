class User < ApplicationRecord
  self.has_and_belongs_to_many :movies, :join_table => 'favourites'
  self.has_secure_password
  self.validates :username, presence: true
  self.validates :full_name, presence: true
end
