# Rspec 2.11+ cheatsheet in original style 
# In this file too much code so feel free to edit this file the way you like :)

# Creation of mock objects now uses the double method instead of mock. There are also plans to move to expect for defining the
# behaviour of mock objects, but this hasn't yet been finalised. Stubs remain unchanged.
# Mocking a database connection that's expected to run a few queries:
test_db = double("database")
test_db.should_receive(:connect).once
test_db.should_receive(:query).at_least(3).times.and_return(0)
test_db.should_receive(:close).once

# Using a stub in place of a live call to fetch information, which may be very slow:
world = World.new()
world.stub(:get_current_state).and_return( [1,2,3,4,5] )

describe "Stubs" do
end

# Configuring RSpec with spec_helper.rb

# The convention for configuring RSpec is a file named
# spec_helper.rb in your spec directory. It's always in your
# load path, so you require 'spec_helper' in each file.
# This is the perfect place to enable coloured output,
# randomise the order that specs are run in, and apply
# formatiers as appropriate.
	RSpec.configure do |config|
	config.color_enabled = true
	config.order = "random"
	end
	# This is critical, don't remove it
	config.formatter = 'NyanCatWideFormatter'
# Perfect!

