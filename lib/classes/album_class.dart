class LofiClass {
  final String imagePath;
  final String title;

  LofiClass({
    required this.imagePath,
    required this.title,
  });
}

List<LofiClass> myLofiAlbums = [
  LofiClass(
    imagePath: 'assets/albums/album1.png',
    title: 'Forest',
  ),
  LofiClass(
    imagePath: 'assets/albums/album2.png',
    title: 'Ocean waves',
  ),
  LofiClass(
    imagePath: 'assets/albums/album3.png',
    title: 'Sweet Dreams',
  ),
  LofiClass(
    imagePath: 'assets/albums/album4.png',
    title: 'Night Island',
  ),
  LofiClass(
    imagePath: 'assets/images/lofi_wallpaper2.png',
    title: 'Rain sounds',
  ),
];
