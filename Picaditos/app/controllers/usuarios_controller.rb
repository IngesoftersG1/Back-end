class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
    @usuarios = Usuario.paginate(:page => params[:page])
    render json: @usuarios, status: :ok
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario= set_usuario
    @usuario = Usuario.paginate(:page => params[:page])
    render json: @usuario, status: :ok
    ## perform a paginated query:
    

  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      render :show, status: :created, location: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    if @usuario.update(usuario_params)
      render :show, status: :ok, location: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.permit( :user_name, 
      :nombres,
      :apellidos,
      :correo_electronico, 
      :telefono,
      :ubicacion_id,
      :fecha_nacimiento,
      :page
      )
    end
end
