//user class
//function create tasks and compare if they/a task exists

//imports to use attributes contained in the class
import 'package:time_app/Tasks/Task.dart';
import 'package:time_app/Tasks/Occurance.dart';

class User {
  //tasks variable instaniated as a list type
  //tasks = array ; contains attributes from Task class
  List<Task> tasks = [];

  //void method passing attributes
  //method to create a task
  void createTask(String tName, List<int> dPw, List<DateTime> time, bool recur) {

    //if statement
    //if the task doesnt exit - add new task
    if (this.getTaskByName(tName) == null) {
      //adds new task to array - tasks
      this.tasks.add(new Task(tName));
    }
    //else 
    Task theTask = this.getTaskByName(tName);
    //add current task to task
    theTask.addToT(dPw, time, recur);
  }
  // method to get the task by name
  //calls string variable from task class
  Task getTaskByName(String tName) {
    //task obj created 
    for (Task task in this.tasks) {
      //checks if task name is equal
      if (task.name == tName) {
        //returns task
        return task;
      }
    }//else null
    return null;
    //add boolean function to recur if task does not equate
  }
}