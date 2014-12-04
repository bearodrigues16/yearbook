class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :senha
      t.string :foto
      t.string :nome
      t.string :cidade
      t.string :estado
      t.string :email
      t.string :descricao

      t.timestamps
    end
  end
end
