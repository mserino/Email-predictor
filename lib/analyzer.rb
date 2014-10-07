class Analyzer

	def get(email)
		email.split('@')[0]
	end

	def find(string)
		@name, @lastname = string.split('.')
		[name_pattern, lastname_pattern].join('_dot_').to_sym
	end

	def convert(pattern)
		string = get(pattern)
		find(string)
	end

	private

	def name_pattern
		if @name.length == 1
			'first_initial'
		else
			'first_name'
		end
	end

	def lastname_pattern
		if @lastname.length == 1
			'last_initial'
		else
			'last_name'
		end
	end

end