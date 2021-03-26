class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites, id: false do |t|
      t.references :user, type: :uuid
      t.references :movie, type: :integer
      t.index [:movie_id, :user_id], unique: true
    end

    add_foreign_key :favourites, :movies, column: :movie_id, primary_key: :movie_id
    add_foreign_key :favourites, :users, column: :user_id, primary_key: :user_id
  end
end
