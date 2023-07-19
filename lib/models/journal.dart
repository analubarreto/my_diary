class Journal {
  String id;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  Journal({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
