module VersionsHelper
 def add_highlight_spans(version, alchemist)
   content = version.content
   keywords = three_keywords_with_variations(alchemist.keywords)

   keywords.each do |k, v|
     wrap_word_in_span(k, v, content)
   end

   content.html_safe
 end

 private

 def three_keywords_with_variations(keywords)
   top_three = keywords.take(3)
   ratings_hash = {high: nil, medium: nil, low: nil}

   i = 0
   ratings_hash.each_key do |key|
     word = top_three[i]
     gamut = [word, word.pluralize, word.singularize, word.capitalize, word.downcase].uniq
     ratings_hash[key] = gamut
     i += 1
   end
   ratings_hash
 end

 def wrap_word_in_span(a, b, content)
   content = content

   b.each do |word|
     expr = /\b#{word}\b/
     content.gsub!(expr, "<span class='#{a}'>#{word}</span>")
     p content
   end
   content
  end
end


















