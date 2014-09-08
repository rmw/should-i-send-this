# var kw = JSON.parse( $("#rawkeywords").text() );
# var concepts = JSON.parse( $("#rawconcepts").text() );
# var sentiment = JSON.parse( $("#rawsentiment").text() );
# var content = $('#content').text();

# kwf = new KeywordFinder(content, kw);

# kwf.wrapKeyWords();

# kwf.renderHighlighted();

# var KeywordFinder = function(content, keywordsArray) {
#   this.content = content;
#   this.keywordsArray = keywordsArray;
#   this.spanClasses;
# }

# KeywordFinder.prototype = {
#   wrapKWinSpan : function( keyword ) {
    # var reg = new RegExp('\\b(' + keyword + '(?:e(?=s))?s?)\\b', "gi");
#     var result = this.content.replace(reg, "<span class='highlight'>$1</span>")
#     this.content = result;
#   },
#   wrapKeyWords : function() {
#     var _this = this;
#     var kws = _this.keywordsArray;
#     for (var i = 0; i < kws.length; i++){
#       _this.wrapKWinSpan( kws[i] )
#     }
#   },
#   prepSpanClasses : function() {

#   },
#   renderHighlighted : function() {
#     var _this = this;
#     $('#content').html(_this.content);
#   }
# }

# "<span class='highlight-#{k}'>#{word}</span>"
module VersionsHelper
  def add_highlight_spans(version, alchemist)
    content = version.content
    keywords = three_keywords_with_variations(alchemist.keywords)

    keywords.each do |k, v|

      wrap_word_in_span(k, v, content)

    end
    p '#'*50
    p content
    puts
    p '#'*50


    content
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

  def wrap_word_in_span(k, v, content)
    content = content
    v.each do |word|
      content.gsub!(/[word]/, "<span class='highlight-#{k}'>#{word}</span>")
    end
    content
  end



end































