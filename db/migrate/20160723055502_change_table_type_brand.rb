class ChangeTableTypeBrand < ActiveRecord::Migration
  def change
    remove_column :brands, :image
    add_column :brands, :image, :varchar
  end
end
