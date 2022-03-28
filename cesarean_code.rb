def cesarean_code(text,key = 1)

  alphabet = "abcdefghijklmnopqrstuvwxyz"
  alphabet_up = alphabet.upcase
  cesar = ""

  text.chars.each_with_index do |letter,index|
    if letter in 'a'..'z'
      index = (alphabet.index(letter) + key)%26
      cesar+=alphabet[index]
    elsif letter in 'A'..'Z'
      index = (alphabet_up.index(letter) + key)%26
      cesar += alphabet_up[index]
    else cesar += letter
    end
  end

  cesar
end

=begin
text = "What a string!"
puts cesarean_code(text,1)
=end

