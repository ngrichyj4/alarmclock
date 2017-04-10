module ApplicationHelper
	def daily_alarm alarm
		if (Time.now.strftime( "%d" ) >  alarm.alarm_time.strftime( "%d" )) and (Time.now.strftime( "%H%M" )  >= alarm.alarm_time.strftime( "%H%M" ) and alarm.daily)
			alarm.advance!
			true
		else
			false
		end
	end

	def weekly_alarm alarm
		if (1.week.ago >= alarm.alarm_time) and (Time.now.strftime( "%H%M" )  >= alarm.alarm_time.strftime( "%H%M" ) and alarm.weekly)
			alarm.advance!
			true
		else
			false
		end
	end

end
