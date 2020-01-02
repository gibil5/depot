# 
# 	Model Test 
# 	J. Revilla
# 	Created: 	22 Dec 2019
# 	Last: 		 2 Jan 2020
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	# Using MiniTest - ActiveSupport::TestCase is a subclass of the MiniTest::Test class
	# Minitest is a small and incredibly fast unit testing framework supporting:
	#  	TDD, BDD, mocking, and benchmarking. 

	puts()
	puts('Product Test - Begin')


	# test "the truth" do
	#   assert true
	# end



	# Test 1 - Attributes
	puts('Test 1 - Attributes')

	#test "product attributes must not be empty" do  	# Both are valid
	def product_attributes_must_not_be_empty

		# Instance
		product = Product.new

		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end



	# Test 2 - Price
	puts('Test 2 - Price')
	test "product price must be positive" do

		# Instance
		product = Product.new(	title: "My Book Title",
								description: "yyy",
								image_url: "zzz.jpg")

		# Test Case 1 - Invalid
		product.price = -1
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
		product.errors[:price]
		
		# Test Case 2 - Invalid
		product.price = 0
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
		product.errors[:price]

		# Test Case 3 - Valid
		product.price = 1
		assert product.valid?
	end




	# Test 3 - Image Url
	puts('Test 3 - Image Url')

	# Helper
	def new_product(image_url)
		Product.new(	title: "My Book Title",
						description: "yyy",
						price: 1,
						image_url: image_url)
	end
	
	test "image url" do

		# Test Case 1 - Valid
		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }

		# Test Case 2 - Invalid
		bad = %w{ fred.doc fred.gif/more fred.gif.more }

		ok.each do |image_url|
			assert new_product(image_url).valid?, "#{image_url} shouldn't be invalid"  	# Error message if fail
		end
		bad.each do |image_url|
			assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"	# Id
		end
	end



	# Test 4 - Model uniqueness



	puts('Product Test - End')
end
