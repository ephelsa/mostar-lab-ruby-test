class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags, id: false do |t|
      t.integer :tag_id, primary_key: true, index: true
      t.text :name, null: false
    end
  end
end
