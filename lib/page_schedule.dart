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
  DateFormat _dateFormatter = DateFormat.yMd();
  DateFormat _timeFormatter= DateFormat.Hm();
  late DateTime now;
  late DateTime dataAux;
  late TimeOfDay timeAux;

  DateTime addHourToDateTime(DateTime x, TimeOfDay y){
    DateTime dateTime = DateTime(x.year, x.month, x.day, y.hour, y.minute);
    return dateTime;
  }

  @override
  initState(){
    now=DateTime.now();
    super.initState();
    diasSemana=List.filled(7,false);
    for(int i=1; i<=7; i++)
    {
      if(widget.userGroup.schedule.weekdays.contains(i)) {
        diasSemana[i-1] = true;
      }
    }
  }

  Future<void>  _pickStartDate(BuildContext context) async {
    DateTime? newStartDate = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year),
      lastDate: DateTime(now.year + 5),
      initialDate: now,
    );
    if (newStartDate != null) {
        dataAux = newStartDate;
      }
  }

  Future<void>  _pickStartTime(BuildContext context) async {
    TimeOfDay? newStartDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );
    if (newStartDay != null) {
      timeAux = newStartDay;
    }
  }

  void _showAlert(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Range dates"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("The From date is after the To date. Please, select a new date range."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(padding: EdgeInsets.only(right: 20.0, bottom: 10), //para que deje un espacio a la derecha
                    child: const Text("From")),
                //SizedBox(width: 20), //para que se deje un espacio
                Text(_dateFormatter.format(widget.userGroup.schedule.fromDate)),
                IconButton(onPressed: () {
                  _pickStartDate(context).then((_)
                  {
                    dataAux=DateTime(dataAux.year, dataAux.month, dataAux.day, 0, 0);
                    if(dataAux.isAfter( widget.userGroup.schedule.toDate))
                    {
                      _showAlert(context);
                    }
                    else {
                      widget.userGroup.schedule.fromDate = dataAux;
                      setState(() {});
                    }
                  }
                  );
                }
                  , icon: Icon(Icons.calendar_month))

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(padding: EdgeInsets.only(right: 45.0, bottom: 10),
                    child: const Text("To")),
                //SizedBox(width: 20),
                Text(_dateFormatter.format(widget.userGroup.schedule.toDate)),
                IconButton(onPressed: () {
                  _pickStartDate(context).then((_)
                  {
                    dataAux=DateTime(dataAux.year, dataAux.month, dataAux.day, 23, 59);
                    if(dataAux.isAfter(widget.userGroup.schedule.fromDate))
                    {
                      widget.userGroup.schedule.toDate = dataAux;
                      setState(() {});
                    }
                    else {
                      _showAlert(context);
                    }
                  }
                  );
                }
                    , icon: Icon(Icons.calendar_month))
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical:20)
            ),
            Column(
              children: [
                Row(
                    children:[
                     Text("Weekdays"),]),
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
            Padding(
                padding: EdgeInsets.symmetric(vertical:20)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(padding: EdgeInsets.only(right: 20.0, bottom: 10), //para que deje un espacio a la derecha
                    child: const Text("From")),
                //SizedBox(width: 20), //para que se deje un espacio
                Text(_timeFormatter.format(widget.userGroup.schedule.fromDate)),
                IconButton(onPressed: () { _pickStartTime(context).then((_){
                  DateTime aux=addHourToDateTime(widget.userGroup.schedule.fromDate, timeAux);
                  bool canBe=true;
                  if(aux.isAfter(widget.userGroup.schedule.toDate))
                  {
                      _showAlert(context);
                      canBe=false;
                  }
                  if(canBe) {
                    widget.userGroup.schedule.fromDate=aux;
                    setState(() {});
                  }
                }); }
                    , icon: Icon(Icons.access_time))

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(padding: EdgeInsets.only(right: 45.0, bottom: 10),
                    child: const Text("To")),
                //SizedBox(width: 20),
                Text(_timeFormatter.format(widget.userGroup.schedule.toDate)),
                IconButton(onPressed: () { _pickStartTime(context).then((_){
                  DateTime aux=addHourToDateTime(widget.userGroup.schedule.toDate, timeAux);
                  bool canBe=true;
                  if(widget.userGroup.schedule.fromDate.isAfter(aux))
                  {
                    _showAlert(context);
                    canBe=false;
                  }
                  if(canBe) {
                    widget.userGroup.schedule.toDate=aux;
                    setState(() {});
                  }
                }); }
                    , icon: Icon(Icons.access_time))
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical:50)),
            ElevatedButton(child: Text("Submit"),
                onPressed:() {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(content: Text('Saved')),
                  );

                }//////////////////////////////////////////////////////////no hace nada aun
            ),
          ],
        ),
      ),
    );
  }
}