class Mailing
  
  HEADER_DICTIONARY = {
    "Date" => :date,
    "Time" => :time,
    "Time Zone" => :time_zone,
    "Name" => :name, 
    "Type" => :transaction_type,
    "Status" => :transaction_status,
    "Currency" => :currency,
    "Gross" => :value,
    "Fee" => :paypal_fee,
    "Net" => :income,
    "Note" => :note,
    "From Email Address" => :sender,
    "To Email Address" => :recipient,
    "Transaction ID" => :transaction_id,
    "Item Title" => :item_title,
    "Postage and Packing" => :postage_price,
    "Buyer ID" => :buyer_id,
    "Reference Txn ID" => :tax_id,
    "Receipt ID" => :receipt_id,
    "Address Line 1" => :address_1,
    "Address Line 2/District/Neighbourhood" => :address_2,
    "Town/City" => :city,
    "State/Province/Region/County/Territory/Prefecture/Republic" => :state,
    "Postcode" => :zipcode,
    "Country" => :country
    
  }
  
  attr_reader :rows
  attr_reader :headers

  def initialize(body)
    @rows = []
    FasterCSV.parse(body) do |row|
      @rows << row[0..-2].map(&:strip)
    end

    @headers = translate_headers @rows.shift

    @rows.map! do |row|
      row = Hash[*@headers.zip(row).flatten]
    end
  end

  def contacts
    @rows.map {|row| Contact.new row }
  end

  private

  def translate_headers(headers)
    headers.map {|header| HEADER_DICTIONARY[header]}
  end
end