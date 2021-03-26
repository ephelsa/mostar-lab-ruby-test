class Cast < ApplicationRecord
  self.belongs_to :movie
  self.validates :person, presence: true
  self.validates :interpretation, presence: true
  self.validates :movie_id, presence: true
end
