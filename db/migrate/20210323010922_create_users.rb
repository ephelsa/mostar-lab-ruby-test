class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: false do |t|
      t.uuid :user_id, primary_key: true, index: true, default: 'gen_random_uuid()'
      t.text :full_name, null: false
    end
  end
end
