require 'pry'

class User
	attr_writer :mastercard
	attr_accessor :email
	attr_reader :birthdate
	@@user_count = 0
	

	def initialize(email_to_save)
		if check_email(email_to_save)
			@email = email_to_save
			@@user_count = @@user_count + 1
			p "On envoie un email de bienvenue."
		else
			p "Erreur... adresse invalide..."
		end
	end

	def self.count
		return @@user_count
	end

	def greet
		puts "Bonjour, monde !"
	end

	def say_hello_to_someone(first_name)
		p "Bonjour, #{first_name} !"
	end

	def read_email
		return @email
	end

	def update_birthdate(birthdate_to_update)
		@birthdate = birthdate_to_update
	end

# méthodes privées ci-après
	private

	def check_email(email_to_save)
    # du code pour vérifier le format de l’e-mail (on ne rentre pas dans le détail)
    # si l’e-mail est ok, ça renvoie TRUE. Sinon FALSE
		return true	
	end

	def encrypt(string_to_encrypt)
		return "##ENCRYPTED##"
	end

	def show_itself
	    print "Voici l'instance : "
	    puts self
	end

# Redondant avec le "attr_accessor :email"
#	def update_email(email_to_update)
#		@email = email_to_update
#	end

	def read_mastercard
		return @mastercard
	end

end

binding.pry

puts "end of file"