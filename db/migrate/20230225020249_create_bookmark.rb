class CreateBookmark < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.boolean :bookmark, null: false, default: false
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true
    end
  end
end
