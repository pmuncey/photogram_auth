class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])
    @photos = Photo.where(:user_id => @user.id)

    render("users/show.html.erb")
  end

  def my_likes
    @my_liked_photos = current_user.liked_photos
    if current_user !=nil
    render("my_likes")
    else redirect_to("index")
    end
  end
end
