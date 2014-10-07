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

	def match(company, data)
		emails = data.values
		pattern[company] = []
		emails.map do |email|
			name = get(email)
			pattern[company] << convert(name) if email.include? company
		end
		pattern[company].uniq!
	end

	private

	def name_pattern
		@name.length == 1 ? 'first_initial' : 'first_name'
	end

	def lastname_pattern
		@lastname.length == 1 ? 'last_initial' : 'last_name'
	end

end