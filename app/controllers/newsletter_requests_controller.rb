class NewsletterRequestsController < ApplicationController
  def create
    @request = NewsletterRequest.new(newsletter_params)
    if @request.save
      flash[:success] = "Thanks for signing up!"
    end

    redirect_to(:back)
  end
  private 

  def newsletter_params
    puts params
    params.require(:newsletter_request).permit(:email)
  end
end

