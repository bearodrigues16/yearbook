class UploadFoto < ActiveRecord::Migration
  def change
  end
  
  def self.up
  	add_column :avatar, :version_comment, :binary, :limit => 10.megabyte
  end

  def self.down
  	remove_column :avatar, :version_comment
  end
end
