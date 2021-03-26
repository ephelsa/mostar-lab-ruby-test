class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies, id: false do |t|
      t.integer :movie_id, primary_key: true, index: true
      t.text :title, null: false
      t.text :description
      t.date :release_date
      t.integer :duration
      t.integer :rate
      t.integer :earns
      t.text :image
    end
  end
end
