class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: t('.success')
    else
      flash.now[:danger] = t('.aleat')
      render :new
    end
  end

  def destroy
  end

  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  private


  def board_params
    params.require(:board).permit(:title, :body)
  end
end
