# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def notification
    @user = User.find_by(id: params[:id])
    NotificationMailer.send_mail(@user)
  end
end
