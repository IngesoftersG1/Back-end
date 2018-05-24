class Request < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :equipo, optional: true
    belongs_to :torneo, optional: true

    def self.pendingRequestsEq(equipo_id)
    @request= Request.where('request_type = ? AND equipo_id = ?' ,"User_to_equipo", equipo_id).length
  end
  
  def self.pendingRequestsTo(torneo_id)
    @request= Request.where('request_type = ? AND torneo_id = ?' ,"Equipo_to_torneo", torneo_id).length
  end
    
    def self.requestsForEquipo(equipo_id)
    @request= Request.where('request_type = ? AND equipo_id = ?' ,"User_to_equipo", equipo_id)
  end
  def self.requestsForTorneo(torneo_id)
    @request= Request.where('request_type = ? AND torneo_id = ?' ,"Equipo_to_torneo", torneo_id)
  end
end
