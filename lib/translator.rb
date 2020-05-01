require 'yaml' # require modules here
require 'pry'

# Write a method, `load_library`, that loads the `emoticons.yml` file. This
#   method should return a hash where each key is the name of an emoticon.
# Each
#   emoticon name should point to a _nested_ hash containing two keys,
#   `:english` and `:japanese`. These keys will point to English and Japanese
#   versions of the emoticon. If `lib/emoticons.yml` had just one translation:

#   ```text
#   happy:
#     - ":)"
#     - "(＾ｖ＾)"
#   ```
   
   # translator_hash = {
#       'happy' => {
#         :english => ":)",
#         :japanese => "(＾ｖ＾)"
#       }
#   }

# replace an array of two elements with a hash with two key value pairs keys being english and japanese and the values being the two elements 
   
  #hash.merge(hash) {|k,v| v*2 }   => {:c=>6, :a=>2, :b=>4}
   
def load_library(lib)
  #load the emoticon.yml file 
  emoticons = YAML.load_file(lib)
  translated_hash = emoticons.merge(emoticons) {|emo_name, emo_array| {
         :english => emo_array[0],
         :japanese => emo_array[1]
       }}
end





def get_japanese_emoticon(lib, eng_emo)
  translated_hash = load_library(lib)
  translated_hash.each do |emo_name, emo_hash|
   if emo_hash[:english] == eng_emo
     return emo_hash[:japanese]
   end 
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(lib, jap_emo)
  translated_hash = load_library(lib)
  translated_hash.each do |emo_name, emo_hash|
    if emo_hash[:japanese] == jap_emo
      return emo_name
    end
  end
  "Sorry, that emoticon was not found"
end

#slate_has_children = !slate[:person][:children].nil?

# def get_english_meaning
#   emoticons = YAML.load_file('lib/emoticons.yml')
#   puts emoticons.inspect
#   #if english returns :english
# end