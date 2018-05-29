class Request < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :equipo, optional: true
    belongs_to :torneo, optional: true
    belongs_to :ubicacion, optional: true

    def self.pendingRequestsEq(equipo_id)
    @request= Request.where('request_type = ? AND equipo_id = ?' ,"User_to_equipo", equipo_id).length + Request.where('request_type = ? AND equipo_partido_id = ?' ,"Equipo_to_equipo", equipo_id).length
  end
  
  def self.pendingRequestsTo(torneo_id)
    @request= Request.where('request_type = ? AND torneo_id = ?' ,"Equipo_to_torneo", torneo_id).length
  end
    
    def self.requestsForEquipoFromEquipo(equipo_id)
    @request= Request.where('(request_type = ? AND equipo_partido_id = ?)', "Equipo_to_equipo", equipo_id)
  end

  def self.requestsForEquipoFromUser(equipo_id)
    @request= Request.where('(request_type = ? AND equipo_id = ?)' ,"User_to_equipo", equipo_id)
  end

  def self.requestsForTorneo(torneo_id)
    @request= Request.where('request_type = ? AND torneo_id = ?' ,"Equipo_to_torneo", torneo_id)
  end
  
  def self.requestsForUserFromEquipo(user_id)
    @request= Request.where('(request_type = ? AND user_id = ?)' ,"Equipo_to_user", user_id)
  end
  
  def self.pendingRequestsUser(user_id)
    @request= Request.where('(request_type = ? AND user_id = ?)' ,"Equipo_to_user", user_id).length
  end
  
end 

  
