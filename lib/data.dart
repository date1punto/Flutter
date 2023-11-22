import 'package:flutter/material.dart';


class Actions {
  static const String open = "open";
  static const String close = "close";
  static const String lock = "lock";
  static const String unlock = "unlock";
  static const String unlockShortly = "unlock_shortly";
  static List<String> all = <String>[open, close, lock, unlock, unlockShortly];
  // not const because we will assign it to some groups and later can be change
  // in the screen of actions
}

class User {
  late String name;
  late String credential;

  User(this.name, this.credential);
}

class Schedule {
  late List<int> weekdays; // DateTime.monday==1, DateTime.sunday==7
  late DateTime fromDate;
  late DateTime toDate;
  late TimeOfDay fromTime;
  late TimeOfDay toTime;

  Schedule(this.weekdays, this.fromDate, this.toDate, this.fromTime, this.toTime);
}

class UserGroup {
  late String name;
  late String description;
  late List<String> areas; // where
  late Schedule schedule; // when
  late List<String> actions; // what
  late List<User> users; // who

  UserGroup(this.name, this.description, this.areas, this.schedule, this.actions, this.users);
}

// This class replaces what we would get from a new http request to the server,
// asking for all the user groups, something like http://localhost:8080/get_user_groups
// that would return them as a string answer in JSON format
class Data {
  // Admin
  static Schedule scheduleAdmin = Schedule(
      [DateTime.monday, DateTime.tuesday, DateTime.wednesday, DateTime.thursday,
        DateTime.friday, DateTime.saturday, DateTime.sunday],
      DateTime(2023, 1, 1), DateTime(2026, 1, 1),
      const TimeOfDay(hour: 0, minute: 0), const TimeOfDay(hour: 23, minute: 59)
  );
  static UserGroup admin = UserGroup("admin", "administrators", ["building",],
      scheduleAdmin, Actions.all, [User("Ana", "89325"), User("Aureli", "87325"),]
  );

  // Managers
  static Schedule scheduleManagers = Schedule(
      [DateTime.monday, DateTime.tuesday, DateTime.wednesday, DateTime.thursday,
        DateTime.friday, DateTime.saturday,],
      DateTime(2023, 9, 1), DateTime(2024, 8, 30),
      const TimeOfDay(hour: 7, minute: 0), const TimeOfDay(hour: 22, minute: 0)
  );
  static UserGroup managers = UserGroup("managers",
      "the CEO, CTO and heads of department", ["building",],
      scheduleManagers, Actions.all, [User("Manel", "43762"), User("Miquel", "77832"),
        User("Maria", "89324"), User("Maure", "12345"),]
  );

  // Employees
  static Schedule scheduleEmployees = Schedule(
      [DateTime.monday, DateTime.tuesday, DateTime.wednesday, DateTime.thursday,
        DateTime.friday,],
      DateTime(2023, 9, 1), DateTime(2024, 3, 1),
      const TimeOfDay(hour: 7, minute: 0), const TimeOfDay(hour: 20, minute: 0)
  );
  static UserGroup employees = UserGroup("employees",
      "employees of own departments plus oursourcing companies",
      ["ground_floor", "room3", "corridor"],
      scheduleEmployees, [Actions.open, Actions.close, Actions.unlockShortly], [User("Eva", "89325"), User("Eulalia", "87325"),
        User("Esteve", "43623"),]
  );

  static List<UserGroup> userGroups = [admin, managers, employees];

  // defaults for new user group
  static Schedule defaultSchedule = Schedule(
      [DateTime.monday, DateTime.tuesday, DateTime.wednesday, DateTime.thursday,
        DateTime.friday,],
      DateTime.now(), DateTime.now().add(const Duration(days: 365)),
      const TimeOfDay(hour: 8, minute: 0), const TimeOfDay(hour: 19, minute: 0)
  );
  static List<String> defaultAreas = ["ground_floor", "room3", "corridor"];
  static List<String> defaultActions = ["open", "close"];
  static String defaultName = "new group";
  static String defaultDescription = "";
  static String defaultUserName="new name";
  static String defaultCredential="0000";
/*
  static Map<String, String> images = {
    'ana': 'https://transfer.sh/3iRwt5NrxB/ana.png',
    'aureli': 'https://transfer.sh/uJmCCYfIyo/aureli.png',
    'manel': 'https://transfer.sh/YjyToAcXBi/manel.png',
    'miquel': 'https://transfer.sh/e9gG26vGwA/miquel.png',
    'maria': 'https://transfer.sh/Rvr7QdRhFg/maria.png',
    'maure': 'https://transfer.sh/HtdTNmOoxY/maure.png',
    'eva': 'https://transfer.sh/odY7j2jvQS/eva.png',
    'eulalia': 'https://transfer.sh/1RBiljKI8T/eulalia.png',
    'esteve': 'https://transfer.sh/waTqvGuqyr/esteve.png',
    'new user': 'https://transfer.sh/xQ9fjTdhAK/new_user.png',
  };
*/
  static Map<String, String> images = {
    'ana': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmireiadarder.com%2Fmenopausia-mujer-vieja%2F&psig=AOvVaw3PvOx2NROtWRicOjhGEY7B&ust=1700765890013000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJCgoOek2IIDFQAAAAAdAAAAABAp',
    'aureli': 'https://www.apmadrid.es/wp-content/uploads/2023/06/auremartin.webp',
    'manel': 'https://fotografias.antena3.com/clipping/cmsimages02/2020/09/26/374A4113-3C4C-41C1-9304-2D2466883E39/62.jpg',
    'miquel': 'https://cadena100-cdnmed.cadena100.es/resources/jpg/1/6/1610646475661.jpg',
    'maria': 'https://www.jolihouse.com/wp-content/uploads/2013/10/blue-eyes-leaning-forward-1024x682.jpg',
    'maure': 'https://www.pbs.org/wnet/americanmasters/files/2014/04/Chico-Mendes-16x9.jpg',
    'eva': 'https://i.pinimg.com/736x/34/44/3d/34443df312de00271d1b773c780f6e96.jpg',
    'eulalia': 'https://th.bing.com/th/id/OIP.mdVtchY6Xdj-b8ECMHBCigHaEK?rs=1&pid=ImgDetMain',
    'esteve': 'https://www.kaizengroup.es/wp-content/uploads/bfi_thumb/stevejobsbig-35j7nynk8topdvfvsv3im8.jpg',
    'new user': 'https://pluspng.com/img-png/user-png-icon-big-image-png-2240.png',
  };
  // curl -H "Max-Days: 180" --upload-file ./esteve.png https://transfer.sh/esteve.png
}
