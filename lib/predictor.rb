require_relative 'analyzer'
require_relative 'error'
require_relative 'constants'

class Predictor
	attr_reader :analyzer, :prediction

	def initialize
		@analyzer = Analyzer.new
		@prediction ||= []
	end

	def predict(name, company)
		@analyzer.match(company)
		raise InvalidEmailException if check_for(company)
		analyzer.pattern[company].map do |patt|
			prediction << analyzer.to_email(name, patt) + "@#{company}"
		end
	end

	def predict_people
		PEOPLE.map do |person|
			predict(person[:name], person[:company])
		end
	end

	private

	def check_for(company)
		emails = DATA.values
		companies = emails.map {|email| email.split('@')[1]}.uniq
		!companies.include? company
	end

end