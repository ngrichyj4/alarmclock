class AddBackgroundToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :background, :boolean
  end
end
