class MensajesController < ApplicationController
  before_action :set_mensaje, only: [:show, :update, :destroy]

  # GET /mensajes
  # GET /mensajes.json
  def index
    @mensajes = Mensaje.all
  end

  # GET /mensajes/1
  # GET /mensajes/1.json
  def show
  end

  # POST /mensajes
  # POST /mensajes.json
  def create
    @mensaje = Mensaje.new(mensaje_params)

    if @mensaje.save
      render :show, status: :created, location: @mensaje
    else
      render json: @mensaje.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mensajes/1
  # PATCH/PUT /mensajes/1.json
  def update
    if @mensaje.update(mensaje_params)
      render :show, status: :ok, location: @mensaje
    else
      render json: @mensaje.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mensajes/1
  # DELETE /mensajes/1.json
  def destroy
    @mensaje.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensaje
      @mensaje = Mensaje.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensaje_params
      params.fetch(:mensaje, {})
    end
end