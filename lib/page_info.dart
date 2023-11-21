import 'package:flutter/material.dart';
import 'data.dart';

class PageInfo extends StatelessWidget
{
   UserGroup userGroup;

   PageInfo({super.key, required this.userGroup});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
          appBar: AppBar(
             backgroundColor: Theme.of(context).colorScheme.primary,
             foregroundColor: Theme.of(context).colorScheme.onPrimary,
             title: Text('Info ${userGroup.name}'),
          ),
          body:Form(
            child:Container(
                padding: const  EdgeInsets.all(80),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:"name group",
                      hintText: "Enter",
                    )
                  ),
                  const Padding(
                      padding:EdgeInsets.symmetric(vertical:20)//posar padding vertical
                  ),
                  TextFormField(
                      maxLines: 8,//para que crezca dinamicamente si se escribe demasiado a null seria para infinito
                      minLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:"description",
                        hintText: "Enter",
                      )
                   ),
                  const Padding(
                    padding:EdgeInsets.symmetric(vertical:100)//posar padding vertical
                  ),
                  ElevatedButton(
                      child: const Text("Submit"),
                      onPressed:() {
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