# Add this to spec/support/integration_helpers.rb
# and do not forget to add public/capybara.html in your .gitignore !

def show_page
  save_page Rails.root.join( 'public', 'capybara.html' )
  %x(chromium-browser http://localhost:3000/capybara.html)
  # %x(google-chrome http://localhost:3000/capybara.html)
  # %x(firefox http://localhost:3000/capybara.html)
end

# https://coderwall.com/p/jsutlq
