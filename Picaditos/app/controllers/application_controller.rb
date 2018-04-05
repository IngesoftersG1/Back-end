class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Knock::Authenticable
  ##protect_from_forgery with: :exception
  
end
