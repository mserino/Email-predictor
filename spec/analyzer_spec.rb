require 'analyzer'

describe Analyzer do
	let(:analyzer) { Analyzer.new }

	context 'finding patterns from simple string' do
		it 'finds first name and last name' do
			expect(analyzer.find('john.ferguson')).to eq :first_name_dot_last_name
		end

		it 'finds first name and last initial' do
			expect(analyzer.find('john.f')).to eq :first_name_dot_last_initial
		end

		it 'finds first initial and last name' do
			expect(analyzer.find('j.ferguson')).to eq :first_initial_dot_last_name
		end

		it 'finds first initial and last initial' do
			expect(analyzer.find('j.f')).to eq :first_initial_dot_last_initial
		end
	end

	context 'finding patterns from email address' do
		it 'finds the first part' do
			expect(analyzer.get('john.ferguson@alphasights.com')).to eq 'john.ferguson'
		end

		it 'finds first name and last name from email' do
			expect(analyzer.convert('john.ferguson@alphasights.com')).to eq :first_name_dot_last_name
		end

		it 'finds first initial and last name from email' do
			expect(analyzer.convert('j.ferguson@alphasights.com')).to eq :first_initial_dot_last_name
		end

		it 'finds first name and last initial from email' do
			expect(analyzer.convert('john.f@alphasights.com')).to eq :first_name_dot_last_initial
		end

		it 'finds first initial and last initial from email' do
			expect(analyzer.convert('j.f@alphasights.com')).to eq :first_initial_dot_last_initial
		end
 	end

 	context 'matching data' do
 		context 'with a single company' do
 			let(:data) { {'Damon Aw' => 'damon.aw@alphasights.com'}}

 			it 'can match the pattern for the company' do
 				analyzer.match('alphasights.com')
 				expect(analyzer.pattern['alphasights.com']).to eq [:first_name_dot_last_name]
 			end
 		end

 		context 'with a set of data' do
	 		let(:data) {
	 			{
			  "John Ferguson" => "john.ferguson@alphasights.com",
			  "Damon Aw" => "damon.aw@alphasights.com",
			  "Linda Li" => "linda.li@alphasights.com",
			  "Larry Page" => "larry.p@google.com",
			  "Sergey Brin" => "s.brin@google.com",
			  "Steve Jobs" => "s.j@apple.com"
				}
			}

			it 'can match the patterns' do
				analyzer.match('alphasights.com')
				expect(analyzer.pattern['alphasights.com']).to eq [:first_name_dot_last_name]
			end

			it 'can match different patterns' do
				analyzer.match('google.com')
				expect(analyzer.pattern['google.com']).to eq [:first_name_dot_last_initial, :first_initial_dot_last_name]
			end
 		end
 	end

 	context 'converting from pattern to email' do
 		it 'from first_name_dot_last_name' do
 			expect(analyzer.to_email('John Ferguson', :first_name_dot_last_name)).to eq 'john.ferguson'
 		end

 		it 'from first_initial_dot_last_name' do
 			expect(analyzer.to_email('Harry Potter', :first_initial_dot_last_name)).to eq 'h.potter'
 		end

 		it 'from first_name_dot_last_initial' do
 			expect(analyzer.to_email('Margherita Serino', :first_name_dot_last_initial)).to eq 'margherita.s'
 		end

 		it 'from first_initial_dot_last_initial' do
 			expect(analyzer.to_email('Damon Lindeloff', :first_initial_dot_last_initial)).to eq 'd.l'
 		end
 	end

end