//main class - executes 
//main app class 
//generated from flutter
//creates states

//imports packages/attributes of other classes
import 'package:flutter/material.dart';
import 'package:time_app/User/User.dart';
import 'User/User.dart';
import 'WeekView.dart';

//void method 
//sets main to runApp- MyApp
void main() => runApp(MyApp());


//extends stateless widget class
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //main to build app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //sets title
      title: 'Time & Task',
      //sets themedata
      theme: ThemeData(
        //sets color to blue
        primarySwatch: Colors.blue,
      ),
      //displays Task & Time Management on HomePage as the title
      home: MyHomePage(title: 'Task & Time Management'),
    );
  }
}

//class or homepage
class MyHomePage extends StatefulWidget {
  //creates User class object 
  static User theUser = new User();
  //super class method
  MyHomePage({Key key, this.title}) : super(key: key);
  //sets title to string type - and final
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//state of homepage
//extends attributes from MyHomePage class to this state
class _MyHomePageState extends State<MyHomePage> {
  //widget builder
  @override
  Widget build(BuildContext context) {
    //Controller editor class, object - task name controller
    TextEditingController tNameControl = new TextEditingController();
    //string variable texts
    String texts = "";
    //state requires return method scaffold
    return Scaffold( 
      //consists of appbar
        appBar: AppBar(
          //title of widget, set 
          title: Text(widget.title),
        ),
        //consists of body
        body: Center(
            child: Container(
                color: Colors.blueGrey,
                margin: EdgeInsets.all(50),
                child: Column(
                  //child class consists of column with 
                  //children with attributes of a widget
                  children: <Widget>[
                    //wdigets consists of text and text field 
                    Text("Add new Task"),
                    TextField(
                      controller: tNameControl,
                      onChanged: (text) {
                        //texts equated to text 
                        texts = text;
                      },
                      onEditingComplete: () {
                        tNameControl.text = texts;
                      },
                      //textAlign: TextAlign.center,
                    ),
                    //flat button created
                    FlatButton(
                      color: Colors.redAccent,
                      child: Text("Add Task"),
                      onPressed: () {
                        //if taskn name controller is consisting of an attribute greater 
                        //than length size 1
                        if (tNameControl.text.length > 1) {
                          //addTask name to task name controller
                          addTaskName(tNameControl.text);
                        }
                      },
                    )
                  ],
                ))));
  }

  //void function
  //addTaskName function
  //parses name variable
  void addTaskName(String name) {
    // Should show a dialog or new window where one can specify the occurrence
    print("This is the name: " + name);
    Navigator.push(
      context,
      //assigns name to context
      MaterialPageRoute(builder: (context) => SecondRoute(name)),
    );
  }
}

//class extends from StatefulWidget
class SecondRoute extends StatefulWidget {
  String name = "";
  SecondRoute(String name) {
    this.name = name;
  }
  // assigned route states name to createState of secondroute 
  @override
  _SecondRouteState createState() => _SecondRouteState(name);
}
//class _SecondRouteState extends from state of SecondRoute class
class _SecondRouteState extends State<SecondRoute> {
  //attributes/variables
  String tName;
  bool mon = false;
  bool tues = false;
  bool wed = false;
  bool thurs = false;
  bool frid = false;
  bool sat = false;
  bool sund = false;
  
  //days variable
  List<int> days = [];
  //future class - time From(start)
  Future<TimeOfDay> timeF;
  //future class - time to (end)
  Future<TimeOfDay> timeT;

  bool recur = false;

  //contrustor
  _SecondRouteState(String name) {
    this.tName = name;
  }

  //TextStyle class - variable day week style 
  TextStyle dWStyle =
    //sets font attributes
      TextStyle(fontFamily: 'Rubik', fontSize: 10, fontWeight: FontWeight.bold, color: Colors.lightGreen );
  //TextStyle class - variable tite Style 
  TextStyle titleStyle =
    //sets title style font attributes
      TextStyle(fontFamily: 'Ubuntu', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87);

