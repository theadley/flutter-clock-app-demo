import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class ThirdTab extends StatelessWidget {
  final Future<Post> post;
  final List<Item> _data = [];

  ThirdTab({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Post>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
//          return Text(snapshot.data.title);
          _data.addAll(List.generate(2, (int index) {
            return Item(
              headerValue: 'Panel $index: ${snapshot.data.title}',
              expandedValue: snapshot.data.body,
            );
          }));

          return ListView(
            children: <Widget>[
              ExpansionBoxes(data: _data),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class ExpansionBoxes extends StatefulWidget {
  ExpansionBoxes({Key key, @required List<Item> data})
      : _data = data,
        super(key: key);

  final List<Item> _data;

  @override
  _ExpansionBoxesState createState() => _ExpansionBoxesState(data: _data);
}

class _ExpansionBoxesState extends State<ExpansionBoxes> {
  _ExpansionBoxesState({@required List<Item> data}) : _data = data;

  final List<Item> _data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
          for (int i = 0; i < _data.length; i++) {
            if (i != index) {
              _data[i].isExpanded = false;
            }
          }
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
