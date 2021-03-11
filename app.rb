require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    @name = params[:name]
    @reverse_name = @name.split("").reverse.join
    @reverse_name
  end

  get '/square/:number' do
    @num = params[:number].to_i
    @num = @num ** 2
    @num.to_s
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]
    @phrase_arr = []
    @num.times {@phrase_arr << @phrase}
    @phrase_arr.join
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @concat_phrases = params.map {|k,v| v}.join(" ")
    @concat_phrases + "."
  end

  get '/:operation/:number1/:number2' do
    @num_1 = params[:number1].to_i
    @num_2 = params[:number2].to_i
    @op = params[:operation]
    @result = @num_1 - @num_2 if @op == "subtract"
    @result = @num_1 + @num_2 if @op == "add"
    @result = @num_1 * @num_2 if @op == "multiply"
    @result = @num_1 / @num_2 if @op == "divide"
    @result.to_s
  end
end