class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.datetime :date
    end
  end
end
