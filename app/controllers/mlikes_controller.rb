class MlikesController < ApplicationController
  def index
    @my_likes = Like.where(:user_id => current_user.id)
    render("/my_likes/index.html.erb")
  end


end
