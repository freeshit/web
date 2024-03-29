require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { claimed: @item.claimed, claimed_at: @item.claimed_at, claimer_id: @item.claimer_id, description: @item.description, image_url: @item.image_url, lat: @item.lat, lon: @item.lon, tracker_count: @item.tracker_count, user_id: @item.user_id }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    put :update, id: @item, item: { claimed: @item.claimed, claimed_at: @item.claimed_at, claimer_id: @item.claimer_id, description: @item.description, image_url: @item.image_url, lat: @item.lat, lon: @item.lon, tracker_count: @item.tracker_count, user_id: @item.user_id }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end
