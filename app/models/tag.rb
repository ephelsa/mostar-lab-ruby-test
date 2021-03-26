class Tag < ApplicationRecord
  self.has_and_belongs_to_many :movies, :join_table => 'movies_tags'
  self.validates :tag_id, presence: true, numericality: { only_integer: true }
  self.validates :name, presence: true
end
