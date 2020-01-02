


	# Index
	test "should get index" do
		get products_url
		assert_response :success
	end


	# Get new
	test "should get new" do
		get new_product_url
		assert_response :success
	end


	# Create
	test "should create product" do
		assert_difference('Product.count') do
			post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
		end

		assert_redirected_to product_url(Product.last)
	end





	# Edit
	test "should get edit" do
		get edit_product_url(@product)
		assert_response :success
	end


	# Update
	test "should update product" do
		patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
		assert_redirected_to product_url(@product)
	end


	# Destroy
	test "should destroy product" do
		assert_difference('Product.count', -1) do
			delete product_url(@product)
		end

		assert_redirected_to products_url
	end


