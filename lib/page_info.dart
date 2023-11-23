import 'package:flutter/material.dart';
import 'data.dart';
import 'screen_group.dart';

class PageInfo extends StatefulWidget
{
   UserGroup userGroup;
   ScreenGroupState anterior;
   PageInfo({super.key, required this.userGroup, required this.anterior});
   @override
   State<PageInfo> createState() => PageInfoState();
}

class PageInfoState extends State<PageInfo> {
  @override
  Widget build(BuildContext context)
  {
    TextEditingController _nameController = TextEditingController(text: widget.userGroup.name);
    TextEditingController _descriptionController = TextEditingController(text:widget.userGroup.description);
    return Scaffold(
          appBar: AppBar(
             backgroundColor: Theme.of(context).colorScheme.primary,
             foregroundColor: Theme.of(context).colorScheme.onPrimary,
             title: Text('Info ${widget.userGroup.name}'),
          ),
          body:Form(
            child:Container(
                padding: const  EdgeInsets.all(80),
              child: Column(
                children: [
                  TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:"name group"
                    )
                  ),
                  const Padding(
                      padding:EdgeInsets.symmetric(vertical:20)//posar padding vertical
                  ),
                  TextFormField(
                      controller: _descriptionController,
                      maxLines: 8,//para que crezca dinamicamente si se escribe demasiado a null seria para infinito
                      minLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:"description",

                      )
                   ),
                  const Padding(
                    padding:EdgeInsets.symmetric(vertical:40)//posar padding vertical
                  ),
                  ElevatedButton(
                      child: const Text("Submit"),
                      onPressed:() {
                        widget.userGroup.name=_nameController.text;
                        widget.userGroup.description=_descriptionController.text;
                        setState(() {});
                        widget.anterior.setState(() {});
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                          const SnackBar(content: Text('Saved'))
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