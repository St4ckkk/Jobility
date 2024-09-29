class UserModel {
  final String uid;
  final String name;
  final String email;
  final String role;
  final String? phoneNumber;
  final String? profilePicture;
  final String? address;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    this.phoneNumber,
    this.profilePicture,
    this.address,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convert UserModel to a Map (for future updates)
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
      'phone_number': phoneNumber,
      'profile_picture': profilePicture,
      'address': address,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Convert Firestore Map to UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      role: map['role'],
      phoneNumber: map['phone_number'],
      profilePicture: map['profile_picture'],
      address: map['address'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
