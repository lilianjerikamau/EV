// import '../models/user_details.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SessionPreferences {
//   final String _userId = 'userId';
//   Future<void> setLoggedInUser(UserDetails UserDetails) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setInt(_userId, UserDetails.id);
//   }
//
//   Future<UserDetails> getLoggedInUser() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     return UserDetails(
//       id: sharedPreferences.getInt(_userId) ?? 0,
//       firstName: "",
//       middleName: "",
//       lastName: "",
//       username: "",
//       phone: "",
//       email: "",
//       userType: "",
//       identificationType: "",
//       identificationNumber: "",
//       enabled: false,
//       accountNonExpired: true,
//       accountNonLocked: true,
//       credentialsNonExpired: true,
//       identificationMedias: [],
//       roles: [],
//     );
//   }
// }
