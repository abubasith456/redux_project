// class Users {
//   factory Users.init() =>  Users(
//       status: 0,
//       connection: '',
//       message: '',
//       userData:  UserData(
//           userId: 0, dateOfBirth: '', username: '', mobileNumber: ''));

//   int? status;
//   String? connection;
//   String? message;
//   UserData? userData;

//   Users({this.status, this.connection, this.message, this.userData});

//   Users.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     connection = json['connection'];
//     message = json['message'];
//     userData =
//         json['userData'] != null ? UserData.fromJson(json['userData']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['connection'] = connection;
//     data['message'] = message;
//     if (userData != null) {
//       data['userData'] = userData!.toJson();
//     }
//     return data;
//   }
// }

// class UserData {
//   int? userId;
//   String? username;
//   String? email;
//   String? dateOfBirth;
//   String? mobileNumber;

//   UserData(
//       {this.userId,
//       this.username,
//       this.email,
//       this.dateOfBirth,
//       this.mobileNumber});

//   UserData.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     username = json['username'];
//     email = json['email'];
//     dateOfBirth = json['dateOfBirth'];
//     mobileNumber = json['mobileNumber'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['user_id'] = userId;
//     data['username'] = username;
//     data['email'] = email;
//     data['dateOfBirth'] = dateOfBirth;
//     data['mobileNumber'] = mobileNumber;
//     return data;
//   }
// }
