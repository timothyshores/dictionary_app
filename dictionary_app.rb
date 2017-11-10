require "unirest"
system "clear"
continue = true

while continue == true

  print "","Please enter a word or else enter q to quit: "
  input_word = gets.chomp

  if input_word == 'q'
    break
  end

  definition = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5").body[1]["text"]
  puts "", "Definition: " + definition

  example = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/examples?includeDuplicates=false&useCanonical=false&skip=0&limit=5&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5").body["examples"][0]["text"]
  puts "", "Example: " + example

  pronunciation = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5").body[0]["raw"]
  puts "", "Pronunciation: " + pronunciation,"",""

end