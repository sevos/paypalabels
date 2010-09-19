class Contact
  extend FieldFixings

  FIELDS = [:name, :address_1, :address_2,
            :city, :state, :zipcode, :country,
            :value, :item_title, :note,
            :postage_price, :buyer_id]

  attr_reader *FIELDS

  camel_case :name, :address_1, :address_2, :country, :city, :state
  upper_case :zipcode
  floated :postage_price, :value

  def initialize(csv_row)
    FIELDS.each do |field|
      instance_variable_set "@#{field.to_s}", csv_row[field]
    end
  end
end