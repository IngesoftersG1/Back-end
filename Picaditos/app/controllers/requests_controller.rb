class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
    render json: @requests, status: :ok
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = (set_request)
    render json: @request, status: :ok
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    if @request.save
      
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    if @request.update(request_params)
      render :show, status: :ok, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = (set_request)
    @request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.permit(:request_type,
        :user_id,
        :equipo_id,
        :torneo_id,
        :message 
        )
    end
end
