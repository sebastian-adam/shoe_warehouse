class ChangeTableType < ActiveRecord::Migration
  def change
    remove_column :stores, :open_time
    remove_column :stores, :close_time
    add_column :stores, :open_time, :varchar
    add_column :stores, :close_time, :varchar
  end
end
