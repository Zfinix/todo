import 'package:flutter/material.dart';
import 'package:todo/utils/margin.dart';

class DetailPage extends StatefulWidget {
  final String title, image;
  final int tasks;
  DetailPage(
      {Key key,
      @required this.title,
      @required this.image,
      @required this.tasks})
      : super(key: key);

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const YMargin(20),
                    Row(
                      children: <Widget>[
                        FloatingActionButton(
                          elevation: 0.2,
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: Container(
                              width: 39,
                              height: 39,
                              child: Image.asset('assets/images/${widget.image}.png')),
                        ),
                      ],
                    ),
                    const YMargin(40),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.title ?? '',
                            style: TextStyle(
                                fontSize: 37,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const YMargin(5),
                          Text(
                            '${widget.tasks} Task${widget.tasks == 0 || widget.tasks > 1 ? 's' : ''}',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w200,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                height: screenHeight(context, percent: 0.7),
                width: screenWidth(
                  context,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          new TaskTile(
                            catTitle: 'Late',
                            date: '20:15 • April 29',
                            title: 'Call Max',
                            isFirst: true,
                          ),
                          new TaskTile(
                            catTitle: 'Today',
                            date: '16:00',
                            title: 'Practice Piano',
                          ),
                          new TaskTile(
                            date: '17:00',
                            title: 'Learn Spanish',
                          ),
                          new TaskTile(
                            catTitle: 'Done',
                            date: '9:00 - 11:30',
                            cancelled: true,
                            title: 'Learn Spanish',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        heroTag: 'tag',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  final String catTitle, title, date;
  final bool isFirst, cancelled;

  const TaskTile(
      {Key key,
      this.catTitle,
      @required this.title,
      @required this.date,
      this.isFirst = false,
      this.cancelled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        catTitle != null ? const YMargin(30) : Container(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              catTitle != null
                  ? Text(
                      catTitle ?? '',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey),
                    )
                  : Container(),
            ],
          ),
        ),
        const YMargin(9),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title ?? '',
                style: TextStyle(
                    fontSize: 19,
                    decoration: cancelled ? TextDecoration.lineThrough : null,
                    fontWeight: FontWeight.w400,
                    color: cancelled ? Colors.blue : Colors.black),
              ),
              const YMargin(4),
            ],
          ),
          subtitle: Text(
            date ?? '',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w200,
                color: isFirst ? Colors.red : Colors.grey),
          ),
          trailing: Checkbox(
            checkColor: Colors.white,
            onChanged: (bool value) {},
            value: cancelled ?? false,
            activeColor: Colors.blue,
          ),
        )
      ],
    );
  }
}
