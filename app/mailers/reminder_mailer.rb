class ReminderMailer < ActionMailer::Base
  default from: "info@zengifting.com"
  default subject: "Event Reminder"
  def event_reminder(reminder_id)
    @reminder = Reminder.includes([:user, :product]).find(reminder_id)
    @reminder.sent = true
    @reminder.save validate: false
    puts "Sending Mailer #{@reminder.id}"
    mail(to: @reminder.user.email)
  end

  def self.send_list list_of_ids
    list_of_ids.each do |id|
      self.event_reminder(id).deliver
    end

  end
end
