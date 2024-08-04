
class Quotes {
  final String authorName;
  final String quote;

  Quotes({required this.authorName, required this.quote});

  @override
  String toString() {
    return 'Quotes{authorName: $authorName, quote: $quote}';
  }
}


class Quote {
  String? text;
  String? author;

  Quote({this.text, this.author});

  Quote.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['author'] = this.author;
    return data;
  }
}