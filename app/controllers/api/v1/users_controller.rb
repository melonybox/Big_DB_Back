class Api::V1::UsersController < ApplicationController
  def index
    users = User.getAll
    render json: users
  end

  def user_list
    userList = User.order('id ASC').offset(params[:page].to_i*params[:amount].to_i).limit(params[:amount].to_i)
    pageCount = User.count / params[:amount].to_i
    pageList =
    if pageCount <= 5
      Array.new(pageCount).map.with_index { |x,idx| idx + 1 }
      # if less then 5 pages total
    elsif params[:page].to_i+1 < 3
      Array.new(5).map.with_index { |x,idx| idx + 1 }
      # for first 3 pages
    elsif params[:page].to_i+4 > pageCount
      Array.new(5).map.with_index { |x,idx| ((pageCount-5)+idx)+1 }
      # for last 3 pages
    elsif pageCount >= 5
      Array.new(5).map.with_index { |x,idx| ((params[:page].to_i-2)+idx)+1 }
      # for pages between first and last 3
    end
    dataSent = [userList,pageCount,params[:page].to_i,pageList]
    render json: dataSent
  end
end

# {[...Array(5)].map((e, i) => {
#         if (this.props.totalPages < 5 && this.props.totalPages > i) {
#           return <PageComponent key={i} pageNum={i+1} viewCount={this.props.viewCount} />
#         } else if (this.props.currPage < 3 && this.props.totalPages >= 5) {
#           return <PageComponent key={i} pageNum={i+1} viewCount={this.props.viewCount} />
#         } else if (this.props.currPage+3 > this.props.totalPages && this.props.totalPages >= 5) {
#           return <PageComponent key={i} pageNum={((this.props.totalPages-5)+i)+1} viewCount={this.props.viewCount} />
#         } else if (this.props.totalPages >= 5) {
#           return <PageComponent key={i} pageNum={((this.props.currPage-2)+i)+1} viewCount={this.props.viewCount} />
#         }
#       })}
