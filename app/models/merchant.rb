class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.merchant_revenue(params)
    binding.pry
    cost_collection = InvoiceItem.joins(invoice: :transactions)
                                 .where(transactions: {result: 'success'})
                                 .where(invoices: {merchant_id: params[:merchant_id]})
                                 .pluck(:quantity, :unit_price)
    {revenue: ((cost_collection.map {|q, n| q * n}).reduce(:+))}
  end


end
