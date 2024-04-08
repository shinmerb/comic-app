class CreateComics < ActiveRecord::Migration[7.1]
  def change
    create_table :comics do |t|
      t.string :name
      t.date :published_on
      t.integer :price

      t.timestamps
    end
  end
end
