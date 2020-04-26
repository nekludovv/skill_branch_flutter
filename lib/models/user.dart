//import '../string_util.dart';
mixin UserUtils {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();
}
//======================================================================

enum LoginType {email, phone}

class User with UserUtils{
  String email;
  String phone;

  String _lastName;
  String _firstName;
  LoginType _type;

  List<User> friends = <User> [];
//----------------------------------------------------------------------
  User._({String firstName, String lastName, String phone, String email})
      :	_firstName = firstName,
        _lastName = lastName,
        this.phone = phone,
        this.email = email
        {
          print ("User is created");
          _type = ((email != null) && (email.isNotEmpty)) ?
          _type = LoginType.email : _type = LoginType.phone; // email != null ? LoginType.email : LoginType.phone;
        }
//----------------другой конструктор для примера !!!!!!!!!!!!!!!--------
//  User.__(String name) {
//  this ._lastName = name;
//  }
//----------------------------------------------------------------------
  factory User ({String name, String phone, String email}) {
//    if (name.isEmpty) throw Exception ("User name is empty");
//    if (phone.isEmpty || email.isEmpty) throw Exception ("phone or email is empty");
    (name == null) ? name = "" : name = name;
    (phone == null) ? phone = "" : phone = phone;
    (email == null) ? email = "" : email = email;
    if (name.isEmpty) throw Exception("User name is empty");
    if (name.indexOf(' ') == 0) throw Exception("Indicate first name and last name");
    if (email.isEmpty && phone.isEmpty) throw Exception("Phone or Email is empty");
  return User._(
      firstName: _getFirstName(name),
      lastName: _getLastName(name),
      phone: ((phone != null) && (phone.isNotEmpty)) ? checkPhone(phone) : phone,
      email: ((email != null) && (email.isNotEmpty)) ? checkEmail(email) : email);
//    phone: checkPhone (phone),
//    email: checkEmail (email));
  }
//----------------------------------------------------------------------
  static String _getLastName (String userName) => userName.split (" ")[1];
  static String _getFirstName (String userName) => userName.split (" ")[0];

  static String checkPhone (String phone) {
//    String pattern = r"^(?:[+0])?[0-9]{11}"; Кирилл
//    phone = phone.replaceAll (RegExp ("[^+\\d]"), "");
    String pattern = "ˆ?[+0]?[0-9]{11}"; //Ренат
    phone = phone.replaceAll(RegExp("[^+0-9]"), "");
    if (phone == null || phone.isEmpty) { //
      throw Exception("Enter don't empty phone number");
    }
    else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception("Enter a valid phone number staring with a 4+ and containing 11 digits");
  }
  return phone;
  }

  static String checkEmail(String email) {
    if (email == null || email.isEmpty) { //
        throw Exception("Enter don't empty email number");
    }
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (!RegExp(pattern).hasMatch(email)) {
      throw Exception("Enter a valid email");
    }
    return email;
  }
//----------------------------------------------------------------------
//  String get fullName {
//    return "$_firstName $_lastName";
//  }
//----------------------------------------------------------------------
  String get login {
  if (_type == LoginType.phone) return phone;
  return email;
  }
//----------------------------------------------------------------------
  String get name => '${capitalize(_firstName)} ${capitalize(_lastName)}';
//  String get name => "${"".capitalize(_firstName)} ${"".capitalize(_lastName)}";
//----------------------------------------------------------------------
  @override // переопределение оператора сравнения !!!
  bool operator == (Object object) {
    if (object == null) {
      return false;
    }
    if (object is User) {
    return _firstName == object._firstName &&
      _lastName == object._lastName &&
      (phone == object.phone || email == object.email);
    }
  }
//----------------------------------------------------------------------
  String get userInfo => """
    name: $name 
    email: $email 
    firstName: $_firstName 
    lastName: $_lastName 
    friends: ${friends.toList()} 
    \\n
  """;
//----------------------------------------------------------------------
  @override // переопределение функции  toString()
  String toString() {
    return """
    name: $name 
    email: $email
    friends: ${friends.toList()}
  """;
  }
//----------------------------------------------------------------------
  void addFriend (Iterable<User> newFriend) {
    friends.addAll(newFriend);
  }
//----------------------------------------------------------------------
  void removeFriend (User user) {
    friends.remove(user);
  }
//----------------------------------------------------------------------
  User findMyFrend(User user) {
    for (var myFrend in friends) {
      if (myFrend == user) {
        return myFrend;
      }
    }
    throw Exception('${user.login} is not a friend of the login');
  }
}
//======================================================================
