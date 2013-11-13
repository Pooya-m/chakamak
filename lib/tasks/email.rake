namespace :email do
	desc "TODO"
	task notify_recent_poems: :environment do
		if Time.now.friday?
			poems = Poem.get_weekly_poems
			User.all.each do |user|
				WeeklyMailer.weekly_notification(user,poems).deliver
			end
		end
	end
end
