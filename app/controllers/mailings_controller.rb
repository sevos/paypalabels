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
    @contacts = Mailing.new(params[:payments].read).contacts.group_by(&:item_title)
  end
end
