class Movie < ApplicationRecord
  self.has_and_belongs_to_many :tags, :join_table => 'movies_tags'
  self.has_and_belongs_to_many :users, :join_table => 'favourites'
  self.has_many :casts
  self.validates :movie_id, presence: true, numericality: { only_integer: true }
  self.validates :title, presence: true
end