  //builds widget
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tName),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 0),
          child: Column(
            //spacing
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //sets Repeats to style of title style var
              Text('Repeats', style: titleStyle),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //contains all days of the week - widget
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              //day of the week
                              'Monday',
                              //sets text of Monday to day week style text
                              style: dWStyle,
                            ),
                            //checkbox for day of week
                            Checkbox(
                              value: mon,
                              onChanged: (value) {
                                //if statement to check day contains a value
                                if (!this.days.contains(0)) {
                                  this.days.add(0);
                                } else {
                                  this.days.remove(0);
                                }
                                //set states of monday variable to value
                                setState(() {
                                  mon = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              //day of the week
                              'Tuesday',
                              //sets text of Monday to day week style text
                              style: dWStyle,
                            ),
                            Checkbox(
                              value: tues,
                              onChanged: (value) {
                                if (!this.days.contains(1)) {
                                  this.days.add(1);
                                } else {
                                  this.days.remove(1);
                                }
                                setState(() {
                                  tues = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Wednesday',
                              style: dWStyle,
                            ),
                            Checkbox(
                              value: wed,
                              onChanged: (value) {
                                if (!this.days.contains(2)) {
                                  this.days.add(2);
                                } else {
                                  this.days.remove(2);
                                }
                                setState(() {
                                  wed = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Thursday',
                              style: dWStyle,
                            ),
                            Checkbox(
                              value: thurs,
                              onChanged: (value) {
                                if (!this.days.contains(3)) {
                                  this.days.add(3);
                                } else {
                                  this.days.remove(3);
                                }
                                setState(() {
                                  thurs = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Friday',
                              style: dWStyle,
                            ),
                            Checkbox(
                              value: frid,
                              onChanged: (value) {
                                if (!this.days.contains(4)) {
                                  this.days.add(4);
                                } else {
                                  this.days.remove(4);
                                }
                                setState(() {
                                  frid = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Saturday',
                              style: dWStyle,
                            ),
                            Checkbox(
                              value: sat,
                              onChanged: (value) {
                                if (!this.days.contains(5)) {
                                  this.days.add(5);
                                } else {
                                  this.days.remove(5);
                                }
                                setState(() {
                                  sat = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Sunday',
                              style: dWStyle,
                            ),
                            Checkbox(
                              value: sund,
                              onChanged: (value) {
                                if (!this.days.contains(6)) {
                                  this.days.add(6);
                                } else {
                                  this.days.remove(6);
                                }
                                setState(() {
                                  sund = value;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //container to show times for tasks
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.cyanAccent),
                child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () {
                      //sets time from(start) to material design time picker
                      timeF = showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    child: Text(
                      "Set Start time",
                      style: titleStyle /*
                      TextStyle(
                          fontFamily:'Ubuntu',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white10),*/
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.cyanAccent),
                child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () {
                      timeT = showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    child: Text(
                      "Set End time",
                      style: titleStyle /*
                      TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white10),*/
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.orange,
                onPressed: () {
                  if (this.days.length > 0 &&
                      this.timeF != null &&
                      this.timeT != null) {
                    createTask();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Creat Task',
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createTask() async {
    for (int d in days) {
      print(d);
    }
    DateTime rn = new DateTime.now();
    DateTime tStart;
    DateTime tEnd;

    await timeF.then((value) => tStart = new DateTime(rn.year, rn.month,rn.day, value.hour, value.minute));
    print(tStart.toString());
    await timeT.then((value) => tEnd = new DateTime(rn.year, rn.month,rn.day, value.hour, value.minute));
    print(tEnd.toString());

    List<DateTime> times = [];
    times.add(tStart);
    times.add(tEnd);
    MyHomePage.theUser.createTask(this.tName, this.days,times, this.recur);
    Navigator.of(context).pop();
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => WeekView()),
    );
  }
}
