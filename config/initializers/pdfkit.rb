PDFKit.configure do |config|       
  config.wkhtmltopdf = Rails.root.join('vendor', 'wkhtmltopdf-heroku').to_s if RAILS_ENV == 'production'  
end