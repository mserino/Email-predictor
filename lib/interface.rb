require_relative 'analyzer'

class Interface

	attr_accessor :analyzer

	def initialize
		@analyzer = Analyzer.new
	end

	def welcome
		puts "Welcome to the Email Predictor"
	end

	def enter_name
		puts "Please enter the name: "
	end

	def receive_name
		@name = STDIN.gets.chomp
	end

	def enter_company
		puts "Please enter the company: "
	end

	def receive_company
		@company = STDIN.gets.chomp
	end

	def predict_email
		analyzer.predict(@name, @company)
		puts "The possible email are:"
		analyzer.prediction.map {|pred| puts pred }
	end
end