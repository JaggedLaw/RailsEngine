== RailsEngine

API's open up a whole new world for applications. It is even more exciting when you build an API! In this project I have imported CSV's of existing data regarding invoicing for various merchants and customers. That's not exciting. What's exciting is what you can learn from the data once you map it! I set up the endpoints to query specific information so that you can see not only all the transactions, merchants, and items, but there are also business intelligence endpoints to show a single merchants revenue, favorite customer, top grossing merchants etc. Here is the setup:

git clone https://github.com/JaggedLaw/RailsEngine.git

cd RailsEngine

bundle

rake db:{drop,create,migrate}

rake import:import_csv

then start your local server using 'rails s'

In your browser you can check the various endpoints:

there are index and show views for:
customers
invoices
invoice_items
items
merchants
transactions

In the example of merchants, these endpoints are reached by:
/api/v1/merchants/
/api/v1/merchants/12      (or any number less than 100)

Finders:
/api/v1/merchants/find?id=12
/api/v1/merchants/find_all?name=some-name

Relationships:
#### Merchants

* `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders

#### Invoices

* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/invoices/:id/items` returns a collection of associated items
* `GET /api/v1/invoices/:id/customer` returns the associated customer
* `GET /api/v1/invoices/:id/merchant` returns the associated merchant

#### Invoice Items

* `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
* `GET /api/v1/invoice_items/:id/item` returns the associated item

#### Items

* `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/items/:id/merchant` returns the associated merchant

#### Transactions

* `GET /api/v1/transactions/:id/invoice` returns the associated invoice

#### Customers

* `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices
* `GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

### Business Intelligence Endpoints
#### All Merchants

* `GET /api/v1/merchants/most_revenue?quantity=x` returns the top `x` merchants ranked by total revenue
* `GET /api/v1/merchants/most_items?quantity=x` returns the top `x` merchants ranked by total number of items sold
* `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date `x` across all merchants

#### Single Merchant

* `GET /api/v1/merchants/:id/revenue` returns the total revenue for that merchant across all transactions
* `GET /api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date `x`
* `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.
* `GET /api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices

#### Items

* `GET /api/v1/items/most_revenue?quantity=x` returns the top `x` items ranked by total revenue generated
* `GET /api/v1/items/most_items?quantity=x` returns the top `x` item instances ranked by total number sold
* `GET /api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date

#### Customers

* `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions
