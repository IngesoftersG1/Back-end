class EquiposUsersController < ApplicationController
  

  # GET /equipos
  # GET /equipos.json
  def index
    @equipos_users = EquiposUsers.all
    render json: @equipos_users, status: :ok
  end
  
  

  # POST /equipos
  # POST /equipos.json
  def create
    @equipo_users = EquiposUsers.new(equipos_users_params)

    if @equipo_users.save
      
    else
      render json: @equipo_users.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /equipos/1
  # PATCH/PUT /equipos/1.json
  def update
    @equipo = Equipo.find params[:id]
    if @equipo.update(equipo_params)
      render :show, status: :ok, location: @equipo
    else
      render json: @equipo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /equipos/1
  # DELETE /equipos/1.json
  def destroy
    @equipo = set_equipo,
    @equipo.destroy
  end
  
  def name_equipo
    @equipo = Equipo.searchByName(params[:name])
    render json: @equipo, status: :ok 

  end
  
  private
    # Use callbacks to share common setup or constraints between actions.

    
    # Never trust parameters from the scary internet, only allow the white list through.
    def equipos_users_params
      params.permit(:user_id,
      :equipo_id
      )
    end
end
