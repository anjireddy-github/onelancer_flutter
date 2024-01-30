class ProfileResponse {
  final String id;
  final String user;
  final String firstName;
  final List<String> skills;
  final List<String> portfolio;
  final List<String> experience;
  final List<String> education;
  final List<String> certifications;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String profileImage;

  ProfileResponse({
    required this.id,
    required this.user,
    required this.firstName,
    required this.skills,
    required this.portfolio,
    required this.experience,
    required this.education,
    required this.certifications,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.profileImage,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      id: json['_id'] as String,
      user: json['user'] as String,
      firstName: json['firstName'] as String,
      skills: (json['skills'] as List<dynamic>).cast<String>(),
      portfolio: (json['portfolio'] as List<dynamic>).cast<String>(),
      experience: (json['experience'] as List<dynamic>).cast<String>(),
      education: (json['education'] as List<dynamic>).cast<String>(),
      certifications: (json['certifications'] as List<dynamic>).cast<String>(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: json['__v'] as int,
      profileImage: json['profileImage'] as String,
    );
  }

  @override
  String toString() {
    return 'ProfileResponse{id: $id, user: $user, firstName: $firstName, skills: $skills, portfolio: $portfolio, experience: $experience, education: $education, certifications: $certifications, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, profileImage: $profileImage}';
  }
}