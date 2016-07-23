class CreateBrandsStores < ActiveRecord::Migration
  def change
    create_join_table(:brands, :stores) { }
  end
end
