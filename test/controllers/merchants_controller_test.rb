require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test '#index' do

    Merchant.create(name: 'Restaurant')

    get :index, format: :json

    merchants = JSON.parse(response.body)
    first_merchant = merchants.last
    assert_response :success
    assert_equal "Restaurant", first_merchant['name']
  end

  test '#show' do

    c =  Merchant.create(name: 'Restaurant')


    get :show, format: :json, id: c.id

    merchant = JSON.parse(response.body)
    assert_response :success
    assert_equal "Restaurant", merchant['name']
  end

end
