class AlarmsController < ApplicationController
  def index
    @time = Time.now
    @alarms = Alarm.all
    @available_days = available_days
    Alarm.update_all(background: false)
  end

  def create
    alarm_time = "#{params[:day]}, #{params[:hour]}:#{params[:minute]} #{params[:period]}"
    alarm = Alarm.new(alarm_time: alarm_time)
    alarm.save
    alarm.update_attributes(fired: alarm.fired + 1) if Time.now > alarm.alarm_time # Don't play alarm if set in the past
    redirect_to :root
  end

  def set_daily
    alarm = Alarm.find params[:id]
    alarm.update_attributes(daily: alarm.daily.nil? ? true : !alarm.daily) # toggle
    alarm.update_attributes(weekly: false) if alarm.daily
    redirect_to :root
  end

  def set_weekly
    alarm = Alarm.find params[:id]
    alarm.update_attributes(weekly: alarm.weekly.nil? ? true : !alarm.weekly)
    alarm.update_attributes(daily: false) if alarm.weekly
    redirect_to :root
  end

  def delete
    alarm = Alarm.find params[:id]
    alarm.destroy
    redirect_to :root
  end

  def snooze
    alarm = Alarm.find params[:id]
    alarm.update_attributes(alarm_time: Time.now.advance(minutes: 15), fired: 0)
    redirect_to :root
  end

  def set_background_tab
    Alarm.update_all(background: params[:value])
    render text: 'success'
  end

  def fired
    alarm = Alarm.find params[:id]
    alarm.update_attributes(fired: alarm.fired + 1)
    redirect_to :root
  end

  private
    def available_days
      @available_days = ["Monday", "Tuesday", "Wednesday", 
        "Thursday", "Friday", "Saturday", "Sunday"].split(Time.now.strftime("%A")).last
      @available_days.unshift(Time.now.strftime("%A"))

    end
end
