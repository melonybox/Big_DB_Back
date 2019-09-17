class Api::V1::UsersController < ApplicationController
  def index
    @users = User.getAll
    render json: @users
  end
end
