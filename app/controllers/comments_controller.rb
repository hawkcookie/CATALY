class CommentsController < ApplicationController
  PER = 6

  def index
    # @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).where(consalting: 'はい').order(current_sign_in_at: :desc).page(params[:page]).per(6)
  end
end
