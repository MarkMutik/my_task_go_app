import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_and_go_app/Widgets/widgets.dart';
import 'categories.dart';
import 'package:task_and_go_app/components/profession_pages/profession.dart';
// this enum shows the occupations that user can select from.
enum Professions { plumber, electrician, carpenter, painter,gardener }
// Create the categories in the firestorm database.
// Replace the profession names and image paths with the ones you want to use from the database.
// The image paths are the paths to the images in the database.
// The profession names are the names of the professions in the database.
// The image paths and profession names must be in the same order.

class HomeScreen extends StatelessWidget {
  void signOut() async {
    FirebaseAuth.instance.signOut();
  }
  static const String routeName = 'home_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyCustomSilverAppBar(
              showLeading: true,
              pinned: false, snap: false, floating: true,
              icon: Icons.search,
              title: 'I\'m looking for a...', onPressed: () {
                Navigator.pushNamed(context, 'search-page');
              }),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: CarouselSlider(
                    items: Category.categories.map((category) => HeroCarouselCard(category: category,)
                    ).toList(),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 1.5,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0,),
    );
  }
}


class HeroCarouselCard extends StatelessWidget {
  final Category category;
  const HeroCarouselCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        switch(category.profession) {
          case 'Electrician':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProfessionGridView(),
              ),
            );
        }
      },
      child: Container(
        height: 200,
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Stack(
            children: [
              Image.asset(category.imagePath, fit: BoxFit.cover,
                width:double.infinity,
              height:300),
              Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        category.profession,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

