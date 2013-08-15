class RemindersController < ApplicationController 
  before_action :redirect_visitors

  def create
    @reminder = current_user.reminders.create(reminder_params)
    if @reminder.save
      flash[:success] = "Reminder created!"
      redirect_to(:back)
    end
  end
  private
  def reminder_params
    puts params[:reminder][:date]
    params.require(:reminder).permit(:date, :event, :product_id)
  end

  def redirect_visitors
    if current_user 
      return true
    else
      flash[:notice] = "Please login or signup first!"
      redirect_to sign_up_path
    end
  end
end
