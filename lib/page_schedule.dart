import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'data.dart';
import 'package:intl/intl.dart';

class PageSchedule extends StatefulWidget{

  UserGroup userGroup;
  PageSchedule({super.key, required this.userGroup});

  @override
  PageScheduleState createState() => PageScheduleState();
}

class PageScheduleState extends State<PageSchedule>
{
  late List<bool> diasSemana;
  final DateFormat _dateFormatter = DateFormat.yMd();

  @override
  initState(){
    super.initState();
    diasSemana=List.filled(7,false);
    for(int i=0; i<7; i++)
    {
      if(widget.userGroup.schedule.weekdays.contains(i)) {
        diasSemana[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text("Schedule ${widget.userGroup.name}"),
    ),
      body: Container(//con Center no funciona
        padding: const  EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(padding: EdgeInsets.only(right: 20.0), //para que deje un espacio a la derecha
                    child: const Text("From")),
                //SizedBox(width: 20), //para que se deje un espacio
                Text(_dateFormatter.format(widget.userGroup.schedule.fromDate)),
                IconButton(onPressed: () {}
                    , icon: Icon(Icons.calendar_month))

              ],
            ),
            Row(
              children: [
                Container(padding: EdgeInsets.only(right: 45.0),
                    child: const Text("To")),
                //SizedBox(width: 20),
                Text(_dateFormatter.format(widget.userGroup.schedule.toDate)),
                IconButton(onPressed: () {}
                    , icon: Icon(Icons.calendar_month))
              ],
            ),
            Column(
              children: [
                Text("Weekdays"),
                WeekdaySelector(
                    onChanged: (int day){
                      if(widget.userGroup.schedule.weekdays.contains(day))
                      {
                        widget.userGroup.schedule.weekdays.remove(day);
                      }
                      else{
                        widget.userGroup.schedule.weekdays.add(day);
                      }
                        setState(() {
                          diasSemana[day%7] = !diasSemana[day%7];
                        }
                      );//hacer que se modifique al clicar
                    },
                    values:diasSemana),
              ],
            ),
          ],
        ),
      ),
    );
  }
}