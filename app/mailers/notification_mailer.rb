class NotificationMailer < ApplicationMailer
  def send_mail(user)
    @user = user
    mail(
      from: 'cataly.contact@gmail.com',
      to: @user.email,
      subject: 'メッセージ が届きました'
    )
  end
end
