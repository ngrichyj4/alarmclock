class Alarm < ActiveRecord::Base

	def advance!
		difference = Time.now.strftime("%d").to_i - self.alarm_time.strftime("%d").to_i
		self.update_attributes(alarm_time: self.alarm_time.advance(days: difference))
	end
end
