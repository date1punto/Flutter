import 'package:flutter/material.dart';
import 'data.dart';

class SpecificUser extends StatefulWidget
{
  User user;
  SpecificUser({super.key, required this.user});

  @override
  State<SpecificUser> createState() => SpecificUserState();
}

class SpecificUserState extends State<SpecificUser> {
  @override
  Widget build(BuildContext context)
  {
    TextEditingController _nameController = TextEditingController(text: widget.user.name);
    TextEditingController _credentialController = TextEditingController(text: widget.user.credential);
    String imatgePredefinida=  Data.images["new user"]!;
    String imatgeUsuari =  Data.images[widget.user.name.toLowerCase()] ?? imatgePredefinida;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text('Info ${widget.user.name}'),
        ),
        body:Form(
            child:
            Container(
                padding: const  EdgeInsets.all(80),
                child: Column(
                  children: [
                    CircleAvatar(foregroundImage:NetworkImage(imatgeUsuari),  radius: 100),
                    const Padding(
                        padding:EdgeInsets.symmetric(vertical:10)//posar padding vertical
                    ),
                    TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:"name",
                        ),
                    ),
                    const Padding(
                        padding:EdgeInsets.symmetric(vertical:20)//posar padding vertical
                    ),
                    TextFormField(
                        controller: _credentialController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:"Credential",
                        ),
                    ),
                    SizedBox(height: 30), //mateix que fer un padding pero d'altre manera
                    ElevatedButton(
                      child: const Text("Submit"),
                      onPressed:() {
                        widget.user.name=_nameController.text;
                        widget.user.credential=_credentialController.text;
                        setState(() {});
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(content: Text('Saved')),
                        );
                      },
                    )
                  ],
                )
            )
        )
    );
  }
}