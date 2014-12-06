class User < ActiveRecord::Base

	validates :login, :senha, :foto, :nome, :cidade, :estado, :email, :descricao, :presence => true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

end
