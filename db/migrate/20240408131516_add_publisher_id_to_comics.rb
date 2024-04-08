class AddPublisherIdToComics < ActiveRecord::Migration[7.1]
  def change
    add_reference :comics, :publisher, foreign_key: true
    change_column :comics, :publisher_id, :integer, null: false
  end
end
