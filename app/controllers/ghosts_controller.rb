class GhostsController < ApplicationController



	# Show
	def show
		puts
		puts('Reniec - Show')
		
		puts(params)
		#puts(params[:message])
		#puts(params[:format])


		# Init
		dni='09817194'


		# New
		#reniec_creator = ReniecCreator.new(params[:message])
		reniec_creator = ReniecCreator.new(dni)

		

		#reniec_creator.send_dni()
		#@data_first, @data_second = reniec_creator.send_dni()
		@data_first, @data_second, @data_names, @data_address, @data_status, @data_restrictions, @data_ubigeo, @data_photo = reniec_creator.send_dni()


		puts('mark 11')
		puts(@data_first)
		puts(@data_second)


	
		# Dep
		#send_reniec(dni)
	end
	

end
