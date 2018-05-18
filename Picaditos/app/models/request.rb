class Request < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :equipo, optional: true
    belongs_to :torneo, optional: true

    def self.pendingRequests(equipo_id)
    @request= Request.where('request_type = ? AND equipo_id = ?' ,"User_to_equipo", equipo_id).length
  end

end
