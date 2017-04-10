class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
    	t.boolean :daily
    	t.boolean :weekly
      t.timestamps null: false
    end
  end
end
