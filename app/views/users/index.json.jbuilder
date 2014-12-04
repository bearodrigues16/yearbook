json.array!(@users) do |user|
  json.extract! user, :id, :login, :senha, :foto, :nome, :cidade, :estado, :email, :descricao
  json.url user_url(user, format: :json)
end
