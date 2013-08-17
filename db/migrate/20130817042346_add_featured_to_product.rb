class AddFeaturedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :featured, :bool, default: false
    add_index :products, :featured
  end
end
