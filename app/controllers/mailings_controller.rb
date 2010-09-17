class MailingsController < ApplicationController
  def new
  end

  def create
    @contacts = Mailing.new(params[:payments].read).contacts
  end

end
