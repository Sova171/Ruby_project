def substrings(text, dictionary)
  text = text.downcase.split
  my_hash = Hash.new(0)
  dictionary.each do |word|
  text.each do |count|
  if count.include?(word)
    my_hash[word] += 1
  end
  end
  end
  my_hash
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)