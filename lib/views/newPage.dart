import 'package:flutter/material.dart';
import 'package:todo/utils/margin.dart';
import 'package:todo/widgets/buttons.dart';
import 'package:todo/widgets/textFields.dart';

class NewTaskPage extends StatefulWidget {
  NewTaskPage({Key key}) : super(key: key);

  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfdfd),
      appBar: AppBar(
       // iconTheme: IconThemeData(color:Colors.black),
        backgroundColor: Color(0xfffdfdfd),
        brightness: Brightness.light,
        title: Text(
          'New Task',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            color: Colors.black,
            onPressed: ()=>Navigator.pop(context),
          )
        ],
      ),
      body: Container(
        height: screenHeight(context),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(height: screenHeight(context, percent:0.13), child: TaskTextField()),
            ),
            Column(
              children: <Widget>[
                Container(
                 width: screenWidth(context, percent:0.9),
                  child: Divider(),
                ),
              ],
            ),
            new AddTile(
              image: 'notif',
              title: 'May 29, 14:00',
              isFirst: true,
            ),
            new AddTile(
              image: 'note',
              title: 'Add note',
            ),
            new AddTile(
              image: 'tag',
              title: 'Category',
            ),
            const YMargin(50),
            Container(
            
              child: Column(
                children: <Widget>[
                     Container(
                      height: 60,
                      child: TextButton(onTap: () {},)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddTile extends StatelessWidget {
  final String title, image;
  final isFirst;
  const AddTile({
    Key key,
    @required this.title,
    @required this.image,
    this.isFirst = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 28,
              width: 28,
              child: Image.asset('assets/images/$image.png',),
            ),
            const XMargin(20),
            Text(
              title ?? '',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: isFirst ? Colors.black: Colors.grey[500]),
            )
          ],
        ),
      ),
    );
  }
}
