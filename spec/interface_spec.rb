require 'interface'

describe Interface do
	let(:interface) {Interface.new}
	let(:analyzer) {Analyzer.new}

	it 'welcome message' do
		expect(STDOUT).to receive(:puts).with "Welcome to the Email Predictor"
		interface.welcome
	end

	it 'prompts the user to enter a name' do
		expect(STDOUT).to receive(:puts).with "Please enter the name: "
		interface.enter_name
	end

	it 'gets the name' do
		expect(STDIN).to receive(:gets).and_return "Jon Snow"
		interface.receive_name
	end

	it 'prompts the user to enter a company' do
		expect(STDOUT).to receive(:puts).with "Please enter the company: "
		interface.enter_company
	end

	it 'gets the company' do
		expect(STDIN).to receive(:gets).and_return "google.com"
		interface.receive_company
	end

	it 'prints the possible emails' do
		expect(STDIN).to receive(:gets).and_return "Jon Snow"
		interface.receive_name
		expect(STDIN).to receive(:gets).and_return "google.com"
		interface.receive_company
		
		expect(STDOUT).to receive(:puts).with "The possible email are:"
		expect(STDOUT).to receive(:puts).with "jon.s@google.com"
		expect(STDOUT).to receive(:puts).with "j.snow@google.com"
		interface.predict_email
	end
end