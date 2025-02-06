import 'package:flutter/material.dart';

const url =
    'https://tripxl.com/blog/wp-content/uploads/2024/08/Darjeeling-Cover-Photo-3-840x425.jpg';
const descreption =
    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lectus augue, vulputate eget accumsan quis, pulvinar vitae urna. Phasellus turpis ipsum, faucibus nec tincidunt sit amet, posuere sed lorem. Cras dapibus velit ut tempus congue. Nam non luctus ipsum, quis porttitor orci. Etiam euismod mauris non orci condimentum pretium. Praesent in 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lectus augue, vulputate eget accumsan quis, pulvinar vitae urna. Phasellus turpis ipsum, faucibus nec tincidunt sit amet, posuere sed lorem. Cras dapibus velit ut tempus congue. Nam non luctus ipsum, quis porttitor orci. Etiam euismod mauris non orci condimentum pretium. Praesent in 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lectus augue, vulputate eget accumsan quis, pulvinar vitae urna. Phasellus turpis ipsum, faucibus nec tincidunt sit amet, posuere sed lorem. Cras dapibus velit ut tempus congue. Nam non luctus ipsum, quis porttitor orci. Etiam euismod mauris non orci condimentum pretium. Praesent in ''';

class IconDescription {
  IconData iconName;
  String description;

  IconDescription(this.iconName, this.description);
}

List<IconDescription> iconList = [
  IconDescription(Icons.call, 'CALL'),
  IconDescription(Icons.navigation, 'ROUTE'),
  IconDescription(Icons.share, 'SHARE'),
];

// * entry point of our app
void main() {
  // runs the main widget which holds the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /** This is the constructor of the MyApp class.
      The const keyword means this widget can be created as a compile-time constant, which improves performance by reducing widget rebuilds.
      { super.key, } is an optional named parameter that passes a Key to the superclass (StatelessWidget).
      super.key helps Flutter track widget changes efficiently.
   */
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Assignment Design",
      //     textDirection: TextDirection.ltr,
      //   ),
      //   backgroundColor: Colors.indigoAccent,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _showImage(),

            //address part
            _addressPart(),

            _iconRow(),

            _placeDecreption()
          ],
        ),
      ),
    );
  }
}

Widget _placeDecreption() {
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Text(
      descreption,
      style: TextStyle(
        fontSize: 14,
      ),
      textAlign: TextAlign.justify,
    ),
  );
}

Widget _iconRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      iconWithDescription(
          iconName: Icons.call, description: 'CALL', onPressed: () {}),
      iconWithDescription(
          iconName: Icons.navigation, description: 'ROUTE', onPressed: () {}),
      iconWithDescription(
          iconName: Icons.share, description: 'SHARE', onPressed: () {}),
    ],
  );
}

Widget _addressPart() {
  return Padding(
    padding: const EdgeInsets.all(24.0),
    child: Row(
      children: [
        Column(
          children: [
            Text(
              'Oeschinen Lake campground',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              'Kanderstcg, Switzerland',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.deepOrangeAccent,
            ),
            Text(
              '41',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    ),
  );
}

Widget _showImage() {
  return Stack(
      clipBehavior: Clip.none,
      // this clipbehaviour shows what should happen if widget goes out of boudary
      children: [
        Image.network(
          url,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
            // fill the complete parent with its width and height otherwise height is same as child height
            // left: 10, // this tell the position from the stack edges
            //   right: 10,
            //   top: 10,
            //   bottom: 10,

            child: Center(
          child: Text(
            "Kashmir Ki Vadia",
            style: TextStyle(
                fontSize: 25, color: Colors.pink, fontWeight: FontWeight.bold),
            // textAlign: TextAlign.center,
          ),
        )),
        Positioned(
          right: 10,
          bottom: -25,
          left: 10,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 40,
                color: Colors.pink,
              ),
            ),
          ),
        )
      ]);
}

Widget iconWithDescription(
    {required IconData iconName,
    required String description,
    required Function() onPressed}) {
  return Column(
    children: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconName,
          semanticLabel: 'Call',
          color: Colors.blue,
          size: 20,
        ),
      ),
      Text(
        description,
        style: TextStyle(color: Colors.blue, fontSize: 14),
      ),
    ],
  );
}
