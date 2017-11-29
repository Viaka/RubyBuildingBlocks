def shift(phrase, val)
  final = ""
  phrase.split("").each { |x| 
    #checks if the value is an upper case letter
    if ((x.ord) > 64 and (x.ord) < 91) then
    #Checks if the value after shift is out of bounds
      if (x.ord + val) > 90 then final << (x.ord + val - 26).chr
      else final << (x.ord + val).chr
      end
    #checks if the value is an lower case letter
    elsif ((x.ord) > 96 and (x.ord) < 123) then
    #Checks if the value after shift is out of bounds
      if (x.ord + val) > 122 then final << (x.ord + val - 26).chr
      else final << (x.ord + val).chr
      end
    else final << x.ord.chr
    end  
  }
  puts final
end

shift "ABCXYZ abcxyz", 3