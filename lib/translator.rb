require 'pry'
require "yaml"


def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticons.each do |key, value|
      emoticons[key]= {}
      emoticons[key][:english] = value[0]
      emoticons[key][:japanese] = value[1]
  end
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, value|

    if emoticons[key][:english] == emoticon
      return emoticons[key][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    if emoticons[key][:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end