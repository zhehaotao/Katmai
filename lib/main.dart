import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Katmai National Park and Preserve',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                Text(
                  'King Salmon, AK',
                  style: TextStyle(
                    color: Colors.grey[500]
                  )
                )
              ]
            ),
          ),
          FavoriteWidget()
        ]
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Katmai National Park and Preserve is on a peninsula in southern Alaska. Its wild landscapes span tundra, forests, lakes and mountains. The park is known for the many brown bears that are drawn to the abundant salmon in Brooks Falls. Lookout platforms at adjacent Brooks Camp offer close-up views of the bears. The Valley of Ten Thousand Smokes is an area of lava flows and ash formed by a massive volcanic eruption.'
      ),
    );

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Katmai National Park and Preserve'),
        ),
        body: ListView(
          children: [
            Image.network('https://www.google.com/maps/uv?pb=!1s0x56e9c2ee2bb45495:0x4c4d07be0eeae9f2!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipOV9upC3aYXzxlxQsrFk6OOiY3YXh7H9WmlkWAB%3Dw238-h160-k-no!5salaska+katmai+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipOV9upC3aYXzxlxQsrFk6OOiY3YXh7H9WmlkWAB&hl=en&sa=X&ved=2ahUKEwixsY-otcrtAhVDqZ4KHaeUBCQQoiowH3oECDQQAw',
            width: 600,
            fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        )
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column (
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  // @override
  void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      _favoriteCount -= 1;
      _isFavorited = false;
    } else {
      _favoriteCount += 1;
      _isFavorited = true;
    }
  });
}
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          )
        )
      ],
    );
  }
}

