class TorneosController < ApplicationController
  before_action :set_torneo, only: [:show, :update, :destroy]

  # GET /torneos
  # GET /torneos.json
  def index
    @torneos = Torneo.all
    render json: @torneos, status: :ok
  end

  # GET /torneos/1
  # GET /torneos/1.json
  def show
    @torneo= set_torneo
    render json: @torneo, status: :ok
  end

  def get_id
    @torneo = Torneo.find(params[:id])
    render json: @torneo, status: :ok
  end

  def numTournaments
    @torneo = Torneo.countTournaments()
    render json: @torneo, status: :ok
  end

  # POST /torneos
  # POST /torneos.json
  def create
    @torneo = Torneo.new(torneo_params)

    if @torneo.save
      render :show, status: :created, location: @torneo
    else
      render json: @torneo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /torneos/1
  # PATCH/PUT /torneos/1.json
  def update
    if @torneo.update(torneo_params)
      render :show, status: :ok, location: @torneo
    else
      render json: @torneo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /torneos/1
  # DELETE /torneos/1.json
  def destroy
    @torneo.destroy
  end

  def my_tournaments
    @user = User.find(params[:user_name])
    @torneo = Torneo.searchByOrganizador(@user.user_name)
    render json: @equipo, status: :ok
  end

  def name_tournaments
    @torneo = Torneo.searchByName(params[:name])
    render json: @torneo, status: :ok

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torneo
      @torneo = Torneo.find_by(nombre: params[:nombre])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def torneo_params
      params.permit( :fecha,
      :premio,
      :deporte_id,
      :organizador_name,
      :nombre,
      :ubicacion_id
      )
    end
end
