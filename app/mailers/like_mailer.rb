
class LikeMailer < ActionMailer::Base
  default from: "notifications@example.com"

  def match_email(user, pair)
    @user = user
    @pair = pair
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You have matched with someone')
  end
end
