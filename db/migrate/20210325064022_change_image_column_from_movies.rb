class ChangeImageColumnFromMovies < ActiveRecord::Migration[6.1]
  def change
    change_table :movies do |t|
      t.rename :image, :image_url
    end
  end
end
