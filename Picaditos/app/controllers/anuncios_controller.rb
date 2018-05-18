class AnunciosController < ApplicationController
  before_action :set_anuncio, only: [:show, :update, :destroy]

  # GET /anuncios
  # GET /anuncios.json
  def index
    @anuncios = Anuncio.all
    render json: @anuncios, status: :ok
  end

  # GET /anuncios/1
  # GET /anuncios/1.json
  def show
    @anuncio= set_anuncio
    render json: @anuncio, status: :ok
  end

  def numAnnounces
    @anuncio = Anuncio.countAnnounces()
    render json: @anuncio, status: :ok
  end

  # POST /anuncios
  # POST /anuncios.json
  def create

    @anuncio = Anuncio.new(anuncio_params)

    if @anuncio.save
      render :show, status: :created, location: @anuncio
    else
      render json: @anuncio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /anuncios/1
  # PATCH/PUT /anuncios/1.json
  def update
    @anuncio = Anuncio.find params[:id]
    if @anuncio.update(anuncio_params)
      render :show, status: :ok, location: @anuncio
    else
      render json: @anuncio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /anuncios/1
  # DELETE /anuncios/1.json
  def destroy
    @anuncio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anuncio
      @anuncio = Anuncio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anuncio_params
      params.permit(:id,
        :tipo,
      :enlace,
      :fecha_inicio,
      :fecha_fin,
      :descripcion,
      :tablon_id,
      :autor_name
      )
    end
end
