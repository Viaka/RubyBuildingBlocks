def shift(phrase, val)
  phrase.split("").each { |x| 
    #checks if the value after shift is an upper case letter
    if ((x.ord + val) > 64 and (x.ord + val) < 91) then
    #Checks if the value after shift is out of bounds
      if (x.ord + val) > 90 then puts (x.ord + val - 26).chr
      else puts (x.ord + val).chr
      end
    end
    
    #elsif ((x.ord - val) > 96 and (x.ord - val) < 123) then puts (x.ord + val).chr
    
    #puts x.chr
   # + val).chr
    
  }
  #puts final
end

shift "WXYZ", 3