require 'csv'
require 'shopify_api'
require 'cgi'
require 'dotenv'
Dotenv.load

API_KEY = ENV['API_KEY']
PASSWORD = ENV['PASSWORD']
SHOP_NAME = 'bowes-guitars'
SHOP_URL = "https://#{API_KEY}:#{PASSWORD}@#{SHOP_NAME}.myshopify.com/admin"
ShopifyAPI::Base.site = SHOP_URL

CSV.foreach('giftcard-api.csv', headers: true) do |row|
  code = row['Code']
  initial_value = row['Initial Value']
  note = row['Note']
  customer = row['Customer']
  params = CGI.parse("#{customer}")

  full_customer = ShopifyAPI::Customer.search(query:"#{params}")
    full_customer.each do |customer|
      if customer.id
        @customer_id = customer.id
      else
        puts "no customer id found"
      end
    end

  ShopifyAPI::GiftCard.create({
    code:"#{code}",
    initial_value: initial_value,
    note: "#{note}",
    customer_id:@customer_id
  })
  
end

puts "Gift cards successfully imported"