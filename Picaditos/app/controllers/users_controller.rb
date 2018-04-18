class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @users = user.all
    render json: @users, status: :ok
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user= set_user
    render json: @user, status: :ok
    ## perform a paginated query:
    

  end

  # POST /users
  # POST /users.json
  def create
    @user = user.new(user_params)
    
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now
        format.html{redirect_to(@user, notice: 'El usuario fue creado correctamente.') }
        format.json {render json: @user, status: :created, location: @user}
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    before_action :authenticate_user
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
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
      @user = user.find(params[:id])
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
      :password_digest,
      :picture
      )
    end
end
