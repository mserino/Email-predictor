require_relative 'predictor'
require_relative 'constants'

class Interface

	attr_accessor :predictor

	def welcome
		puts "Welcome to the Email Predictor"
		puts "Press Enter to continue"
		press_enter
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
			predict_people
		rescue InvalidEmailException
			puts "Sorry, email not available"
		end
	end

	def predict_people
		PEOPLE.map do |person|
			enter_to_predict(person)
			@predictor = Predictor.new
			predict(person)
			if one_email
				puts_single_email
			else
				puts_multiple_emails
			end
			press_enter
		end
	end

	private

	def predict(person)
		@predictor.predict(person[:name], person[:company])
	end

	def enter_to_predict(person)
		puts "Press Enter to predict the email of #{person[:name]}, #{person[:company]}"
		press_enter
	end

	def one_email
		@predictor.prediction.length == 1
	end

	def puts_single_email
		puts "The email is: #{predictor.prediction[0]}"
	end

	def puts_multiple_emails
		puts "The emails are: "
		@predictor.prediction.map {|pred| puts pred}
	end

	def press_enter
		STDIN.gets.chomp
	end

end