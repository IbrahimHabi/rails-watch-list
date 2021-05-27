class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:new, :create, :destroy]
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @bookmark

    if @bookmark.save
      redirect_to @list
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  # def set_bookmark
  #   @list = List.find(params[:id])
  # end

  def bookmark_params
    params.require[:bookmark].permit(:comment, :movie_id)
  end
end
