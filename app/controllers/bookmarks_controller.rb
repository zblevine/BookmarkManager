class BookmarksController < ApplicationController
  def new
  	@bookmark = Bookmark.new
  end

  def index
  	@bookmarks = Bookmark.all
  end

  def create
  	@bookmark = Bookmark.new(bk_params)
  	if @bookmark.save
  		redirect_to :back
  	else
  		render 'new'
  	end
  end

  private
  	def bk_params
  		params.require(:bookmark).permit(:url, :title)
  	end
end
