# Rspec 2.11+ cheatsheet in original style 
# In this file too much code so feel free to edit this file the way you like :)

# Methods can be stubbed out on both doubles (mock objects)
# and real objects. Stubs are functionally similar to the use of
# should_receive on a double, the difference is in your intents

describe "Creating a Stub" do
	All three forms are equally valid on doubles and real objects.
	double.stub(:status) { "OK" }
	object.stub(:status => "OK" )
	object.stub(:status).and_return("OK")
end

describe "Double with stub at creation time" do
	double("Foo", :status => "OK")
	double(:status => "OK") # name is optional
end

describe "Multiple consecutive return values" do
	# A stubbed method can return different values on subsequent
	# invocations. For any calls beyond the number of values
	# provided, the last value will be used.
	die.stub(:roll).and_return(1,2,3)

	die.roll # returns 1
	die.roll # returns 2
	die.roll # returns 3
	die.roll # returns 3
	die.roll # returns 3
end

describe "Raising, Throwing and Yielding" do
	# Stubs support and_raise, and_throw and and_yield the same
	# was as doubles do. The syntax for use on stubs is identical.
end 
