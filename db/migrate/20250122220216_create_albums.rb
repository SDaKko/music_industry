class CreateAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :albums do |t|
      t.references :artist, null: false, foreign_key: true
      t.string :title
      t.string :record_label
      t.string :album_genre
      t.integer :number_of_tracks

      t.timestamps
    end
  end
end
