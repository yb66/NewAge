# encoding: UTF-8

require "NewAge/version"

module NewAge
  class Age
    DEFAULTS = {years: 0, months: 0}
    
    # @param [Hash] opts Options hash
    # @option opts [Integer] years
    # @option opts [Integer] months
    def initialize( opts=nil )
      opts = Age.parse(opts) if opts.kind_of? String
      opts ||= {}
      @age = DEFAULTS.merge opts
    end
    
    def self.parse( s )
      age = {}
      case s
        when /^(\d+)$/ then 
          age[:years] = $1.to_i
        when /^(\d+)\D+(\d+)\D*/
          age[:years] = $1.to_i
          age[:months] = $2.to_i
        when /^(\d+)\s*m\w*$/
          age[:months] = $1.to_i
        else
          # something here?
      end
      
      age
    end
    
    def to_s( format=nil )
      format ||= "%d years %d months"
      sprintf format, @age[:years], @age[:months]
    end
  end
end
