import 'package:flutter/material.dart';
import 'nav.dart';
class EditSettingsPage extends StatefulWidget {
  EditSettingsPage({Key? key}) : super(key: key);

  @override
  State<EditSettingsPage> createState() => _EditSettingsPageState();
}

class _EditSettingsPageState extends State<EditSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextField(decoration: InputDecoration(
          label: Text("testerlabel"),
          
        ),),
        Align(
           alignment: Alignment.center, 
           child: ElevatedButton.icon(icon: Icon(Icons.save), onPressed: () => {
              Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => NavBar(
                  // user: user,
                ),
              ),
              )
           }, 
           label: Text("save information & return")  
          
        )
        )],)
    );
  }
}