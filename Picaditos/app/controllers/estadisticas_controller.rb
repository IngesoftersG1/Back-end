class EstadisticasController < ApplicationController
  before_action :set_estadistica, only: [:show, :update, :destroy]

  # GET /estadisticas
  # GET /estadisticas.json
  def index
    @estadisticas = Estadistica.all
    render json: @estadisticas, status: :ok
  end

  # GET /estadisticas/1
  # GET /estadisticas/1.json
  def show
    @estadistica= (set_estadistica)
    render json: @estadistica, status: :ok
  end

  # POST /estadisticas
  # POST /estadisticas.json
  def create
    @estadistica = Estadistica.new(estadistica_params)

    if @estadistica.save
      render :show, status: :created, location: @estadistica
    else
      render json: @estadistica.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estadisticas/1
  # PATCH/PUT /estadisticas/1.json
  def update
    if @estadistica.update(estadistica_params)
      # Tell the User1Mailer to send a estadisticas show email after update
      User1Mailer.estadisticas_show(@estadistica.user_id).deliver_now
      render :show, status: :ok, location: @estadistica
    else
      render json: @estadistica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estadisticas/1
  # DELETE /estadisticas/1.json
  def destroy
    @estadistica.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estadistica
      @estadistica = Estadistica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estadistica_params
      params.permit(
        :user_id,
        :equipo_id,
      )
    end
end
