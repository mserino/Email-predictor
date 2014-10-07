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

end