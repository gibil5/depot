# 
# 	Controller Test 
# 	J. Revilla
# 	Created: 	22 Dec 2019
# 	Last: 		id. 
#

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest


	# Setup
	setup do
		#puts()
		#puts('Setup Product - jx')

		@product = products(:one)
	end


	# Show
	test "should show product" do
		puts()
		puts()
		puts()
		puts('Test Show')

		# Get

		#get product_url(@product)


		puts('Get product URL')
		res = get product_url(@product)
		puts(res)



		puts('Assert response')
		res = assert_response :success
		puts(res)

		puts('mark 2')
		puts()
		puts()
		puts()
	end

end

