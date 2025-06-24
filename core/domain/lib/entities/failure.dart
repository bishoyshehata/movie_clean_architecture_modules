
 // error model that we expect comes From Api
class Failure {
  int statusCode ; // 200,201,303,404,400,401,500,503,...etc
  String message ;

  Failure(this.statusCode,this.message);
}