# encoding: UTF-8

module NewAge
  module RSpec
    module Helpers

      def self.all_together
        space_or_not = [" ", ""]
        
        delims = %w{, . -} << " "
        
        y_specifier = ["year", "years", "y", "ys", "yrs", "" ]
        m_specifier = ["month", "months", "m", "ms", "mths", "" ]
        
        yn = ((1..121).to_a.shuffle[0 .. y_specifier.length - 2 ]).shuffle 
        
        mn = ((1..11).to_a.shuffle[0 .. m_specifier.length - 2 ]).shuffle 
        
        n_spread = yn.flat_map{|y| mn.map{|m| [y,m] }} + (yn * (y_specifier.length - 1)).map{|y| [y,0]} + (mn * ( m_specifier.length - 1)).map{|m| [0,m]} 
        
        ymd = []; n_spread.zip( delims.cycle ).flatten.each_slice(3){|x| ymd << x }; ymd.uniq! 
        
        
        inputs = ymd.map{|y,m,d| "#{y}#{space_or_not.sample}#{y_specifier.sample}#{d}#{m}#{space_or_not.sample}#{m_specifier.sample}" } 
        # a real rag tag of inputs!
        
        all_together = Hash[ inputs.zip( ymd.zip ymd.map{|y,m,_| "#{y} years #{m} months"  } ) ]
      end
      
    end
  end  
end