require_relative 'error'
require_relative 'constants'

class Analyzer

	attr_accessor :pattern

	def initialize
		@pattern = {}
	end

	def get(name)
		name.split('@')[0]
	end

	def find(string)
		@name, @lastname = string.split('.')
		[name_pattern, lastname_pattern].join('_dot_').to_sym
	end

	def convert(pattern)
		string = get(pattern)
		find(string)
	end

	def match(company)
		emails = DATA.values
		pattern[company] ||= []
		emails.map do |email|
			name = get(email)
			pattern[company] << convert(name) if email.include? company
		end
		pattern[company].uniq!
	end

	def to_email(name, pattern)
		@first_part, @last_part = name.split(' ')
		@pattern_first, @pattern_last = pattern.to_s.split('_dot_')
		[first_part, last_part].join('.')
	end

	private

	def name_pattern
		@name.length == 1 ? 'first_initial' : 'first_name'
	end

	def lastname_pattern
		@lastname.length == 1 ? 'last_initial' : 'last_name'
	end

	def first_part
		@pattern_first.to_sym == :first_name ? @first_part.downcase : @first_part[0].downcase
	end

	def last_part
		@pattern_last.to_sym == :last_name ? @last_part.downcase : @last_part[0].downcase
	end

end