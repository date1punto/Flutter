import 'package:flutter/material.dart';
import 'data.dart';

class SpecificUser extends StatelessWidget
{
  User user;
  SpecificUser({super.key, required this.user});


  @override
  Widget build(BuildContext context)
  {
    TextEditingController _nameController = TextEditingController(text: user.name);
    TextEditingController _credentialController = TextEditingController(text: user.credential);
    String imatgePredefinida=  Data.images["new user"] ?? "";
    String imatgeUsuari =  Data.images[user.name.toLowerCase()] ?? imatgePredefinida;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text('Info ${user.name}'),
        ),
        body:Form(
            child:
            Container(
                padding: const  EdgeInsets.all(80),
                child: Column(
                  children: [
                    CircleAvatar(foregroundImage:NetworkImage(imatgeUsuari),  radius: 200),
                    const Padding(
                        padding:EdgeInsets.symmetric(vertical:40)//posar padding vertical
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
                    const Padding(
                        padding:EdgeInsets.symmetric(vertical:50)//posar padding vertical
                    ),
                    ElevatedButton(
                      child: const Text("Submit"),
                      onPressed:() {
                        user.name=_nameController.text;
                        user.credential=_credentialController.text;
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(content: Text('Saved')),
                        );
                      },//////////////////////////////////////////////////////////no hace nada aun
                    )
                  ],
                )
            )
        )
    );
  }
}