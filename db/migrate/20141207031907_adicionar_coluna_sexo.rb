class AdicionarColunaSexo < ActiveRecord::Migration
  def change
  	add_column :users, :sexo, :boolean
  end
end
