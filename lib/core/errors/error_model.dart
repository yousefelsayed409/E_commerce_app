// class ErrorModel {
//   final bool status;
//   final String message;
//   final dynamic data;

//   ErrorModel({
//     required this.status,
//     required this.message,
//     this.data,
//   });

//   factory ErrorModel.fromJson(Map<String, dynamic> json) {
//     return ErrorModel(
//       status: json['status'],
//       message: json['message'],
//       data: json['data'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'data': data,
//     };
//   }
// }