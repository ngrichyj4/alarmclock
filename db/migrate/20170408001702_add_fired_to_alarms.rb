class AddFiredToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :fired, :integer, default: 0
  end
end
