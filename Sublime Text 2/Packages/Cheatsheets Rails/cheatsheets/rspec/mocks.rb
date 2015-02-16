# Rspec 2.11+ cheatsheet in original style 
# In this file too much code so feel free to edit this file the way you like :)

describe "Creating a double" do
	foo = double(name)
	foo = double(name, options)
	# Currently a single option is supported:
	foo = double("Foo", :null_object => true)
end 

describe "Expecting messages" do
	double.should_receive(:message)
	double.should_not_receive(:message)
end 
describe "Expecting arguments to messages" do
	should_receive(:foo).with(args)
	should_receive(:foo).with(:no_args)
	should_receive(:foo).with(:any_args)
end 

describe "Defining explicit response of a double" do 
	double.should_receive(:msg) { block_here }
end 

describe "Arbitrary argument handling" do
	double.should_receive(:msg) do | arg1 |
	val = do_something_with_argument(arg1)
	expect(val).to eq(42)
end 

describe "Receive counts" do 
	 double.should_receive(:foo).once
								.twice
								.exactly(n).times
								.any_number_of_times
								.at_least(:once)
								.at_least(:twice)
								.at_least(n).times

end
describe "Return values" do
	should_receive(:foo).once.and_return(v)
						.and_return(v1, v2, ... , vn)
						# implies consequtive returns
						.at_least(n).times
						.and_return { some_code }
end 

describe "Raising, Throwing and Yielding" do
	.and_raise(<exception>)
	.and_throw(:symbol)
	.and_yield(values, to, yield)
	# and_yield can be used multiple mes for methods
	# that yield to a block multiple time
end 

describe "Enforcing Ordering" do
	.should_receive(:flip).once.ordered
	.should_receive(:flop).once.ordered
end
