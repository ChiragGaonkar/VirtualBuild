class UserModel {
  final String uid;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final List? favorites;
  final List? hiredArchitects;
  final List? orderedModels;

  UserModel({
    required this.uid,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    this.favorites,
    this.hiredArchitects,
    this.orderedModels,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'address': address,
        'email': email,
        'phoneNumber': phoneNumber,
        'favorites': [],
        'hiredArchitects': [],
        'orderedModels': [],
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        address: json['address'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        favorites: json['favorites'],
        hiredArchitects: json['hiredArchitects'],
        orderedModels: json['orderedModels'],
      );
}
