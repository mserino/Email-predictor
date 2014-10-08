require './lib/interface'

interface = Interface.new
interface.welcome
interface.predict_from_data
interface.keep_checking
interface.enter_name
interface.receive_name
interface.enter_company
interface.receive_company
begin
	interface.predict_email
rescue InvalidEmailException => e
	puts "Sorry, the email cannot be predicted"
end