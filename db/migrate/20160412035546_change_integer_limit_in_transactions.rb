class ChangeIntegerLimitInTransactions < ActiveRecord::Migration
  def change
    change_column :transactions, :credit_card_number, :bigint
  end
end
