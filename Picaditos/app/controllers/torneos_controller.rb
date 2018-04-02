class TorneosController < ApplicationController
  before_action :set_torneo, only: [:show, :update, :destroy]

  # GET /torneos
  # GET /torneos.json
  def index
    @torneos = Torneo.all
  end

  # GET /torneos/1
  # GET /torneos/1.json
  def show
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torneo
      @torneo = Torneo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def torneo_params
      params.fetch(:torneo, {})
    end
end
