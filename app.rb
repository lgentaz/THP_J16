require 'pry'

# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/event_creator'

# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.
 alice = User.new("alice@poutoum.org", 33)
 polo = User.new("polo@kookaii.org", 32)
 april = User.new("oneill@kawabbunga.org", 51)

anniv = Event.new("2019-01-13 09:00", 10, "anniversaire joyeux", [alice, polo])
super_rdv = Event.new("2020-10-31 12:00", 30, "RDV super important", User.all)

anniv.age_analysis
anniv.to_s
super_rdv.age_analysis
super_rdv.to_s

 # je crée un WorkEvent
 meeting = WorkEvent.new("2019-01-17 09:00", 70, "réunion de travail", [april, polo], "au bureau")

binding.pry

# EventCreator.new.to_s


