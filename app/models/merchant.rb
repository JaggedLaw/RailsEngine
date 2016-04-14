class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.merchant_revenue(params)
    filtered_inv_items = InvoiceItem.joins(invoice: :transactions)
                                 .where(transactions: {result: 'success'})
                                 .where(invoices: {merchant_id: params[:id]})
                                 .pluck(:quantity, :unit_price)
    total = filtered_inv_items.reduce(0) do |total_sale, invoiced_item|
      total_sale += (invoiced_item[0] * invoiced_item[1])
    end
    { revenue: (total.round(2))}
  end


end
