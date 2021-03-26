class CreateCasts < ActiveRecord::Migration[6.1]
  def change
    create_table :casts, id: false do |t|
      t.uuid :cast_id, primary_key: true, index: true, default: 'gen_random_uuid()'
      t.text :person, null: false
      t.text :interpretation, null: false
      t.references :movie, type: :integer, null: false
    end

    add_foreign_key :casts, :movies, column: :movie_id, primary_key: :movie_id
  end
end
