class BookModel {
  final int id;
  final String title;
  final String author;
  final String category;
  final String categoryId;
  final int pageCount;
  final String summary;
  final int publishYear;
  final String isbn;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.categoryId,
    required this.pageCount,
    required this.summary,
    required this.publishYear,
    required this.isbn,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      categoryId: json['categoryId'],
      pageCount: json['pageCount'],
      summary: json['summary'],
      publishYear: json['publishYear'],
      isbn: json['isbn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'categoryId': categoryId,
      'pageCount': pageCount,
      'summary': summary,
      'publishYear': publishYear,
      'isbn': isbn,
    };
  }
}
