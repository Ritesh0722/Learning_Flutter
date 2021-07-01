import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuoteList()
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(text: 'Be yourself; everyone else is already taken.', author: 'John Wild'),
    Quote(text: 'I have nothing to declare except my genius.', author: 'Oscar Fisch'),
    Quote(author: 'Oscar Wilder',text: 'The truth is rarely pure and never simple.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes!'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            }
          )).toList(),
        ),
    );
  }
}
