import 'package:flutter/material.dart';

class PageAction extends StatefulWidget
{
  @override
  PageActionState createState() => PageActionState();
}

class PageActionState extends State<PageAction>
{
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;
  bool checkboxValue5 = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text('Actions'),
      ),
      body: Column(
        children:[
          CheckboxListTile(title:Text("Open"),
            subtitle:Text("opens and unlocked door", style:TextStyle(fontSize: 14)),
            value: checkboxValue1,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue1 = value!;
              });
            },
          ),
          Divider(),
          CheckboxListTile(title:Text("Close"),
            subtitle:Text("closes and open door", style:TextStyle(fontSize: 14)),
            value: checkboxValue2,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue2 = value!;
              });
            },
          ),
          Divider(),
          CheckboxListTile(title:Text("Lock"),
            subtitle:Text("Lock a door or all the doors in a room or group of rooms, if closed", style:TextStyle(fontSize: 14)),
            value: checkboxValue3,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue3 = value!;
              });
            },
          ),
          Divider(),
          CheckboxListTile(title:Text("Unlock"),
            subtitle:Text("Unlock a locked door or all the doors the locked doors in an room",
                style:TextStyle(fontSize: 14)),
            value: checkboxValue4,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue4 = value!;
              });
            },
          ),
          Divider(),
          CheckboxListTile(title:Text("Unlock shortly"),
            subtitle:Text("Unlocks a door during 10 seconds and the locks it if is closed",
                style:TextStyle(fontSize: 14)),
            value:  checkboxValue5,
            onChanged: (bool? value) {
              setState(() {
                checkboxValue5 = value!;
              });
            },
          ),
          Divider(),
          Padding(
              padding:EdgeInsets.symmetric(vertical:20)//posar padding vertical
          ),
          ElevatedButton(child: Text("Submit"),
          onPressed:() {
            ScaffoldMessenger.of(context)
                .showSnackBar(
              const SnackBar(content: Text('Saved')),
            );

          }//////////////////////////////////////////////////////////no hace nada aun
          ),
        ]
      ),


    );
  }
}