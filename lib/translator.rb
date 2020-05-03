# require modules here
require 'pry'
require "yaml"

sorry_message = "Sorry, that emoticon was not found"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {}
  
  emoticons.map do |key, value| 
    new_hash[key] = {} 
       new_hash[key][:english] = value[0]
       new_hash[key][:japanese] = value[1]
  end
 new_hash
end

def get_japanese_emoticon(load_library, emoticons)
  
  
  # code goes here
end

def get_english_meaning(load_library, emoticons)
  english_emoticons = {}
binding.pry
   load_library.map do |emoticons, value|
     emoticons.map do |new_hash, value|
       new_hash.map do |key, value|
         if load_library[emoticons][new_hash][key][:english]
           english_emoticons << load_library[emoticons][new_hash][key][:english]
         end
         if !load_library[emoticons][new_hash][key][value][:english]
           puts sorry_message
         end
       end
     end 
   end 
   english_emoticons

end