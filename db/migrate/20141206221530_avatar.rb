class Avatar < ActiveRecord::Migration
  def change
  	add_column :users, :avatar, :binary, :limit => 10.megabyte
  end
end
