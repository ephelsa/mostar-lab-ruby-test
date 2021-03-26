class CreateMoviesTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :movies, :tags, table_name: :movies_tags, id: false, column_options: { type: :integer } do |t|
      t.index [:movie_id, :tag_id], unique: true
    end

    add_foreign_key :movies_tags, :movies, column: :movie_id, primary_key: :movie_id
    add_foreign_key :movies_tags, :tags, column: :tag_id, primary_key: :tag_id
  end
end
