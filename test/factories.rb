
FactoryGirl.define do

  factory :transaction do
    invoice
    credit_card_number "4141"
    result "success"
  end

  factory :invoice_item do
    quantity 3
    unit_price 40.00
    item
    invoice
  end

  factory :item do
    name "Cheestick"
    description "Get your snack on"
    unit_price 3.99
    merchant
  end

  factory :invoice do
    customer
    merchant
    status "success"
    created_at "2013-03-25 09:54:09"
  end

  factory :merchant do
    name "Food Imporium"
  end

  factory :customer do
    first_name "Fred"
    last_name "Astaire"
  end
end
