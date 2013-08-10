class NewsletterRequest < ActiveRecord::Base
  validates :email, uniqueness: true
  before_save :mailchimp_subscribe

  protected 
  def mailchimp_subscribe
    gb = Gibbon::API.new
    begin
      gb.lists.subscribe({:id => "be2fd96f18", :email => {:email => email}})
    rescue Exception => msg
      logger.info "Newsletter Request Failed with #{msg}"
      return false
    end
    return true
  end
end
