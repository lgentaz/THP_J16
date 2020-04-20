require 'pry'
require 'time'

require_relative 'user'

class Event
	attr_accessor :start_date, :duration, :title, :attendees 
	attr_reader :end_date
	@@event_count = 0
	@@all_events = []

	def initialize(event_time, event_duration_min, event_title, event_attendees)
		@start_date = Time.parse(event_time)
		@duration = event_duration_min * 60
		self.end_date
		@title = event_title
		@attendees = []
		@attendees = event_attendees
		@@event_count = @@event_count + 1
		@@all_events << self
	end

	def postpone_24h
		self.start_date += 86400
		self.end_date
		return 
	end

	def end_date
		end_date = self.start_date + self.duration
		return end_date
	end
	
	def is_past?
# contrairement à la consigne de l'exercice j'ai choisi de considérer que 
# les evenements en cours ne sont pas des evenements "is_past?" ni "is_future?"
		return self.end_date < Time.now
	end

	def is_future?
		return self.start_date > Time.now
	end

	def is_soon?
		soon_date = self.start_date - Time.now
		return soon_date <= 1800 && soon_date >=0
	end

	def is_now?
		return self.is_future? == false && self.is_past? == false
	end 

	def self.all
		return @@all_events
	end

	def to_s
		puts "> Titre : #{self.title}"
		puts "> Date de début : " + self.start_date.strftime("%d/%m/%Y %H:%M")
		puts "> Durée : #{(self.duration)/60} minutes"
		email_array = []
		self.attendees.each do |attendee|
			email_array << attendee.email
		end		
		puts "> Invités : #{email_array.join(", ")}"
	end

	def age_analysis
		age_array = []
		average = 0
		@attendees.each do |attendee|
			age_array << attendee.age
			average = average + attendee.age
		end
		average = average / @attendees.length
		puts "Voici les âges des participants :"
		puts age_array.join(", ")
		puts "La moyenne d'âge est de #{average} ans"
	end

end

class WorkEvent < Event

  attr_accessor :location

  def initialize(start_date, duration, title, attendees, location)
    @location = location # j'ai rajouté cette ligne
    super(start_date, duration, title, attendees) #fait appel au initialize de la classe Event
  end

  def is_event_acceptable?
    if @attendees.length > 3 || @duration > 60
      puts "Cette réunion ne respecte pas nos bonnes pratiques !"
      return false
    else
      puts "Cette réunion est OK."
      return true
    end
  end	

end


