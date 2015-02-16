# Rspec 2.11+ cheatsheet in original style 
# In this file too much code so feel free to edit this file the way you like :)

describe "Migrating from should to the new expect syntax" do
	# The shift from should to expect makes much of
	# RSpec's code much cleaner, and unifies some aspects of
	# testing syntax.
	# For the vast majority of the RSpec tests you're likely to
	# write, the following examples will suffice to get you
	# converted from should to expect

	it "is old syntax" do
		my_object.should eq(3)
		my_object.should_not_be_a_kind_of(Foo)
	end

	it "is new syntax" do
		expect(my_object).to eq(3)
		expect(my_object).not_to be_a_kind_of(Foo)
	end
	# It should be noted that the syntax for mock objects has not
	# yet been finalised. It will also begin to use expect in the
	# near future, but for now should is still in use.
end 

describe "Object predicates" do
	expect(a_result).to     eq("this value")
	expect(a_result).not_to eq("that value")
end

describe "Block predicates" do
	expect { raise "oops" }.to raise_error
	expect { some block }.not_to throw_symbol
end

describe "Equality and Identity" do
	eq(expected) # same value
	eql(expected) # same value and type
	equal(expected) # same object
end

describe "True false nil" do
	be_true # true-ish
	be_false # false-ish
	be_nil # is nil
end

describe "Regex pattern matching" do
	match /a regex/
end

describe "Array and string prefixes/suffixes" do
	start_with "free"
	start_with [1,2,3]
	end_with "dom"
	end_with [3,4,5]
end

describe "Array matching" do
	# Compares arrays for exact equivalence, ignoring ordering
	match_array [a,b,c]
	match_array [b,c,a] # same result
end

describe "Ancestor Class" do
	be_kind_of User   # returns true if type is in User's class 
	# hierarchy or is a module and is included in a class in User's class hierarchy.
	be_instance_of User # returns true object instance of class User

	be_a User # same as be_kind_of(User)
	be_an User  # same as be_kind_of(User)
	be_a_kind_of User # same as be_kind_of(User)
	be_an_instance_of User # same as be_instance_of(User)
end 

describe "Collection Size" do
	# When the target is a collecton, "things" may be anything.
	# If the target owns a collecton, "things" must be the name of the collecton
	have(5).things
	have_at_least(9).things
	have_at_most(4).things
end

describe "Conatinment and coverage" do
	expect("string").to include "str"
	expect([1,2,3]).to include 2,1
	expect(1..5).to cover 3,4,5
end 

describe "Duck typing" do
	respond_to(:foo)
	respond_to(:foo, :and_bar, :and_baz)
	respond_to(:foo).with(1).argument
	respond_to(:foo).with(2).arguments
end

describe "Raising" do
	# error and exception are functonally interchangeable, so 
	# you're free to use whichever opton best suits your context.
	raise_error
	raise_error RuntimeError
	raise_error "the exact error message"
	raise_error /message$/ # regexp
	raise_error NameError, "exact message"
	raise_error NameError, /error message/
end 

describe "Throwing" do
	throw_symbol
	throw_symbol :specificsymbol
	throw_symbol :specificsymbol, with_arg
end

describe "Yielding" do
	yield_control
	yield_with_args "match foo", /match bar/
	yield_with_no_args
	yield_successive_args "foo", "bar"
end

describe "Changing" do
	change{Counter.count}
	change{Counter.count}.from(0).to(1)
	change{Counter.count}.by(2)
end

describe "Satisfying" do
	# satisfy is valid for objects and blocks, and allows the target
	# to be tested against an arbitrarily specified block of code.
	expect(20).to satisfy { |v| v % 5 == 0 }	
end 
