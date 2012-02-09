# encoding: UTF-8

require 'rspec'
require_relative "../lib/NewAge.rb"


Spec_dir = File.expand_path( File.dirname __FILE__ )


require "logger"
logger = Logger.new STDOUT
logger.level = Logger::DEBUG
logger.datetime_format = '%a %d-%m-%Y %H%M '
LOgger = logger


Dir[ File.join( Spec_dir, "/support/**/*.rb")].each do |f| 
  logger.info "requiring #{f}"
  require f
end


# RSpec.configure do |c|
#   c.include NewAge::RSpec::Helpers
# end