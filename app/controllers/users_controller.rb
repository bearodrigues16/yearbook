class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logado, only: [:welcome]
  before_action :naoLogado, only: [:new, :create]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def login

    users = User.where(login: params[:login], senha: params[:senha])

    if users[0] != nil && users[0] !=0
      session[:user_id] = users[0].id
      redirect_to "/users/welcome",status: :found

    else
      @message = "Usuário não cadastrado."
    end


   end
   def welcome

    usuario = User.find(session[:user_id])

    @nome = usuario.nome

   end

  def logout
    session[:user_id] = nil
    redirect_to "/", status: :found
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :senha, :foto, :nome, :cidade, :estado, :email, :descricao)
    end
    def logado
      if session[:user_id] != nil && session[:user_id] != 0
      @estaLogado = true
      @usuario = User.find(session[:user_id])
      else
        redirect_to "/", status: :found
      end
    end
    def naoLogado
      if session[:user_id] != nil && session[:user_id] !=0
        redirect_to "/users/welcome", status: :found
      end
    end
end


