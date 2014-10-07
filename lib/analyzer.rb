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
		name = get(data.values[0]) # to get the first part of the name damon.aw
		# pattern << convert(name) # first_name_dot_last_name
		@pattern[company] = [convert(name)]
	end

	private

	def name_pattern
		@name.length == 1 ? 'first_initial' : 'first_name'
	end

	def lastname_pattern
		@lastname.length == 1 ? 'last_initial' : 'last_name'
	end

end