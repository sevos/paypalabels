module MailingHelper
  def html_class_for(contact)
    returning [cycle("odd", "even")] do |classes|
      classes << "noted" if contact.note.to_s.strip.present?
      classes << "special-postage" unless contact.postage_price.to_f == 0.00
    end.join(' ')
  end
end
