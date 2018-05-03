class TablonSerializer < ActiveModel::Serializer
  has_many :anuncios
  attributes :titulo_tablon
end
