class CreateStoresAndBrands < ActiveRecord::Migration
  def change
    create_table(:stores) do |t|
      t.string(:name)
      t.string(:location)
      t.string(:phone)
      t.time(:open_time)
      t.time(:close_time)

      t.timestamps()
    end

    create_table(:brands) do |t|
      t.string(:name)
      t.integer(:image)
      t.integer(:store_id)

      t.timestamps()
    end
  end
end
