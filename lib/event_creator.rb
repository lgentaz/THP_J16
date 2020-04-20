require 'pry'
require 'time'
require_relative 'event'

class EventCreator 
	attr_accessor :start_date, :duration, :title, :attendees 
	attr_reader :end_date
	@@event_count = 0
	@@all_events = []

	def initialize
		@title = get_title
		@start_date = get_date
		@duration = get_duration
		@attendees = get_attendees
		@@all_events << self
	end

	def parsing(date)
		date = date.gsub(/le/, "")
		date = date.gsub(/la/, "")
		date = date.gsub(/à/, "")		
		return Time.parse(date)
	end

	def get_title
		puts "Salut, tu veux créer un événement ? Cool !"
	
		puts "Commençons. Quel est le nom de l'événement ?"
		return event_title = gets.chomp
	end
	
	def get_date
		puts "Super. Quand aura-t-il lieu ?"
		event_date = gets.chomp
		return parsing(event_date)
	
	end
	
	def get_duration
		puts "Au top. Combien de temps va-t-il durer (en minutes) ?"
		event_duration = gets.chomp.to_i * 60
	end
	
	def get_attendees
		puts "Génial. Qui va participer ? Balance leurs e-mails"
		event_attendees = []
		event_attendees << gets.chomp
		puts "Super, c'est noté, ton évènement a été créé !"
	end
		
#	binding.pry

end

