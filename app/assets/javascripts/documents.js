var KeywordFinder = function(content, keywordsArray) {
  this.content = content;
  this.keywordsArray = keywordsArray;
}

KeywordFinder.prototype = {
  isKWinContent : function( keyword ) {
    var reg = new RegExp('\\b(' + keyword + '(?:e(?=s))?s?)\\b', "gi");
    var result = this.content.replace(reg, "<span class='" + spanClasses[keyword] + "'>$1</span>")
    // console.log
    console.log(result);
    // e.g.: 'bar foo'.replace( /(...) (...)/, '$2 $1' ).
    // kwf.content.replace(/\b(stor(?:e(?=s))?s?)\b/gi, '<span>$1</span>')
  }

  // returnHtml : function() {
  //   // return the content, in a <p> tag, with keywords wrapped in <span> with id="kw[index]"
  // }
}

var fakeContent = 'church churches store stores beer beers  I went to the store.  I bought milk, and cereal, and thought about the state of the world, also there was a cat. I like stores. I like cats. Dont like Milk.'


var fakeKWarray = [ 'I', 'store', 'cat', 'milk' ]

var spanClasses = { 'I': "top", 'store': 'middle', 'cat': 'low', 'milk': 'zero'}




var kwf = new KeywordFinder(fakeContent, fakeKWarray)

////  TODO -
/// from server, when we recieve alchemy object, include plurals as returned by rails






























