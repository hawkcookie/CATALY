class MessagesController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(:user_id => current_user.id))
      redirect_to "/rooms/#{@message.room_id}"
      @message.create_notification_message!(current_user,@message.id)
    else
      redirect_back(fallback_location: root_path)
    end


end







#def create
#  @Message = current_user.likes.build(message_params)
#  @post = @message.content
#  @like.save
#  post = Post.find(params[:post_id])
  # ここから
#  @message.create_notification_message!(current_user)
  # ここまで
#  respond_to :js
#end

  #def create
  #@message = Message.new(Message_params)
  #@post = @message.post
  #if @message.save
    # ここから
  #  @post.create_notification_message!(current_user, @message.id)
    # ここまで
  #  respond_to :js
  #else
  #  render 'posts/show'
  #end
  #end


end
