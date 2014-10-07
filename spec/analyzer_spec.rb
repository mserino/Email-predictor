require 'analyzer'

describe Analyzer do
	let(:analyzer) { Analyzer.new }

	context 'finding patterns' do
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
end