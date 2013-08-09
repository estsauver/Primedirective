class CreateNewsletterRequest < ActiveRecord::Migration
  def change
    create_table :newsletter_requests do |t|
      t.string :email
    end
    add_index :newsletter_requests, :email
  end
end
