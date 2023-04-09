class ArchitectsModel {
  final String architectId;
  final String architectAboutMe;
  final String architectImage;
  final String architectType;
  final List<String> architectClients;
  final double architectExperience;
  final String architectName;
  final Map<String, String> architectOfficeLocation;
  final List<String> architectProjects;
  final String architectRegNumber;
  final List<String> skills;

  ArchitectsModel({
    required this.architectId,
    required this.architectAboutMe,
    required this.architectImage,
    required this.architectType,
    required this.architectClients,
    required this.architectExperience,
    required this.architectName,
    required this.architectOfficeLocation,
    required this.architectProjects,
    required this.architectRegNumber,
    required this.skills,
  });
}
