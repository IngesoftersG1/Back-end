# == Schema Information
#
# Table name: mensajes
#
#  id             :integer          not null, primary key
#  contenido      :text
#  user_id        :string
#  fecha          :date
#  asunto         :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  usuario_2_name :string
#

class Mensaje < ApplicationRecord
  belongs_to :user, optional: true
  validates :contenido, presence: {with: true, message: "El cuerpo del mensaje no puede estar vacío"}

  #Queries
  #Buscar los mensajes que se han enviado entre dos fechas "start" y "end_" y cuyo remitente tiene como user_name "origin"
  def self.searchByAuthorAndDate(start,end_,origin)
    @mensaje = Mensaje.where("fecha >= ? AND fecha <= ? AND user_id LIKE ?", start,end_,origin).pluck(:fecha, :user_id, :usuario_2_name, :asunto, :contenido)
  end

  #Buscar los mensajes que se han enviado entre dos fechas "start" y "end_" y cuyo destinatario tiene como user_name "origin"
  def self.searchByReceptorAndDate(start,end_,origin)
    @mensaje = Mensaje.where("fecha >= ? AND fecha <= ? AND usuario_2_name LIKE ?", start,end_,origin).pluck(:fecha, :user_id, :usuario_2_name, :asunto, :contenido)
  end

  def self.searchByReceptor(origin)
    @mensaje = Mensaje.where("usuario_2_name LIKE ?", origin)
  end


  #Buscar los mensajes cuyo asunto contiene la cadena "subject" en algun lugar
  def self.searchBySubject(subject)
    @mensaje = Mensaje.where("asunto LIKE ?", "%#{subject}%")
  end
  
  def self.unreadMessages(user_name)
    @mensaje= Mensaje.where('usuario_2_name = ? AND read = ?',user_name,false).length
  end


end
