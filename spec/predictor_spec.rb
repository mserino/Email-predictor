require 'predictor'

describe Predictor do

	let(:predictor) { Predictor.new }
	let(:analyzer) {Analyzer.new}
 	context 'predicting email address' do
 		let(:data) {
 			{
		  "John Ferguson" => "john.ferguson@alphasights.com",
		  "Damon Aw" => "damon.aw@alphasights.com",
		  "Linda Li" => "linda.li@alphasights.com",
		  "Larry Page" => "larry.p@google.com",
		  "Sergey Brin" => "s.brin@google.com",
		  "Steve Jobs" => "s.j@apple.com",
			}
 		}

 		it 'with pattern first_name_dot_last_name' do
 			predictor.predict('Harry Potter', 'alphasights.com')
 			expect(predictor.prediction).to eq ['harry.potter@alphasights.com']
 		end

 		it 'with pattern first_name_dot_last_initial and first_initial_dot_last_name' do
 			predictor.predict('Harry Potter', 'google.com')
 			expect(predictor.prediction).to eq ['harry.p@google.com', 'h.potter@google.com']
 		end

 		it 'with pattern first_initial_dot_last_initial' do
 			predictor.predict('Harry Potter', 'apple.com')
 			expect(predictor.prediction).to eq ['h.p@apple.com']
 		end

 		it 'returns an error if the email is not in the dataset' do
 			expect{predictor.predict('Harry Potter', 'hogwarts.co.uk')}.to raise_exception InvalidEmailException
 		end
 	end

 	context '#check_for(company)' do
		it 'returns true if a company is not in the dataset' do
			analyzer.match('amazon.com')
			expect(predictor.instance_eval{ check_for('amazon.com') }).to eq true
		end
	end

	context 'predict from a set of data' do
		before do
			predictor.predict_people
		end
	end
end