class MailingsController < ApplicationController
  def new
  end

  def create
    @contacts = Mailing.new(params[:payments].read).contacts
    if params[:skip].to_i > 0
      params[:skip].to_i.times do
        @contacts.unshift Contact.new({})
      end
    end
  end

  def summary
    @contacts = Mailing.new(params[:payments].read).contacts

    @normal_postage_count = @contacts.select {|c| c.postage_price.to_f > 0.00 }.count
    @special_postage_count = @contacts.select {|c| c.postage_price.to_f == 0.00 }.count
  end
end
