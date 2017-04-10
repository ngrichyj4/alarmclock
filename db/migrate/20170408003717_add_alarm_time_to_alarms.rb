class AddAlarmTimeToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :alarm_time, :datetime
  end
end
