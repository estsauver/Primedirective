class AddEventAndSentToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :event, :string
    add_column :reminders, :sent, :boolean, index: true, default: false
  end
end
