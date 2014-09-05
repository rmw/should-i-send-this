var KeywordFinder = function(content, keywordsArray) {
  this.content = content;
  this.keywordsArray = keywordsArray;
  this.spanClasses;
}

KeywordFinder.prototype = {
  wrapKWinSpan : function( keyword ) {
    var reg = new RegExp('\\b(' + keyword + '(?:e(?=s))?s?)\\b', "gi");
    var result = this.content.replace(reg, "<span class='" + keyword + "'>$1</span>")
    this.content = result;
  },
  wrapKeyWords : function() {
    var _this = this;
    var kws = _this.keywordsArray;
    for (var i = 0; i < kws.length; i++){
      _this.wrapKWinSpan( kws[i] )
    }

    console.log(_this.content);
  },
  prepSpanClasses : function() {

  }

  // returnHtml : function() {
  //   // return the content, in a <p> tag, with keywords wrapped in <span> with id="kw[index]"
  // }
}

// var fakeContent = 'church churches store stores beer beers  I went to the store.  I bought milk, and cereal, and thought about the state of the world, also there was a cat. I like stores. I like cats. Dont like Milk.'


// var fakeKWarray = [ 'I', 'store', 'cat', 'milk', 'state of']

// TODO - specfic clases for KW priority
// var spanClasses = { 'I': "top", 'store': 'middle', 'cat': 'low'}




var kwf = new KeywordFinder(fakeContent, fakeKWarray)

////  TODO -
/// from server, when we recieve alchemy object, include plurals as returned by rails






























