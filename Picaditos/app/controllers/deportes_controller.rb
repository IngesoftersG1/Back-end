class DeportesController < ApplicationController
  before_action :set_deporte, only: [:show, :update, :destroy]

  # GET /deportes
  # GET /deportes.json
  def index
    @deportes = Deporte.all
    render json: @deportes, status: :ok 
    @deportes = Deporte.paginate(:page => params[:page])
  end

  # GET /deportes/1
  # GET /deportes/1.json
  def show
    @deporte= set_deporte
    render json: @deporte, status: :ok

  end

  # POST /deportes
  # POST /deportes.json
  def create
    @deporte = Deporte.new(deporte_params)

    if @deporte.save
      render :show, status: :created, location: @deporte
    else
      render json: @deporte.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deportes/1
  # PATCH/PUT /deportes/1.json
  def update
    @deporte = Deporte.find params[:id]
    if @deporte.update(deporte_params)
      render :show, status: :ok, location: @deporte
    else
      render json: @deporte.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deportes/1
  # DELETE /deportes/1.json
  def destroy
    @deporte.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deporte
      @deporte = Deporte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deporte_params
      params.permit(:descripcion,
      :min_jugadores, 
      :nombre, 
      :page
      )
    end
end
