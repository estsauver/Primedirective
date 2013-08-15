class Reminder < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  def self.send_reminders
    #This is called via rake on a cron scheduler.
    ReminderMailer.send_list(reminders_to_send) 
  end

  private
  def self.reminders_to_send 
    self.select(:id).where("sent = FALSE AND date < ?", 8.days.from_now).map(&:id)
  end

end
