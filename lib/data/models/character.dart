class Character {
  String? sId;
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  List<int>? appearance;
  String? firstAppearance;
  String? lastAppearance;
  List<String>? nickname;
  String? portrayed;

  Character(
      {this.sId,
        this.charId,
        this.name,
        this.birthday,
        this.occupation,
        this.img,
        this.status,
        this.appearance,
        this.firstAppearance,
        this.lastAppearance,
        this.nickname,
        this.portrayed});

  Character.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    appearance = json['appearance'].cast<int>();
    firstAppearance = json['firstAppearance'];
    lastAppearance = json['lastAppearance'];
    nickname = json['nickname'].cast<String>();
    portrayed = json['portrayed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['char_id'] = this.charId;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['occupation'] = this.occupation;
    data['img'] = this.img;
    data['status'] = this.status;
    data['appearance'] = this.appearance;
    data['firstAppearance'] = this.firstAppearance;
    data['lastAppearance'] = this.lastAppearance;
    data['nickname'] = this.nickname;
    data['portrayed'] = this.portrayed;
    return data;
  }
}