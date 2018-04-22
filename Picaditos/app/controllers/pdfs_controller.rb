class  PdfsController  <  ActionController::Base
	def  show_deporte
		respond_to do |format|
			@deporte = Deporte.find(params[:id])
			format.pdf do
				render pdf: "template", template: "../views/pdfs/template_deporte.html.erb"  
			end

		end

	end
	
	def get_model
	    @user = User.find(params[:id])
    end
end
