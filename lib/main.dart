import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();

    // TODO: implement build
    return MaterialApp(
      title: 'Welcome To Flutter',
      home: Scaffold(
          title: Text('Welcome To Flutter'),
        ),
        body: Center(
          //child: Text('Hello World'),
          //child: Text(wordPair.asPascalCase),
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
    final _suggestions = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 18.0);

    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        final wordPair = WordPair.random();
        return Text(wordPair.asPascalCase);
      }

    Widget _buildSuggestions() {
      return ListView.builder(
         padding: const EdgeInsets.all(16.0),
         itemBuilder: (context, i) {
           if (i.isOdd) return Divider();

           final index = i ~/ 2;

           if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
           } 

           return _buildRow(_suggestions[index]);
         }, 
      );
    }
      
}

class RandomWords extends StatefulWidget {
  @override RandomWordsState createState() => new RandomWordsState();
}