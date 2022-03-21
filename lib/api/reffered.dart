import 'dart:convert';
import 'package:http/http.dart' as https;

Future<ReferredUsersObject> fetchResponds(tkn) async {
  var headers = {'Content-Type': 'application/json', 'x-access-token': '$tkn'};
  var response = await https.get(
      Uri.parse('https://heybuddybackend.herokuapp.com/api/user/referStatus'),
      headers: headers);
  final result = jsonDecode(response.body) as Map<String, dynamic>;

  print("ASEDG" + "${jsonDecode(response.body)}");
  ReferredUsersObject objectModel = ReferredUsersObject.fromJson(result);

  if (response.statusCode == 201 || response.statusCode == 200) {
  } else {
    print("Fail");
  }

  return objectModel;
}

class ReferredUsersObject {
  ReferredUsersObject({
    required this.refferStatus,
  });

  final List<RefferStatus> refferStatus;

  factory ReferredUsersObject.fromJson(Map<String, dynamic> json) =>
      ReferredUsersObject(
        refferStatus: List<RefferStatus>.from(
            json["refferStatus"].map((x) => RefferStatus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "refferStatus": List<dynamic>.from(refferStatus.map((x) => x.toJson())),
      };
}

class RefferStatus {
  RefferStatus({
    required this.user,
    required this.bookingMade,
    required this.cashbackStatus,
  });

  final User user;
  final String bookingMade;
  final String cashbackStatus;

  factory RefferStatus.fromJson(Map<String, dynamic> json) => RefferStatus(
        user: User.fromJson(json["user"]),
        bookingMade: json["bookingMade"],
        cashbackStatus: json["cashbackStatus"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "bookingMade": bookingMade,
        "cashbackStatus": cashbackStatus,
      };
}

class User {
  User({
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
    required this.education,
    required this.company,
    required this.v,
    required this.referCodeGiven,
    required this.experience,
    required this.percentage,
    required this.verificationRequested,
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
  final List<String> languages;
  final List<dynamic> payoutRecievedMonths;
  final String referCodeUsed;
  final String rating;
  final int ratingsNum;
  final String referDiscountStatus;
  final String refferalAdminPaymentStatus;
  final DateTime joiningDate;
  final List<dynamic> usersReffered;
  final List<Education> education;
  final List<Company> company;
  final int v;
  final String referCodeGiven;
  final int experience;
  final int percentage;
  final String verificationRequested;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        languages: List<String>.from(json["languages"].map((x) => x)),
        payoutRecievedMonths:
            List<dynamic>.from(json["payoutRecievedMonths"].map((x) => x)),
        referCodeUsed: json["referCodeUsed"],
        rating: json["rating"],
        ratingsNum: json["ratingsNum"],
        referDiscountStatus: json["referDiscountStatus"],
        refferalAdminPaymentStatus: json["refferalAdminPaymentStatus"],
        joiningDate: DateTime.parse(json["joiningDate"]),
        usersReffered: List<dynamic>.from(json["usersReffered"].map((x) => x)),
        education: List<Education>.from(
            json["education"].map((x) => Education.fromJson(x))),
        company:
            List<Company>.from(json["company"].map((x) => Company.fromJson(x))),
        v: json["__v"],
        referCodeGiven: json["referCodeGiven"],
        experience: json["experience"],
        percentage: json["percentage"],
        verificationRequested: json["verificationRequested"],
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
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "company": List<dynamic>.from(company.map((x) => x.toJson())),
        "__v": v,
        "referCodeGiven": referCodeGiven,
        "experience": experience,
        "percentage": percentage,
        "verificationRequested": verificationRequested,
      };
}

class Company {
  Company({
    required this.title,
    required this.companyName,
    required this.startDate,
    required this.endDate,
    required this.id,
  });

  final String title;
  final String companyName;
  final String startDate;
  final String endDate;
  final String id;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        title: json["title"],
        companyName: json["company_name"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "company_name": companyName,
        "start_date": startDate,
        "end_date": endDate,
        "_id": id,
      };
}

class Education {
  Education({
    required this.uni,
    required this.course,
    required this.id,
  });

  final String uni;
  final String course;
  final String id;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        uni: json["uni"],
        course: json["course"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "uni": uni,
        "course": course,
        "_id": id,
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
