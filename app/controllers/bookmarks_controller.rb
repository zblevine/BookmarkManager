class BookmarksController < ApplicationController
  def new
  	@bookmark = Bookmark.new
  end

  def index
    if params[:tag].present?
     @bookmarks = Bookmark.where({:tag => "#{params[:tag]}"})
    else
  	 @bookmarks = Bookmark.all
    end
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
  		params.require(:bookmark).permit(:url, :title, :tag)
  	end
end
