var KeywordFinder = function(content, keywordsArray) {
  this.content = content;
  this.keywordsArray = keywordsArray;
  this.spanClasses;
}

KeywordFinder.prototype = {
  wrapKWinSpan : function( keyword ) {
    var reg = new RegExp('\\b(' + keyword + '(?:e(?=s))?s?)\\b', "gi");
    var result = this.content.replace(reg, "<span class='highlight'>$1</span>")
    this.content = result;
  },
  wrapKeyWords : function() {
    var _this = this;
    var kws = _this.keywordsArray;
    for (var i = 0; i < kws.length; i++){
      _this.wrapKWinSpan( kws[i] )
    }
  },
  prepSpanClasses : function() {

  },
  renderHighlighted : function() {
    var _this = this;
    $('#content').html(_this.content);
  }
}

// var fakeContent = 'church churches store stores beer beers  I went to the store.  I bought milk, and cereal, and thought about the state of the world, also there was a cat. I like stores. I like cats. Dont like Milk.'


// var fakeKWarray = [ 'I', 'store', 'cat', 'milk', 'state of']

// TODO - specfic clases for KW priority
// var spanClasses = { 'I': "top", 'store': 'middle', 'cat': 'low'}


$( document ).ready(function() {

  // ON READY - GRAB KEYWORDS CONCEPTS SENTIMENT FROM VIEW
  var kw = JSON.parse( $("#rawkeywords").text() );
  var concepts = JSON.parse( $("#rawconcepts").text() );
  var sentiment = JSON.parse( $("#rawsentiment").text() );
  var content = $('#content').text();

  kwf = new KeywordFinder(content, kw);

  kwf.wrapKeyWords();

  kwf.renderHighlighted();

  $(".compare-cons").hide();

  $("button").on("click", function() {
    $(".compare-cons").show();
  })

});















