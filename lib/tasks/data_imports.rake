namespace :import do
  desc "rake import merchants data from csv"
    task merchant_data: :environment do
      require 'csv'
      CSV.foreach('db/data/merchants.csv', :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  desc "rake import customer data from csv"
    task customer_data: :environment do
      require 'csv'
      CSV.foreach('db/data/customers.csv', :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
  end

  desc "rake import items data from csv"
    task items_data: :environment do
      require 'csv'
      CSV.foreach('db/data/items.csv', :headers => true) do |row|
      Item.create!(row.to_hash)
    end
  end

  desc "rake import transactions data from csv"
    task transaction_data: :environment do
      require 'csv'
      CSV.foreach('db/data/transactions.csv', :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
  end

  desc "rake import Invoice Items data from csv"
    task invoice_item_data: :environment do
      require 'csv'
      CSV.foreach('db/data/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end
end
