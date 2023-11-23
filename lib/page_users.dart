import 'package:flutter/material.dart';
import 'data.dart';
import 'specific_user.dart';

class PageUsers extends StatefulWidget {
  UserGroup userGroup;

  PageUsers({super.key, required this.userGroup});

  @override
  State<PageUsers> createState() => _ScreenListPageUsers();
}

class _ScreenListPageUsers extends State<PageUsers> {
  late List<User> users;
  int contador=0;

  @override
  void initState() {
    super.initState();
    users = widget.userGroup.users; // the userGroups of ScreenListGroups
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          User newUser = User(Data.defaultUserName, Data.defaultCredential+"$contador");
          contador++;//para que no tengan mismo credencial
          users.add(newUser);
          setState(() {});
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Users ${widget.userGroup.name}"),
      ),
      body: ListView.separated(
        // it's like ListView.builder() but better
        // because it includes a separator between items
        padding: const EdgeInsets.all(16.0),
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(users[index], index),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget _buildRow(User user, int index) {
    String imatgePredefinida=  Data.images["new user"]!;
    return ListTile(
      leading: CircleAvatar(foregroundImage:
      NetworkImage(Data.images[user.name.toLowerCase()]?? imatgePredefinida)),
      title: Text(user.name),
      trailing: Text(user.credential),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<void>(
          builder: (context) => SpecificUser(user: user),
        ),
        ).then((var v) => setState(() {}));
      },
    );
  }
}