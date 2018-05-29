class UserSignInController < ApplicationController

    def googlesign
        validator = GoogleIDToken::Validator.new
        begin
            puts 'aca'
            aud = "506449915249-mpnernms8pplsn9m3m1mnlsgvphj3km9.apps.googleusercontent.com"
            data = validator.check(params[:TokenId],aud)
            user = User.where(email: data['email']).first
            puts'ddkkfk'

            if user
                render json: {"user_name": user.user_name,"email": user.email}, status: :created
            else
                user_new = User.new()
                user_new.nombres = data['given_name']
                user_new.apellidos = data['family_name']
                user_new.email = data['email']
                user_new.fecha_nacimiento = '2000-04-01'
                user_new.user_name = data['given_name']


                if user_new.save(validate: false)
                    User1Mailer.welcome_email(user_new).deliver_now
                    render json: {"user_name": user_new.user_name,"email": user_new.email}, status: :created
                else
                    render json: user_new.errors, status: :unprocessable_entity
                end

            end
        rescue GoogleIDToken::ValidationError => e
            render json: {"Error": e} , status: :unauthorized
        end
    end

end
