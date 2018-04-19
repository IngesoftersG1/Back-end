Knock::AuthTokenController.class_eval do

  def create
      
    @user=User.find_by(email: params[:auth][:email])
    render json: {
        jwt: auth_token.token,
        user: @user
      }, status: :created
    
  end

end