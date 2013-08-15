require 'sepc_helper'


describe Reminder do 
  it "should not select it as an email to send" do 
    reminder = create(:reminder, date: 10.days.from_now)
    expect(Reminder.reminders_to_send.include?(reminder.id)).to eq(false)
  end
end
