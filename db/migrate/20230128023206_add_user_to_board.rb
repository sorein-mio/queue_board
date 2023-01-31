class AddUserToBoard < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM boards;'
    add_reference :boards, :user, null: false, index: true
  end
  def down
    remove_reference :boards, :user, index: true
  end
end
