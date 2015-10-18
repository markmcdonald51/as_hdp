require 'test_helper'

class ItemMeasurementsControllerTest < ActionController::TestCase
  setup do
    @item_measurement = item_measurements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_measurements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_measurement" do
    assert_difference('ItemMeasurement.count') do
      post :create, item_measurement: { item_id: @item_measurement.item_id, unit_of_measurement_id: @item_measurement.unit_of_measurement_id }
    end

    assert_redirected_to item_measurement_path(assigns(:item_measurement))
  end

  test "should show item_measurement" do
    get :show, id: @item_measurement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_measurement
    assert_response :success
  end

  test "should update item_measurement" do
    patch :update, id: @item_measurement, item_measurement: { item_id: @item_measurement.item_id, unit_of_measurement_id: @item_measurement.unit_of_measurement_id }
    assert_redirected_to item_measurement_path(assigns(:item_measurement))
  end

  test "should destroy item_measurement" do
    assert_difference('ItemMeasurement.count', -1) do
      delete :destroy, id: @item_measurement
    end

    assert_redirected_to item_measurements_path
  end
end
