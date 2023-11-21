import 'page_info.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'page_action.dart';
import 'page_schedule.dart';

class ScreenGroup extends StatelessWidget {
  UserGroup userGroup;

  // Constructor que recibe el grupo de usuarios
  ScreenGroup({super.key, required this.userGroup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text('Group ${userGroup.name}'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisSpacing: 10,//per fer el gap entre columnes
          mainAxisSpacing: 10,//per fer el gap entre files
          crossAxisCount:2,
          padding: const EdgeInsets.all(20),//deixar espai als costats
          children: [
            Container(
              color:Colors.grey,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,//para que se aline tambien en vertical
                    children:[
                      IconButton(
                        iconSize: 100,
                        icon: const Icon(Icons.description),
                        onPressed: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                              builder:(context)=> PageInfo(userGroup: userGroup),
                          ),
                          );
                        },
                      ),
                      const Text("Info")
                    ]
                ),
              )
            ),
            Container(//segon fill
                color:Colors.grey,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        IconButton(
                          iconSize: 100,
                          icon: const Icon(Icons.calendar_month),
                          onPressed: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder:(context)=> PageSchedule(userGroup: userGroup),
                            ),
                            );
                          },
                        ),
                        const Text("Schedule")
                      ]
                  ),
                )
            ),
            Container(//tercer fill
              color:Colors.grey,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      IconButton(
                        iconSize: 100,
                        icon: const Icon(Icons.app_settings_alt),
                        onPressed: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                              builder:(context)=> PageAction(),
                          ),
                          );
                        },//es necesario aunque no haga nada
                      ),
                      const Text("Actions")
                    ]
                ),
              )
            ),
            Container(//quart fill
                color:Colors.grey,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        IconButton(
                          iconSize: 100,
                          icon: const Icon(Icons.holiday_village),
                          onPressed: (){},//es necesario aunque no haga nada
                        ),
                        const Text("Places")
                      ]
                  ),
                )
            ),
          Container(//cinque fill
              color:Colors.grey,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      IconButton(
                        iconSize: 100,
                        icon: const Icon(Icons.manage_accounts),
                        onPressed: (){},//es necesario aunque no haga nada
                      ),
                      const Text("Users")
                    ]
                ),
              )
          ),
          ],//fi dels fills
        ),
      ),
    );
  }
}

