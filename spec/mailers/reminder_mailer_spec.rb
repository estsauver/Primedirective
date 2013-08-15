require "spec_helper"

describe ReminderMailer do
  before(:each) do
    @user = create(:user)
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it "sends a user a mail when the date is in the next 8 days" do 
    reminder1 = create(:reminder, date: 7.days.from_now)
    reminder2 = create(:reminder, date: 1.days.from_now)
    Reminder.send_reminders
    expect(ActionMailer::Base.deliveries.size).to eq(2)
  end

  it "shouldn't sent mails when they've already been sent" do
    reminder1 = create(:reminder, sent: true)
    Reminder.send_reminders
    expect(ActionMailer::Base.deliveries.size).to eq(0)
  end

  it "shouldn't send emails when the time is substantially in the future" do
    reminder = create(:reminder, date:20.days.from_now)
    Reminder.send_reminders
    expect(ActionMailer::Base.deliveries.size).to eq(0)
  end
  
  it "should have a from at info@zengifting.com" do
    reminder = create(:reminder)
    ReminderMailer.event_reminder(reminder.id).deliver
    email = ActionMailer::Base.deliveries.last
    expect(email.from).to eq(["info@zengifting.com"])
  end
end
