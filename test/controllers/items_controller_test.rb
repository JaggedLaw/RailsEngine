require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test '#index' do

    Item.create(name: 'item1',
                      description: 'nice item',
                      unit_price: 5.99)

    get :index, format: :json

    items = JSON.parse(response.body)
    first_item = items.last
    assert_response :success
    assert_equal "item1", first_item['name']
    assert_equal "5.99", first_item['unit_price']
  end

  test '#show' do

    c =  Item.create(name: 'item1',
                      description: 'nice item',
                      unit_price: 5.99)


    get :show, format: :json, id: c.id

    item = JSON.parse(response.body)
    assert_response :success
    assert_equal "item1", item['name']
    assert_equal "5.99", item['unit_price']
  end

end
