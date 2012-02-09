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
          subject { NewAge::Age.parse }
          pending "it should probably throw a wobbly"
        end
        context "nil argument" do
          subject { NewAge::Age.parse nil }
          pending "it should probably throw a wobbly"
        end
      end
      context "i.e. bad data" do
        let(:bad_data) { "Hacky sack" }
        subject { NewAge::Age.parse bad_data }
        pending "it should probably throw a wobbly"
      end
    end
    
  describe "to_s" do
    
  end
  
end
