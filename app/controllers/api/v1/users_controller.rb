class Api::V1::UsersController < ApplicationController
  def index
    users = User.getAll
    render json: users
  end

  def user_list
    userList = User.offset(params[:page].to_i).limit(params[:amount].to_i)
    pageCount = User.count / params[:amount].to_i
    dataSent = [userList,pageCount]
    render json: dataSent
  end
end
