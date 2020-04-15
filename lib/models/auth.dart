import 'package:firebase_auth/firebase_auth.dart';


class Auth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async{
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //return user.uid;
    } catch(error){
      throw error;
    }
    
  } 

  Future<void> signup(String email, String password) async{
    print("Sign UP Heree in Function");

    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //return user.uid;
    } catch(error){
      throw error;
    }
    
  }

  Future<String> getCurrentUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }



}

/*class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userID;

  Future<void> signup(String email, String password) async {
    const url =
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyALCpAE14JMnmrJ9OYhQdyctCeX15ZNxVg';
    try {
      print('here');
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyALCpAE14JMnmrJ9OYhQdyctCeX15ZNxVg';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}*/
