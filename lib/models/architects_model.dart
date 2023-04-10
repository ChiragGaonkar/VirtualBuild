class ArchitectModel {
  final String architectID;
  final String architectName;
  final String architectType;
  final String architectRegisterNum;
  final String architectExperience;
  final Map<String, dynamic> architectOfficeLocation;
  final String aboutMe;
  final List skills;
  final String? architectImageUrl;
  final List? architectClientsId;
  final List? architectProjectsId;

  ArchitectModel({
    required this.architectID,
    required this.architectName,
    required this.architectType,
    required this.architectRegisterNum,
    required this.architectExperience,
    required this.architectOfficeLocation,
    required this.aboutMe,
    required this.skills,
    this.architectImageUrl,
    this.architectClientsId,
    this.architectProjectsId,
  });

  Map<String, dynamic> toJson() => {
        'architectID': architectID,
        'architectName': architectName,
        'architectType': architectType,
        'architectRegisterNum': architectRegisterNum,
        'architectExperience': architectExperience,
        'architectOfficeLocation': architectOfficeLocation,
        'aboutMe': aboutMe,
        'skills': skills,
        'architectImageUrl': "",
        'architectClientsId': [],
        'architectProjectsId': [],
      };

  static ArchitectModel fromJson(Map<String, dynamic> json) => ArchitectModel(
        architectID: json['architectID'],
        architectName: json['architectName'],
        architectType: json['architectType'],
        architectRegisterNum: json['architectRegisterNum'],
        architectExperience: json['architectExperience'],
        architectOfficeLocation: json['architectOfficeLocation'],
        aboutMe: 'aboutMe',
        skills: json['skills'],
        architectImageUrl: json['architectImageUrl'],
        architectClientsId: json['architectClientsId'],
        architectProjectsId: json['architectProjectsId'],
      );
}
