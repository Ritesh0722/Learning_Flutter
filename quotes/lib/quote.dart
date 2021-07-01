class Quote {

  String text;
  String author;

  // '{}' are used for converting the parameters into named parameters
  //  as in for calling "Quote(text: __your_text__, author: __your_author__);"

  // Quote({String text, String author}) {
  //   this.text = text;
  //   this.author = author;
  // }
  Quote({this.text, this.author});

}