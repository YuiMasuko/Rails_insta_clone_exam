class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "yui.t.tom@gmail.com", subject: "投稿確認メール"
  end
end
