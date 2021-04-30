import 'package:flutter/material.dart';
import 'comment.dart';

class IDCard extends StatefulWidget {
  @override
  _IDCardState createState() => _IDCardState();
}

class _IDCardState extends State<IDCard> {
  int likes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("ID Card"),
        backgroundColor: Colors.pink[400],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _CircleAvatar(),
            _Name(),
            _Surname(),
            _Email(),
            _Likes(),
            _CommentLabel(),
            _Comment()
          ],
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "NAME",
          style: TextStyle(letterSpacing: 2.0, color: Colors.white),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Bertaç",
          style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.amber,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class _Surname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "SURNAME",
          style: TextStyle(letterSpacing: 2.0, color: Colors.white),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Severcan",
          style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.amber,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Icon(
              Icons.email,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "bertac.severcan@gmail.com",
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 1.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/lollipop.jpg"),
            radius: 40.0,
          ),
          Divider(
            height: 80.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class _Likes extends StatefulWidget {
  @override
  __LikesState createState() => __LikesState();
}

class __LikesState extends State<_Likes> {
  int likes = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "$likes",
              style: TextStyle(
                  color: Colors.amber,
                  letterSpacing: 1.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 30.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
              onPressed: () => setState(() => likes += 1),
              child: Icon(Icons.thumb_up),
            )
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class _Comment extends StatefulWidget {
  @override
  __CommentState createState() => __CommentState();
}

class _CommentLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "COMMENTS",
            style: TextStyle(letterSpacing: 2.0, color: Colors.white),
          ),
          SizedBox(
            height: 10.0,
          ),
        ]);
  }
}

class __CommentState extends State<_Comment> {
  List<Comment> comments = [
    Comment("blueJay42", "This is great!"),
    Comment("redBird222", "I love the colors!"),
    Comment("smellyFish1", "You're hired!")
  ];

  Widget commentTemplate(comment) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              comment.text,
              style: TextStyle(
                letterSpacing: 2.0,
                color: Colors.amber,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              comment.author,
              style: TextStyle(
                  letterSpacing: 2.0,
                  color: Colors.lightBlue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comments
          .map((comment) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: commentTemplate(comment)))
          .toList(),
    );
  }
}
