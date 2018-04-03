require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      def params
          { product: { description: '2333', image_url: 'http://foo.jpg', price: 16, title: '1222' } }
      end
      post products_url, params: params
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    a = Product.first.dup
    Product.destroy_all
    @product = Product.create! a.as_json(except: ["id"])
    patch product_url(id: @product.id), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
    assert_redirected_to products_url(@product.id)
  end

  test "should destroy product" do
    assert_difference('Product.count', 0) do
        delete product_url(id: @product.id)
    end

    assert_redirected_to products_url
  end

  test "can't delete product in cart" do
    assert_difference('Product.count',0) do
      delete product_url(products(:two))
    end
    assert_redirected_to products_url
  end


end
