# encoding: UTF-8

require_relative './rspec_helper.rb'

describe "Age" do
  describe :parse do
    context "Given valid data" do
      
      NewAge::RSpec::Helpers.all_together.each do |input,(ymd,output)|
        it "should return a hash with #{output} in it given #{input}" do
          NewAge::Age.parse( input ) == {years: ymd.first, months: ymd[1]} 
        end
      end
    end
    context "Given invalid data" do
      context "i.e. no data at all"
        context "no arguments" do
          it "should probably throw a wobbly" do
            expect { NewAge::Age.parse }.to raise_error(ArgumentError)
          end
        end
        context "nil argument" do
          it "should probably throw a wobbly" do
            expect { NewAge::Age.parse nil }.to raise_error(ArgumentError)
          end
        end
      end
      context "i.e. bad data" do
        context "Silly things" do
          let(:bad_data) { "Hacky sack" }
          it "should probably throw a wobbly" do
            expect { NewAge::Age.parse bad_data }.to raise_error(ArgumentError)
          end
        end
        context "Someone with no age" do
          let(:bad_data) { "0y 0m" }
          it "should probably throw a wobbly" do
            expect { NewAge::Age.parse bad_data }.to raise_error(ArgumentError)
          end
        end
        context "Someone far too old to be human" do
          let(:bad_data) { "123y 7m" }
          it "should probably throw a wobbly" do
            expect { NewAge::Age.parse bad_data }.to raise_error(ArgumentError)
          end
        end
        
      end
    end
    
  describe "to_s" do
    context "Given no format" do
      NewAge::RSpec::Helpers.all_together.each do |input,(ymd,output)|
        it "should return an output of #{output} given #{input}" do
          age = NewAge::Age.new( input )
          age.to_s.should == output
        end
      end
    end
    context "Given a format" do
      context " of n yrs n mths" do      
        NewAge::RSpec::Helpers.all_together.each do |input,(ymd,output)|
          it "should return an output of #{ymd[0]} yrs #{ymd[1]} mnths given #{input}" do
            age = NewAge::Age.new( input )
            age.to_s( "%d yrs %d mnths" ).should == "#{ymd[0]} yrs #{ymd[1]} mnths"
          end
        end
      end
    end
  end
  
end
