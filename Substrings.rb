

def substrings (phrase, dictionary)
  #instantiate hash and lowercase incoming phrase
  wordsFound = Hash.new
  phrase.downcase!

  dictionary.each do |word|
	#lowercase current dictionary word
    word.downcase!
    startIndex = -1
    numOccurrences = -1
	#Traverse the current dictionary word
    while startIndex != nil
      numOccurrences += 1
	  #find the dictionary word in the phrase and set the index after the phrase. 
	  #end of phrase makes startIndex nil and breaks loop
      startIndex = phrase.index(word, startIndex + 1)
    end
	#includes the number of occurrences found in the hash at the word index
    wordsFound[word] = numOccurrences unless numOccurrences == 0

  end

  return wordsFound
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Howdy partner, sit down! How's it going?", dictionary)