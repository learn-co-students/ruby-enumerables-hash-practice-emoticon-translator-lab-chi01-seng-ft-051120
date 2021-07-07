# require modules here
require "yaml"
require "pry"

def load_library(filepath)
  # code goes here
  
  emoji_data = YAML.load_file(filepath)
#  emoji_data.transform_keys!(&:to_sym)
  emoji_hash = {}
  emoji_data.each do |emotion_txt, emotion_sym|
    if emoji_hash[emotion_txt] == nil
      emoji_hash[emotion_txt] = {:english => emotion_sym[0], :japanese => emotion_sym[1]}
    end
  end
#  binding.pry
  emoji_hash
end

def get_japanese_emoticon(filepath, emoji)
  # code goes here
  
  jpn_data = load_library(filepath)
  
  jpn_emoticon = ""
  jpn_sorry = "Sorry, that emoticon was not found"
  jpn_data.each do |name, values|
    if values.value?(emoji)
      jpn_emoticon = values[:japanese]
    end
  end
  if jpn_emoticon.empty?
    jpn_sorry
  else
    jpn_emoticon
  end
end

def get_english_meaning(filepath, emoji)
  # code goes here
  
  eng_data = load_library(filepath)
  eng_name = ""
  eng_sorry = "Sorry, that emoticon was not found"
  eng_data.each do |name, values|
    if values.value?(emoji)
      eng_name = name
    end
  end
  if eng_name.empty?
    eng_sorry
  else
    eng_name
  end
end