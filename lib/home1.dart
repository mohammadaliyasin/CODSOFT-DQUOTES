import 'package:flutter/material.dart';
import 'package:quotes_app/modelclass.dart';
import 'package:quotes_app/widget/favoritebutton.dart';
import 'package:quotes_app/widget/sharebutton.dart';

class Home1 extends StatelessWidget {
  Home1({super.key});
  final List<Quotes> quotes = [
    Quotes(
        authorName: 'Albert Einstein',
        quote:
            'Life is like riding a bicycle. To keep your balance, you must keep moving.'),
    Quotes(
        authorName: 'Isaac Newton',
        quote:
            'If I have seen further it is by standing on the shoulders of Giants.'),
    Quotes(authorName: 'Yoda', quote: 'Do, or do not. There is no try.'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd8f3dc),
      appBar: AppBar(
        backgroundColor: const Color(0xff1b4332),
        title: const Text(
          'DQUOTES',
          style: TextStyle(
            color: Color(0xffb7e4c7),
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 0.6,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: quotes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final quote = quotes[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 500,
                    width: 400,
                    child: Card(
                      color: const Color(0xff1b4332),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Center(
                              child: Text(
                                quote.quote,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffd8f3dc),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '~ ${quote.authorName}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffb7e4c7),
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ShareButton(contentToShare: ''),
              // FavoriteButton(
              //   cardId: '',
              // ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Made With ❤️ By Ali Yasin',
            style: TextStyle(
                color: Color(0xff1b4332),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}
