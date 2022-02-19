class Book {
  final String title;
  final String urlImage;

  const Book({required this.title, required this.urlImage});
}

const allBooks = [
  Book(
      title: 'Book1',
      urlImage:
          'https://img.yakaboo.ua/media/catalog/product/cache/1/image/398x565/31b681157c4c1a5551b0db4896e7972f/d/0/d0a381_e32c55bb13ef431d8915a3ca189a94b9_mv2.jpg'),
  Book(
      title: 'Book2',
      urlImage:
          'https://img.yakaboo.ua/media/catalog/product/cache/1/image/398x565/31b681157c4c1a5551b0db4896e7972f/i/m/img038_7_13.jpg')
];
