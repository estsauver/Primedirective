class RemindersController < ApplicationController 
  def create
    @reminder = current_user.reminders.create(reminder_params)
    if @reminder.save
      flash[:success] = "Reminder created!"
      redirect_to(:back)
    end
  end
  private
  def reminder_params
    params.require(:reminder).permit(:date, :product_id)
  end
end
