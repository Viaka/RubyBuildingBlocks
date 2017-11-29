
def stock_picker(days)
	highest, hIndex = 0
	#find highest value excluding day 1.  Save value and index
	days.drop(1).each {|x| 
  	if x > highest 
  		then highest = x 
  		hIndex = days.index(x) + 1
  	end
	}
	#Find lowest value using highest as baseline.  Save value and index
	lowest = highest
	lIndex = 0
	days.slice(0...hIndex).each {|y| 
  	if y <= lowest 
  		then lowest = y
  		lIndex = days.index(y) + 1
  	end	
	}
	puts "Buy at \$#{lowest} on day #{lIndex}"
	puts "Sell at \$#{highest} on day #{hIndex}"
	puts "You made a \$#{highest - lowest} profit!"
end

stock_picker [17,3,6,9,15,8,6,1,10]