class BookModel {
  String title;
  String description;
  bool isRead;

  BookModel({this.title = '', this.description = '', this.isRead = false});
}

final booksMock = [
  BookModel(title: 'Book 1', description: 'Description 1', isRead: false),
  BookModel(title: 'Book 2', description: 'Description 2', isRead: true),
  BookModel(title: 'Book 3', description: 'Description 3', isRead: false),
  BookModel(title: 'Book 4', description: 'Description 4', isRead: true),
  BookModel(title: 'Book 5', description: 'Description 5', isRead: true),
];
