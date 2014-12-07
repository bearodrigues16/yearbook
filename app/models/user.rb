class User < ActiveRecord::Base

	validates :login, :senha, :avatar, :nome, :cidade, :estado, :email, :descricao, :presence => true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :login, :email, uniqueness: true
end
