require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test '#index' do

    inv_it1 = InvoiceItem.create(item_id: '5',
                      invoice_id: '2',
                      quantity: '3',
                      unit_price: '12.00')
    inv_it2 = InvoiceItem.create(item_id: '6',
                      invoice_id: '3',
                      quantity: '4',
                      unit_price: '14.00')
    get :index, format: :json

    invoice_items = JSON.parse(response.body)
    assert_response :success
    assert_equal 5, inv_it1['item_id']
    assert_equal 12.0, inv_it1['unit_price']
    assert_equal 6, inv_it2['item_id']
    assert_equal 14.0, inv_it2['unit_price']
  end

  test '#show' do

    c = InvoiceItem.create(item_id: '5',
                      invoice_id: '2',
                      quantity: '3',
                      unit_price: '12.00')

    get :show, format: :json, id: c.id

    first_invoice_item = JSON.parse(response.body)
    assert_response :success
    assert_equal 5, first_invoice_item['item_id']
    assert_equal "12.0", first_invoice_item['unit_price']
  end


end
