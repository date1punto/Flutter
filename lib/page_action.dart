import 'package:flutter/material.dart';
import 'data.dart' as info;

class PageAction extends StatefulWidget
{

  info.UserGroup group;
  PageAction({super.key,required this.group});

  @override
  PageActionState createState() => PageActionState();

}

class PageActionState extends State<PageAction>
{
  static Map<String, bool> actions = Map<String, bool>();

  @override
  void initState() {
    for(String action in info.Actions.all)
    {
      actions[action]=false;
    }
    for (String action in widget.group.actions){
      actions[action]=true;
    }

  }

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
            value: actions[info.Actions.open],
            onChanged: (bool? value) {
              setState(() {
                actions[info.Actions.open] = value!;
              });
            },
          ),
          Divider(),
          CheckboxListTile(title:Text("Close"),
            subtitle:Text("closes and open door", style:TextStyle(fontSize: 14)),
            value: actions[info.Actions.close],
            onChanged: (bool? value) {
              setState(() {
                actions[info.Actions.close] = value!;
              });
            },
          ),
          Divider(),
          CheckboxListTile(title:Text("Lock"),
            subtitle:Text("Lock a door or all the doors in a room or group of rooms, if closed", style:TextStyle(fontSize: 14)),
            value:  actions[info.Actions.lock],
            onChanged: (bool? value) {
              setState(() {
                actions[info.Actions.lock] = value!;
              });
            },
          ),
          Divider(),
          CheckboxListTile(title:Text("Unlock"),
            subtitle:Text("Unlock a locked door or all the doors the locked doors in an room",
                style:TextStyle(fontSize: 14)),
            value:  actions[info.Actions.unlock],
            onChanged: (bool? value) {
              setState(() {
                actions[info.Actions.unlock] = value!;
              });
            },
          ),
          Divider(),
          CheckboxListTile(title:Text("Unlock shortly"),
            subtitle:Text("Unlocks a door during 10 seconds and the locks it if is closed",
                style:TextStyle(fontSize: 14)),
            value:  actions[info.Actions.unlockShortly],
            onChanged: (bool? value) {
              setState(() {
                actions[info.Actions.unlockShortly] = value!;
              });
            },
          ),
          Divider(),
          Padding(
              padding:EdgeInsets.symmetric(vertical:20)//posar padding vertical
          ),
          ElevatedButton(child: Text("Submit"),
          onPressed:() {
            //////////////////////////////////////////////////////////no hace nada aun falta que se guarde en group
            actions.forEach((key, value) {
              if(value==true) {
                  if (!widget.group.actions.contains(key)){
                    widget.group.actions.add(key);
                  }
                }else {
                if (widget.group.actions.contains(key)) {
                  widget.group.actions.remove(key);
                }
              }
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(
              const SnackBar(content: Text('Saved')),
            );

          }
          ),
        ]
      ),


    );
  }
}