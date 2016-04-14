require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test '#index' do

    inv1 = Invoice.create(customer_id: '5',
                      merchant_id: '2',
                      status: 'success')
    inv2 = Invoice.create(customer_id: '6',
                      merchant_id: '3',
                      status: 'success')

    get :index, format: :json

    invoices = JSON.parse(response.body)
    assert_response :success
    assert_equal 5, inv1['customer_id']
    assert_equal "success", inv1['status']
    assert_equal 6, inv2['customer_id']
    assert_equal 3, inv2['merchant_id']
  end

  test '#show' do

    c =  Invoice.create(customer_id: '5',
                          merchant_id: '2',
                          status: 'success')


    get :show, format: :json, id: c.id

    invoice_item = JSON.parse(response.body)
    assert_response :success
    assert_equal 5, invoice_item['customer_id']
    assert_equal "success", invoice_item['status']
  end

end
