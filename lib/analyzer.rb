class Analyzer

	DATA = {
	  "John Ferguson" => "john.ferguson@alphasights.com",
	  "Damon Aw" => "damon.aw@alphasights.com",
	  "Linda Li" => "linda.li@alphasights.com",
	  "Larry Page" => "larry.p@google.com",
	  "Sergey Brin" => "s.brin@google.com",
	  "Steve Jobs" => "s.j@apple.com",
	}

	attr_accessor :pattern, :prediction

	def initialize
		@pattern = {}
		@prediction ||= []
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
		@emails = DATA.values
		pattern[company] ||= []
		@emails.map do |email|
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

	def predict(name, company)
		match(company)
		return "The email cannot be predicted" if check_for(company)
		pattern[company].map do |patt|
			prediction << to_email(name, patt) + "@#{company}"
		end
	end

	private

	def check_for(company)
		companies = @emails.map {|email| email.split('@')[1]}.uniq
		!companies.include? company
	end

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