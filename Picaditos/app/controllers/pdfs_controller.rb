class  PdfsController  <  ActionController::Base
	def  show
		respond_to do |format|
			@user = User.find(params[:user_name])
			format.pdf do
				render pdf: "template", template: "../views/pdfs/template.html.erb"  
			end

		end

	end
	
	def get_model
	    @user = User.find(params[:id])
    end
end
