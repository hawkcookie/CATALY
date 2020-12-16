class CommentsController < ApplicationController

PER = 9


  def index
    #@users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(6).order(current_sign_in_at: :desc)

# 登録ユーザー数の表示
    @all_users =User.all

  end
end
