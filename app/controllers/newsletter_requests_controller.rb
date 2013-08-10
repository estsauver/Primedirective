class NewsletterRequestsController < ApplicationController
  def create
    @request = NewsletterRequest.new(newsletter_params)
    if @request.save
      flash[:success] = "Thanks for signing up!"
    else
      flash[:alert] = "Sorry, that email didn't look right. Did you mistype something?"
    end

    redirect_to(:back)
  end
  private 

  def newsletter_params
    params.require(:newsletter_request).permit(:email)
  end
end

