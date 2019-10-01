class Api::V1::UsersController < ApplicationController
  def index
    @users = User.getAll
    render json: @users
  end

  def user_list
    @userlist = User.limit(params[:amount])
    render json: @userlist
  end
end
