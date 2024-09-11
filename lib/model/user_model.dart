class UserModel {
  String? uid;
  String? name;
  String? pfp;

  UserModel({this.uid, this.name, this.pfp});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    pfp = json['pfp'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['pfp'] = pfp;
    return data;
  }
}
