class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def bookmark_list
    @bookmark_data = Bookmark.where(user_id: params[:user_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    #@bookmark.user_id = params[:cuser_id]
    if @bookmark.save
      redirect_to action: 'bookmark_list', :user_id => @bookmark.user_id
    else
      redirect_to action: 'new', :user_id => @bookmark.user_id
    end
  end

  def delete
    Bookmark.find(params[:del_id]).delete
    redirect_to action: 'bookmark_list', :user_id => params[:user_id]
  end


  private

    def bookmark_params
      params.require(:bookmark).permit(:user_id, :url, :category, :memo)
    end

end
