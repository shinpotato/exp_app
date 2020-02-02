class UsersController < ApplicationController

  def show
#    @items = Item.where(user_id: current_user.id)
    @user = User.find(current_user.id)
  end
end
