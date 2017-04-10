module ApplicationHelper
	def daily_alarm alarm
		if (Time.now.strftime( "%d" ) >  alarm.alarm_time.strftime( "%d" )) and (Time.now.strftime( "%H%M" )  >= alarm.alarm_time.strftime( "%H%M" ) and alarm.daily)
			alarm.advance_day!
			true
		else
			false
		end
	end

end
