require 'test_helper'

class DedochesControllerTest < ActionController::TestCase
  setup do
    @dedoch = dedoches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dedoches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dedoch" do
    assert_difference('Dedoche.count') do
      post :create, dedoch: { code: @dedoch.code, description: @dedoch.description, image: @dedoch.image, name: @dedoch.name, price: @dedoch.price, stock: @dedoch.stock }
    end

    assert_redirected_to dedoch_path(assigns(:dedoch))
  end

  test "should show dedoch" do
    get :show, id: @dedoch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dedoch
    assert_response :success
  end

  test "should update dedoch" do
    patch :update, id: @dedoch, dedoch: { code: @dedoch.code, description: @dedoch.description, image: @dedoch.image, name: @dedoch.name, price: @dedoch.price, stock: @dedoch.stock }
    assert_redirected_to dedoch_path(assigns(:dedoch))
  end

  test "should destroy dedoch" do
    assert_difference('Dedoche.count', -1) do
      delete :destroy, id: @dedoch
    end

    assert_redirected_to dedoches_path
  end
end
