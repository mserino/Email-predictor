require './lib/interface'

interface = Interface.new

interface.enter_name
interface.receive_name
interface.enter_company
interface.receive_company
begin
	interface.predict_email
rescue InvalidEmailException => e
	puts "The email cannot be predicted"
end