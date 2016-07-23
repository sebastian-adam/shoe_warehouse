class CreateBrandsStores < ActiveRecord::Migration
  def change
    create_join_table(:brands, :stores) do |t|
      t.timestamps()
    end
  end
end
