# encoding: UTF-8

require_relative "./NewAge/version.rb"

module NewAge

  module Helpers
  
    # Pass in a string with either two numbers,
    # or one number for just a year, or a number with an indicator such as "m" or "y", like so:
    # "n years m months" or
    # "n" for years only or
    # "n m months" or
    # "m months" or
    # "n y m m" or
    # "n yrs m mths" or something similar. It may accept things like "11 minutes" (it will think you mean 11 months) because it's not *that* concerned about being exact, so be careful.
    # @example
    #   parse( "15 y 6 m" ) => {years: 15, months: 6}
    # @params [String] s
    # @return [Hash]
    def parse( s )
      raise ArgumentError, "Must provide a string to parse!" if s.nil? || s.empty? 
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
          raise ArgumentError, %q!The string wasn't in a format NewAge recognises, try `n years m months`!
      end
      
      raise ArgumentError, "There are only 12 months in a year." if age[:months] >= 12
      
      raise ArgumentError, "The longest confirmed human life span was Jeanne Calment's at 122 years, 164 days. I doubt you need more than that." if age[:years] >= 122 && age[:months] >= 7
      
      raise ArgumentError, "I wasn't born yesterday!" if age[:years].zero? && age[:months].zero?
      
      age
    end
  end
  
  # Transform inputs into atomicised numbers for a person's age.
  class Age
    extend Helpers
    
    DEFAULTS = {years: 0, months: 0}
    
    # @overload new( Hash )
    #   @param [Hash] opts Options hash
    #   @option opts [Integer] years
    #   @option opts [Integer] months
    # @overload new( String )
    #   @param (see Helpers#parse)
    # @example
    #   age = NewAge::Age.new( years: 5, months: 11 )
    #   age = NewAge::Age.new( "28" )
    def initialize( opts=nil )
      opts = Age.parse(opts) if opts.kind_of? String
      opts ||= {}
      @age = DEFAULTS.merge opts
    end
    

    # @param [optional, String] format A sprintf format string.
    def to_s( format=nil )
      format ||= "%d years %d months"
      sprintf format, @age[:years], @age[:months]
    end
  end
end
