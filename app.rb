require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base

	get '/reversename/:name' do 
		@name = params[:name]
		@name.reverse
	end

	get '/square/:number' do 
		@number = params[:number].to_f
		"#{@number ** 2}"
	end

	get '/say/:number/:phrase' do 
		@number = params[:number].to_i
		@phrase = params[:phrase]
		output = []
		@number.times {output << @phrase}
		"#{output.join("\n")}"
	end

	get '/say/:word1/:word2/:word3/:word4/:word5' do 
		[:word1, :word2, :word3, :word4, :word5].collect! {|word| params[word]}.join(" ") + "."

	end

	get '/:operation/:number1/:number2' do 
		@operation = params[:operation]
		@num1 = params[:number1].to_i
		@num2 = params[:number2].to_i
		accepted_ops = {"add" => '+', "subtract" => '-', "multiply" => '*', "divide" => '/'}

		if accepted_ops.keys.include?(@operation)
			"#{@num1.send(accepted_ops[@operation], @num2)}"
		else
			status = 404
			"oops"
		end
	end

end