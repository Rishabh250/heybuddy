class LanguageModel {
  // late String generalConversation;
  // late int userAge;
  late List<String> skills;

  LanguageModel(
     
      this.skills);

  LanguageModel.fromJson(Map<String, dynamic> json) {
   
    skills = json['Skills'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Skills'] = this.skills;
    print("Data is.....$data");
    return data;
  }
}
