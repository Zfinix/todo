import 'package:flutter/material.dart';
import 'package:todo/utils/margin.dart';
import 'package:todo/views/detailsPage.dart';
import 'package:todo/views/newPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfdfd),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Color(0xfffdfdfd),
          brightness: Brightness.light,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: MenuButton(),
          ),
           const YMargin(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              'Lists',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(9),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  new CustomCard(
                    image: 'all',
                    title: 'All',
                    tasks: 23,
                  ),
                  new CustomCard(
                    image: 'work',
                    title: 'Work',
                    tasks: 14,
                  ),
                  new CustomCard(
                    image: 'music',
                    title: 'Music',
                    tasks: 6,
                  ),
                  new CustomCard(
                    image: 'travel',
                    title: 'Travel',
                    tasks: 1,
                  ),
                  new CustomCard(
                    image: 'study',
                    title: 'Study',
                    tasks: 2,
                  ),
                  new CustomCard(
                    image: 'home',
                    title: 'Home',
                    tasks: 14,
                  ),
                  new CustomCard(
                    image: 'play',
                    title: 'Play',
                    tasks: 9,
                  ),
                  new CustomCard(
                    image: 'shop',
                    title: 'Shop',
                    tasks: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'tag',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => NewTaskPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title, image;
  final int tasks;

  const CustomCard({
    Key key,
    @required this.title,
    @required this.image,
    this.tasks = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              image: image,
              tasks: tasks,
              title: title,
            ),
          ),
        );
      },
      child: Container(
        height: screenWidth(context, percent: 0.30),
        width: screenWidth(context, percent: 0.30),
        margin: EdgeInsets.all(9),
        padding: const EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            new BoxShadow(
              offset: Offset(0, -1),
              spreadRadius: -15,
              color: Colors.black.withOpacity(0.08),
              blurRadius: 21,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const YMargin(20),
            Container(
                width: 39,
                height: 39,
                child: Image.asset('assets/images/$image.png')),
            const YMargin(40),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title ?? '',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                  const YMargin(5),
                  Text(
                    '$tasks Task${tasks == 0 || tasks > 1 ? 's' : ''}',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const YMargin(20),
          Container(
            height: 3,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(2)),
          ),
          const YMargin(5),
          Container(
            height: 3,
            width: 25,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(2)),
          ),
          const YMargin(5),
          Container(
            height: 3,
            width: 15,
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(2)),
          ),
        ],
      ),
    );
  }
}
