require 'csv'

namespace :import do

  desc "Import merchants from csv"
    task import_csv: :environment do

      counter = 0
      filename = "lib/assets/transactions.csv"
      CSV.foreach(filename, :headers => true) do |row|
        row.delete("credit_card_expiration_date")
        Transaction.create!(row.to_h)
        counter += 1
      end
      puts "Imported #{counter} transactions"

      counter = 0
      filename = "lib/assets/merchants.csv"
      CSV.foreach(filename, :headers => true) do |row|
        id, name, created_at, updated_at = row
        Merchant.create!(row.to_h)
        counter += 1
      end
      puts "Imported #{counter} merchants"


      counter = 0
      filename = "lib/assets/customers.csv"
      CSV.foreach(filename, :headers => true) do |row|
        id, first_name, last_name, created_at, updated_at = row
        Customer.create!(row.to_h)
        counter += 1
      end
      puts "Imported #{counter} customers"

      counter = 0
      filename = "lib/assets/invoice_items.csv"
      CSV.foreach(filename, :headers => true) do |row|
        id, item_id, invoice_id, quantity, unit_price, created_at, updated_at = row
        InvoiceItem.create!(row.to_h)
        integer_price = InvoiceItem.last.unit_price
        float_price = integer_price/100
        InvoiceItem.last.update(unit_price: float_price)
        InvoiceItem.last.update(updated_at: row['updated_at'])
        counter += 1
      end
      puts "Imported #{counter} invoice items"

      counter = 0
      filename = "lib/assets/invoices.csv"
      CSV.foreach(filename, :headers => true) do |row|
        id, customer_id, merchant_id, status, created_at, updated_at = row
        Invoice.create!(row.to_h)
        counter += 1
      end
      puts "Imported #{counter} invoices"

      counter = 0
      filename = "lib/assets/items.csv"
      CSV.foreach(filename, :headers => true) do |row|
        id, name, description, unit_price, merchant_id, created_at, updated_at = row
        Item.create!(row.to_h)
        integer_price = Item.last.unit_price
        float_price = integer_price/100
        Item.last.update(unit_price: float_price)
        Item.last.update(updated_at: row['updated_at'])
        counter += 1
      end
      puts "Imported #{counter} items"

  end


end
