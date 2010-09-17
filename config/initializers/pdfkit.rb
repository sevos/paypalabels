PDFKit.configure do |config|       
  config.wkhtmltopdf = Rails.root.join('vendor', 'wkhtmltopdf-heroku').to_s if RAILS_ENV == 'production'  
  config.default_options = {:margin_left => 5, :margin_right => 5, :margin_top => 12, :margin_bottom => 11}
end