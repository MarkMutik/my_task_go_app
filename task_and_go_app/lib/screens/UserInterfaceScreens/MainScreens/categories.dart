
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String profession;
  final String imagePath;

  Category({required this.profession, required this.imagePath});

  @override
  List<Object?> get props => [profession, imagePath];
  static List<Category> categories = [
    Category(
      profession: 'Electrician',
      imagePath: 'images/carousel_images/black_electrician.jpeg',
    ),
    Category(
      profession: 'Gardener',
      imagePath: 'images/carousel_images/gardener.image.jpeg',
    ),
    Category(
      profession: 'Mechanic',
      imagePath: 'images/carousel_images/mechanic image.jpeg',
    ),
    Category(
      profession: 'Painter',
      imagePath: 'images/carousel_images/black_painter.webp',
    ),
    Category(
      profession: 'Plumber',
      imagePath: 'images/carousel_images/black_plumber.jpeg',
    ),
  ];
}



