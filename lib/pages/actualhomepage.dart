import 'package:flutter/material.dart';
import 'package:jerseycaresapp/pages/posts.dart';
import 'posts.dart';

class ActualHomepage extends StatelessWidget {
  const ActualHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text("Welcome to the Homepage"),
          Spacer(),
          Align(alignment: Alignment.bottomRight, child: FloatingActionButton(onPressed: () { 
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => PostsPage(
                  // user: user,
                ),
              ),
            );
          }, 
          child: Icon(Icons.add), 
          // label: Text("Make A Post"))
          
          ))]),

      )
    );
  }
}