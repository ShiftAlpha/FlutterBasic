//class named occurance
//function is to allocate occurances in the app 
//function contains attributes

//class occurance
class Occurance {
  //variable dPw - days per week - List variable - is int type
  List<int> dPw;
  //variable time - List variable - Date and time type
  List<DateTime> time;
  //boolean variable - recur - set to false
  bool recur = false;

//Occurance constructor 
//passes variables through 
  Occurance(List<int> dPw, List<DateTime> time, bool recur){
    //days per week
    this.dPw = dPw;
    this.time = time;
    this.recur = recur;
  }
}