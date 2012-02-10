## Welcome to the New Age! ##

Excuse me while I light some scented candles...

Handling age as an input is pain. Should it be 12.5? 12 years? Two separate fields on a form, one for year, one for month?

    puts NewAge "12y 5m"   #=> "12 years 5 months"

    NewAge("28").age       #=> {years: 28, months: 0}
    
    puts NewAge "9 months" #=> "0 years 9 months"

    NewAge("72 y 6m").to_s #=> "72 years 6 months"
    NewAge("72 y 6m").to_s( "%d YEARS" ) #=> "72 YEARS"

    puts NewAge "12.5"     #=> 12 years 5 months
    # No, I don't think it should be 6 months.

    puts NewAge "12.11"    #=> 12 years 11 months
    puts NewAge "12 11"    #=> 12 years 11 months
    puts NewAge "12-11"    #=> 12 years 11 months
    puts NewAge "12"       #=> 12 years 0 months
    puts NewAge "12 m"     #=> 0 years 12 months

There's nothing but years and months as that is all I need for now. The validation is not very strict, just enough to let two numbers in that are recognised as a year and a month. 

## Licence ##

This is under the MIT Licence.

Copyright (c) 2012 Iain Barnett

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

In other words, be good.
