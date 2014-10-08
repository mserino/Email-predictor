require_relative 'predictor'
require_relative 'constants'

class Interface

	attr_accessor :predictor

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
		predictor = Predictor.new
		predictor.predict(@name, @company)
		puts "The possible email are:"
		predictor.prediction.map {|pred| puts pred }
	end

	def keep_checking
		puts "Press Enter if you want to predict a different email"
		STDIN.gets.chomp
	end

	def predict_from_data		
		begin
			PEOPLE.map do |person|
				puts "Press Enter to predict the email of #{person[:name]}, #{person[:company]}"
				STDIN.gets.chomp
				predictor = Predictor.new
				predictor.predict(person[:name], person[:company])
				if predictor.prediction.length == 1
					puts "The email is: #{predictor.prediction[0]}"
				else
					puts "The emails are: "
					predictor.prediction.map {|pred| puts pred}
				end
				STDIN.gets.chomp
			end
		rescue InvalidEmailException
			puts "Sorry, email not available"
		end
	end

end