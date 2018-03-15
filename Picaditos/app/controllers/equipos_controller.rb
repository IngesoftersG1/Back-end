class EquiposController < ApplicationController
  before_action :set_equipo, only: [:show, :update, :destroy]

  # GET /equipos
  # GET /equipos.json
  def index
    @equipos = Equipo.all
  end

  # GET /equipos/1
  # GET /equipos/1.json
  def show
  end

  # POST /equipos
  # POST /equipos.json
  def create
    @equipo = Equipo.new(equipo_params)

    if @equipo.save
      render :show, status: :created, location: @equipo
    else
      render json: @equipo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipos/1
  # PATCH/PUT /equipos/1.json
  def update
    if @equipo.update(equipo_params)
      render :show, status: :ok, location: @equipo
    else
      render json: @equipo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipos/1
  # DELETE /equipos/1.json
  def destroy
    @equipo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipo
      @equipo = Equipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipo_params
      params.fetch(:equipo, {})
    end
end
