class Deporte < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :usuario
end
