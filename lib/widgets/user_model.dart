class UserModel {
  late String generalConversation;
  // late int userAge;
  late List<String> skills;

  UserModel(
      this.generalConversation,
      //this.userAge,
      this.skills);

  UserModel.fromJson(Map<String, dynamic> json) {
    generalConversation = json['GeneralConversation'];
    //  userAge = json['UserAge'];
    skills = json['Skills'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GeneralConversation'] = "General Conversation";
    //  data['UserAge'] = this.userAge;
    data['Skills'] = this.skills;
    print("Data is.....$data");
    return data;
  }
}
