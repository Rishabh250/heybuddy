class VerificationProcess {
  VerificationProcess({
    required this.message,
    required this.professional,
  });

  final String message;
  final Professional professional;

  factory VerificationProcess.fromJson(Map<String, dynamic> json) =>
      VerificationProcess(
        message: json["message"],
        professional: Professional.fromJson(json["professional"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "professional": professional.toJson(),
      };
}

class Professional {
  Professional({
    required this.id,
    required this.role,
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.gender,
    required this.profilePic,
    required this.bio,
    required this.hktid,
    required this.anonymous,
    required this.available,
    required this.verified,
    required this.upiid,
    required this.amount,
    required this.successfulSession,
    required this.skills,
    required this.languages,
    required this.payoutRecievedMonths,
    required this.referCodeUsed,
    required this.rating,
    required this.ratingsNum,
    required this.referDiscountStatus,
    required this.refferalAdminPaymentStatus,
    required this.joiningDate,
    required this.usersReffered,
    required this.verificationRequested,
    required this.education,
    required this.company,
    required this.v,
    required this.referCodeGiven,
    required this.experience,
    required this.percentage,
  });

  final String id;
  final String role;
  final String name;
  final String password;
  final String email;
  final String phone;
  final String gender;
  final String profilePic;
  final dynamic bio;
  final String hktid;
  final String anonymous;
  final String available;
  final String verified;
  final String upiid;
  final int amount;
  final int successfulSession;
  final List<Skill> skills;
  final List<dynamic> languages;
  final List<dynamic> payoutRecievedMonths;
  final String referCodeUsed;
  final String rating;
  final int ratingsNum;
  final String referDiscountStatus;
  final String refferalAdminPaymentStatus;
  final DateTime joiningDate;
  final List<String> usersReffered;
  final String verificationRequested;
  final List<dynamic> education;
  final List<dynamic> company;
  final int v;
  final String referCodeGiven;
  final int experience;
  final int percentage;

  factory Professional.fromJson(Map<String, dynamic> json) => Professional(
        id: json["_id"],
        role: json["role"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        phone: json["phone"],
        gender: json["gender"],
        profilePic: json["profilePic"],
        bio: json["bio"],
        hktid: json["HKTID"],
        anonymous: json["anonymous"],
        available: json["available"],
        verified: json["verified"],
        upiid: json["upiid"],
        amount: json["amount"],
        successfulSession: json["successful_session"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        languages: List<dynamic>.from(json["languages"].map((x) => x)),
        payoutRecievedMonths:
            List<dynamic>.from(json["payoutRecievedMonths"].map((x) => x)),
        referCodeUsed: json["referCodeUsed"],
        rating: json["rating"],
        ratingsNum: json["ratingsNum"],
        referDiscountStatus: json["referDiscountStatus"],
        refferalAdminPaymentStatus: json["refferalAdminPaymentStatus"],
        joiningDate: DateTime.parse(json["joiningDate"]),
        usersReffered: List<String>.from(json["usersReffered"].map((x) => x)),
        verificationRequested: json["verificationRequested"],
        education: List<dynamic>.from(json["education"].map((x) => x)),
        company: List<dynamic>.from(json["company"].map((x) => x)),
        v: json["__v"],
        referCodeGiven: json["referCodeGiven"],
        experience: json["experience"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "role": role,
        "name": name,
        "password": password,
        "email": email,
        "phone": phone,
        "gender": gender,
        "profilePic": profilePic,
        "bio": bio,
        "HKTID": hktid,
        "anonymous": anonymous,
        "available": available,
        "verified": verified,
        "upiid": upiid,
        "amount": amount,
        "successful_session": successfulSession,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "payoutRecievedMonths":
            List<dynamic>.from(payoutRecievedMonths.map((x) => x)),
        "referCodeUsed": referCodeUsed,
        "rating": rating,
        "ratingsNum": ratingsNum,
        "referDiscountStatus": referDiscountStatus,
        "refferalAdminPaymentStatus": refferalAdminPaymentStatus,
        "joiningDate": joiningDate.toIso8601String(),
        "usersReffered": List<dynamic>.from(usersReffered.map((x) => x)),
        "verificationRequested": verificationRequested,
        "education": List<dynamic>.from(education.map((x) => x)),
        "company": List<dynamic>.from(company.map((x) => x)),
        "__v": v,
        "referCodeGiven": referCodeGiven,
        "experience": experience,
        "percentage": percentage,
      };
}

class Skill {
  Skill({
    required this.name,
    required this.price,
    required this.id,
  });

  final String name;
  final int price;
  final String id;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        name: json["name"],
        price: json["price"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "_id": id,
      };
}
