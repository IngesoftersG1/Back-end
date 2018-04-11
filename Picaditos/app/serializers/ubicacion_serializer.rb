class UbicacionSerializer < ActiveModel::Serializer
  attributes :calle_principal, :calle_secundaria, :localidad, :ciudad
end
