import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quotes_app/modelclass.dart';
import 'package:quotes_app/widget/favoritebutton.dart';
import 'package:quotes_app/widget/sharebutton.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Set<String> favorites = Set<String>();

  Future<List<Quote>> fetchQuotes() async {
    final response = await http.get(Uri.parse('https://type.fit/api/quotes'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((quote) => Quote.fromJson(quote)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  void toggleFavorite(String quoteText) {
    setState(() {
      if (favorites.contains(quoteText)) {
        favorites.remove(quoteText);
      } else {
        favorites.add(quoteText);
      }
    });
  }

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
      body: FutureBuilder<List<Quote>>(
        future: fetchQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No quotes available'));
          } else {
            final quotes = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      final quote = quotes[index];
                      final isFavorite = favorites.contains(quote.text);
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          height: 100,
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
                                      quote.text ?? 'No quote available',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Color(0xffd8f3dc),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '~ ${quote.author}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xffb7e4c7),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 150),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      ShareButton(contentToShare: quote.text ?? 'No quote available'),
                                      FavoriteButton(
                                        isFavorite: isFavorite,
                                        onPressed: () => toggleFavorite(quote.text ?? 'No quote available'),
                                      ),
                                    ],
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
            );
          }
        },
      ),
    );
  }
}