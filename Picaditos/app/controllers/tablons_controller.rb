class TablonsController < ApplicationController
  before_action :set_tablon, only: [:show, :update, :destroy]

  # GET /tablons
  # GET /tablons.json
  def index
    @tablons = Tablon.all
    render json: @tablons, status: :ok
  end

  # GET /tablons/1
  # GET /tablons/1.json
  def show
    @tablon= set_tablon
    render json: @tablon, status: :ok
  end

  # POST /tablons
  # POST /tablons.json
  def create
    @tablon = Tablon.new(tablon_params)

    if @tablon.save
      render :show, status: :created, location: @tablon
    else
      render json: @tablon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tablons/1
  # PATCH/PUT /tablons/1.json
  def update
    @tablon = Tablon.find params[:id]
    if @tablon.update(tablon_params)
      render :show, status: :ok, location: @tablon
    else
      render json: @tablon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tablons/1
  # DELETE /tablons/1.json
  def destroy
    @tablon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tablon
      @tablon = Tablon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tablon_params
      params.permit(:titulo_tablon,
      :id 
      )
    end
end
