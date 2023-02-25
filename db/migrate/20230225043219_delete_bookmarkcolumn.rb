class DeleteBookmarkcolumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :bookmark, :boolean
  end
end
