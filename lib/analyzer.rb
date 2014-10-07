class Analyzer

	def find(string)
		@name, @lastname = string.split('.')
		[name_pattern, lastname_pattern].join('_dot_').to_sym
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