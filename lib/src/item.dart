class Item {
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final List<int> parts;
  final int score;
  final String text;
  final int time;
  final String title;
  final String type;

  const Item({this.by, this.descendants, this.id, this.kids, this.parts, this.score,
      this.text, this.time, this.title, this.type});

  factory Item.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Item(
      by: json['by'] ?? null,
      descendants: json['descendants'] ?? null,
      id: json['id'] ?? null,
      kids: List<int>.from(json['kids']) ?? null,
      parts: List<int>.from(json['parts']) ?? null,
      score: json['score'] ?? null,
      text: json['text'] ?? null,
      time: json['time'] ?? null,
      title: json['title'] ?? null,
      type: json['type'] ?? null,
    );
  }
}
