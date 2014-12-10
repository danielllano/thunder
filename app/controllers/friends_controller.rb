class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @friend = current_user.random_friend
    # render :index (default behavior)
  end

  def like
    # get data from like or unlike button
    @friend         = User.find(params[:id])
    like_or_unlike  = params[:liked] == "true"

    # save like data into database
    current_user.likes.create(friend_id: @friend.id, liked: like_or_unlike)

    if @friend.liked?(current_user)
      render :match
      LikeMailer.match_email(current_user, @friend).deliver
      LikeMailer.match_email(@friend, current_user).deliver
    else
      redirect_to root_path
    end
  end
end
