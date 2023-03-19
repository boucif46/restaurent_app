class supperClass {

   supper_class(){
    print('this is a super constructor');
   }
}

class subClass extends supperClass {

  subClass(){
    print('this is a sub class constructor');
  }

  display(){
    print('info diplayed ');
  }
}

void main(){

   subClass sub = new subClass();

   sub.display();

}