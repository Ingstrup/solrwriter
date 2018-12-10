local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)
require 'reader'
require 'writer'

feeds = Reader.new.read
Writer.new(feeds).write

puts 'done'
