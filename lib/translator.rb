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

def get_japanese_emoticon(file_path, emoticons)
 sorry_message = "Sorry, that emoticon was not found"
  l_library = load_library(file_path)
  l_library.map do |new_hash, value|
    if emoticons == value[:english]
    return value[:japanese]
      #binding.pry
    end
  end 
 sorry_message
end


  
def get_english_meaning(file_path, emoticons)
  sorry_message = "Sorry, that emoticon was not found"
  l_library = load_library(file_path)
  english_emoticons = " "
  
  l_library.map do |new_hash, value|
    value.map do |key, value2|
      if value2 == emoticons
        english_emoticons = new_hash
      end
  
    end 
    if english_emoticons == " "
        english_emoticons = sorry_message
      end
  end 
  english_emoticons
end