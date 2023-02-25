class BookmarksController < ApplicationController
  def create
    bookmark = Bookmark.new(board_id: params[:board_id], user_id: current_user.id)
    bookmark.save!
    redirect_back_or_to boards_path, success: t('.registered')
  end

  def destroy
    board = Board.find(params[:id])
    bookmark = board.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy!
    redirect_back_or_to boards_path, success: t('.unregistered')
  end

  def index
    @boards = current_user.boards.includes(:bookmarks)
  end
end
