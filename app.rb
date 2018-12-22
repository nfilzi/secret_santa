require 'bundler/setup'
Bundler.require(:default)

require 'dotenv/load'
require 'yaml'

require_relative 'lib/data_structures/node'
require_relative 'lib/data_structures/circular_linked_list'

require_relative 'lib/entities/guest'
require_relative 'lib/services/build_guests'
require_relative 'lib/services/dump_list_to_file'
require_relative 'lib/services/send_text_message_to_guests'


guests_filepath = File.expand_path(File.dirname(__FILE__), "data/guests.yml")
guests          = BuildGuests.new(guests_filepath).call

list = CircularLinkedList.build(guests)

DumpListToFile.new(list).call
# SendTextMessageToGuests.new(list).call