class  PdfsController  <  ActionController::Base
	def  show
		respond_to do |format|
			format.pdf do
				render pdf: "template", template: "../views/pdfs/template"  
			end

		end

	end
	
	def get_model
	    @users =     User.all
    end
end
