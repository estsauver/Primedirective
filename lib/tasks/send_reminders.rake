desc "Sends product reminders for the week" 
task :send_reminders => :environment do 
  Reminder.send_reminders
end
