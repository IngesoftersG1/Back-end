class CanchasController < ApplicationController
  before_action :set_cancha, only: [:show, :update, :destroy]

  # GET /canchas
  # GET /canchas.json
  def index
    @canchas = Cancha.all
    render json: @canchas, status: :ok
  end

  # GET /canchas/1
  # GET /canchas/1.json
  def show
    @cancha= set_cancha
    render json: @cancha, status: :ok
  end

  def numFields
    @cancha = Cancha.countFields()
    render json: @cancha, status: :ok
  end

  def numFieldsAvailable
    @cancha = Cancha.searchIfAvailable()
    render json: @cancha, status: :ok
  end


  # POST /canchas
  # POST /canchas.json
  def create
    @cancha = Cancha.new(cancha_params)

    if @cancha.save
      render :show, status: :created, location: @cancha
    else
      render json: @cancha.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /canchas/1
  # PATCH/PUT /canchas/1.json
  def update
    if @cancha.update(cancha_params)
      render :show, status: :ok, location: @cancha
    else
      render json: @cancha.errors, status: :unprocessable_entity
    end
  end

  # DELETE /canchas/1
  # DELETE /canchas/1.json
  def destroy
    @cancha.destroy
  end

  def canchas_disp
    @cancha = Cancha.searchIfAvailable(@cancha.disponibilidad)
    render json: @cancha, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cancha
      @cancha = Cancha.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cancha_params
      params.permit( :disponibilidad,
      :precio,
      :usuario_id,
      :ubicacion_id,
      :nombre
      )
    end
end
