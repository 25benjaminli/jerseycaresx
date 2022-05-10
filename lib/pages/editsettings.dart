import 'package:flutter/material.dart';
import 'nav.dart';
import '/colorclass.dart';
class EditSettingsPage extends StatefulWidget {
  EditSettingsPage({Key? key}) : super(key: key);

  @override
  State<EditSettingsPage> createState() => _EditSettingsPageState();
}

bool selectedDonor = false;
bool selectedVolunteer = false;
class _EditSettingsPageState extends State<EditSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(height: 40),
        TextField(decoration: InputDecoration(
          label: Text("Username"),
          
        ),),
        
        TextField(decoration: InputDecoration(
          label: Text("About Me"),
          
        ),),

        ElevatedButton.icon(icon: Icon(Icons.people), onPressed: () { 
          selectedDonor = selectedDonor ? false : true;
          print(selectedDonor);

         }, label: Text("Donor"), style: ButtonStyle( backgroundColor: (selectedDonor ? MaterialStateProperty.all(orangeC) : MaterialStateProperty.all(blueC)))),

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