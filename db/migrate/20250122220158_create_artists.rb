class CreateArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :genre
      t.string :country
      t.string :pseudonym

      t.timestamps
    end
    add_index :artists, :pseudonym, unique: true
  end
end
