class UsersController < ApplicationController
  include Knock::Authenticable
  #before_action :authenticate_user
  #before_action :set_user, only: [:index]
  # GET /user
  # GET /users.json
  def index
      #before_action :authenticate_user
      #if current_user.admin?
        @users = User.all
        render json: @users, status: :ok
      #else
       # render json: [], status: :unauthorized
      #end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user= set_user
    render json: @user, status: :ok

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # Tell the User1Mailer to send a welcome email after save
        User1Mailer.welcome_email(@user).deliver_now
        format.html{redirect_to(@user, notice: 'El usuario fue creado correctamente.') }
        format.json {render json: @user, status: :created, location: @user}
      else
        #format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      # Tell the User1Mailer to send a password email after save
      User1Mailer.password_email(@user).deliver_now
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def numUsers
    @user = User.countUsers()
    render json: @user, status: :ok
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    before_action :authenticate_user
    @user.destroy
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.permit( :user_name,
      :nombres,
      :apellidos,
      :email,
      :telefono,
      :ubicacion_id,
      :fecha_nacimiento,
      :page,
      :password,
      :password_confirmation,
      :picture
      )
    end
end
