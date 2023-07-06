class UserModel {
  final String uid;
  final String name;
  final String address;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final List? favModels;
  final List? hiredArchitects;
  final List? orderedModels;
  final List? favArchitects;
  final List? token;

  UserModel({
    required this.uid,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.imageUrl,
    this.favModels,
    this.hiredArchitects,
    this.orderedModels,
    this.favArchitects,
    this.token,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'address': address,
        'email': email,
        'imageUrl': imageUrl,
        'phoneNumber': phoneNumber,
        'favModels': [],
        'hiredArchitects': [],
        'orderedModels': [],
        'favArchitects': [],
        'token': [],
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        address: json['address'],
        email: json['email'],
        imageUrl: json['imageUrl'],
        phoneNumber: json['phoneNumber'],
        favModels: json['favModels'],
        hiredArchitects: json['hiredArchitects'],
        orderedModels: json['orderedModels'],
        favArchitects: json['favArchitects'],
        token: json['token'],
      );
}
