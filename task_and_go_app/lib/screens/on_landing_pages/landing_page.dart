import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'splash.dart';
class on_Landing_Page extends StatefulWidget {
  static const String routeName = 'landing-page';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => on_Landing_Page(),
    );
  }

  @override
  State<on_Landing_Page> createState() => _on_Landing_PageState();
}
class _on_Landing_PageState extends State<on_Landing_Page> {
  PageController _screenController = PageController(initialPage: 0);
  bool on_final_page = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children : [
          PageView(
            controller: _screenController,
            onPageChanged: (page){
              setState(() {
                on_final_page = (page == 2);
              });
            },
            children: [
              Page_1(),
              Page_2(),
              Page_3(),
            ],
          ),
          Container(
            alignment:Alignment(0,0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TO CHECK AND IDENTIFY IF THE USER IS CURRENTLY ON PAGE 2
                on_final_page?
                GestureDetector(
                  // IF ON FINAL PAGE RETURN BACK TO THE PREVIOUS PAGE I.E PAGE 1
                  // ALSO THE TEXT IS CHANGED TO 'BACK INSTEAD OF NEXT
                  onTap: (){
                   _screenController.jumpToPage(0);
                  },
                  child: Text(
                    'Back',
                    style: Theme.of(context).textTheme.displayMedium
                  ),
                ):
                GestureDetector(
                  onTap: (){
                    // IF THE USER ISN'T ON THE LAST PAGE
                    // JUST SCROLL OR TAP TO GO TO THE NEXT PAGE
                    _screenController.nextPage(duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                SmoothPageIndicator(
                  // THIS WIDGET IS JUST A COOL FEATURE I ADDED
                  // WHEN THE USER CHANGES THE PAGE IT MOVES AS WELL.
                  controller: _screenController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.black,
                    dotHeight:20,
                  ),
                ),
                on_final_page ?
                GestureDetector(
                  // IF on second page clear pages and navigate to authentication page.
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, 'login-screen', (route) => false);
                  },
                  child: box(),
                ):
                GestureDetector(
                  // IF THE USER REACHES THE LAST PAGE
                  // NAVIGATE TO THE LOGIN PAGE.
                  onTap: (){
                    _screenController.jumpToPage(2);
                    },
                  child: Text('Skip',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class box extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {return
    Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
        ),
        height:60,
        width:150,
        child: Center(
          child: Text('Continue',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );}
}

