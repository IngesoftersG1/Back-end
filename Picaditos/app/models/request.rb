class Request < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :equipo, optional: true
    belongs_to :torneo, optional: true
end
