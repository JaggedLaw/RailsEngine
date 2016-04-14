require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test '#index' do

    cust1 = Customer.create(first_name: 'Joe',
                    last_name: 'Shmoe')
    cust2 = Customer.create(first_name: 'Sam',
                    last_name: 'Smith')

    get :index, format: :json

    customers = JSON.parse(response.body)
    first_customer = customers.last
    assert_response :success
    assert_equal 'Joe', cust1['first_name']
    assert_equal 'Sam', cust2['first_name']
  end

  test '#show' do

    c = Customer.create(first_name: 'Joe',
                    last_name: 'Shmoe')

    get :show, format: :json, id: c.id

    customer = JSON.parse(response.body)
    assert_response :success
    assert_equal 'Joe', customer['first_name']
    assert_equal 'Shmoe', customer['last_name']
  end


end
