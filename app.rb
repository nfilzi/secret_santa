require 'bundler/setup'
Bundler.require(:default)

require 'dotenv/load'
require 'yaml'

require_relative 'lib/data_structures/node'
require_relative 'lib/data_structures/circular_linked_list'

require_relative 'lib/entities/guest'
require_relative 'lib/services/send_text_message_to_guests'

guests_path  = File.join(File.dirname(__FILE__), "data/guests.yml")
guests_data  = YAML.load_file(guests_path)

guests = guests_data.shuffle.map {|guest_data| Guest.new(guest_data)}

list = CircularLinkedList.build(guests)
SendTextMessageToGuests.new(list).call
