class UbicacionsController < ApplicationController
  before_action :set_ubicacion, only: [:show, :update, :destroy]

  # GET /ubicacions
  # GET /ubicacions.json
  def index
    @ubicacions = Ubicacion.all
    render json: @ubicacions, status: :ok
  end

  # GET /ubicacions/1
  # GET /ubicacions/1.json
  def show
    @ubicacion= set_ubicacion
    render json: @ubicacion, status: :ok
  end

  # POST /ubicacions
  # POST /ubicacions.json
  def create
    @ubicacion = Ubicacion.new(ubicacion_params)

    if @ubicacion.save
      render :show, status: :created, location: @ubicacion
    else
      render json: @ubicacion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ubicacions/1
  # PATCH/PUT /ubicacions/1.json
  def update
    if @ubicacion.update(ubicacion_params)
      render :show, status: :ok, location: @ubicacion
    else
      render json: @ubicacion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ubicacions/1
  # DELETE /ubicacions/1.json
  def destroy
    @ubicacion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacion
      @ubicacion = Ubicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ubicacion_params
      params.fetch(:ubicacion, {})
    end
end
