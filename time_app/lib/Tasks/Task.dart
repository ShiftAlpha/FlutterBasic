//imports all attributes the occurance class contains
//to make use of in the task
import 'Occurance.dart';

//class Task
//contains attributes - task has attributes/variables of task
//name; days pew week; recurs
//adds to task

class Task{
  //name of task
  String name;
  //creates object name occurance
  //uses occurance import/ occurance class
  //sets Occurance obj in list type
  List<Occurance> occurance;

  //Task constructor
  //passes variables through
  Task(String name) {
    this.name = name;
    //occurance obj array
    occurance = [];
  }

  //void method 
  //setter - passes nameOfTask variable through
  void setNameOfTask(String nameOfTask){
    this.name = nameOfTask;
  }

  //get method - accessor
  String getNameOfTask(){
    //requires return type
    return this.name;
  }

  //void method 
  //to remove an occurance
  //int variable day
  void removeOccurrenceByDay(int day) {
    //number of times the occurance obj is in
    //assigned this.occurance var
    for (Occurance occurs in this.occurance) {
      //if statement 
      //checks if days per week contains the int variable - day
      if (occurs.dPw.contains(day)) {
        //then occurs at days per week is removed at the index of day
        occurs.dPw.remove(day);
      }
    }
  }
  
  //void method
  //add to task - passes attributes of a task
  // days per week ; time of day ; occurance/recurs 
  void addToT(List<int> dPw, List<DateTime> time, bool recur){
    //for loop
    //use this loop to check : occurance clashes an existing occurance
    for (Occurance occurs in this.occurance){
        //if occurance does not clash
        //add new one to the list
        //create error message
    }
    //else - add function of attributes - days per week - time - # times recurs
    //adds to occurance 
    this.occurance.add(new Occurance(dPw, time, recur));
      }




}