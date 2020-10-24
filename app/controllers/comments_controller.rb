class CommentsController < ApplicationController

PER = 9


  def index
    #@users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(9)
  end
end
