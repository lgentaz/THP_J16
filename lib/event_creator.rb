require 'pry'

class EventCreator 
	attr_accessor :start_date, :duration, :title, :attendees 
	attr_reader :end_date
	@@event_count = 0
	@@all_events = []

	def initialize(event_date, event_duration_min, event_title, event_attendees)
		
	end

	def menu
		puts "Salut, tu veux créer un événement ? Cool !"
		puts "Commençons. Quel est le nom de l'événement ?"
		event_title = gets.chomp
		puts "Super. Quand aura-t-il lieu ?"
		event_date = gets.chomp
		puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
		event_date = gets.chomp.to_i
		puts "Génial. Qui va participer ? Balance leurs e-mails"
		event_date = gets.chomp
		puts "Super, c'est noté, ton évènement a été créé !"
		return event_date, event_duration_min, event_title, event_attendees
	end	
	
	initialise(menu)

end