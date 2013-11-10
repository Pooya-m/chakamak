class WeeklyMailer < ActionMailer::Base
  default from: "info@chakamak.ir"

  def weekly_notification(user,poems)
  	@user = user
  	@poems = poems
  	@url = 'http://chakamak.ir/poems'
  	mail(to: @user.email, subject: "ابیات ثبت شده در این هفته")
  end
end
