// To parse this JSON data, do
//
//     final personagemModel = personagemModelFromJson(jsonString);

import 'dart:convert';

class PersonagemModel {
  PersonagemModel({
    this.characters,
    this.information,
  });

  Characters characters;
  Information information;

  factory PersonagemModel.fromRawJson(String str) => PersonagemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonagemModel.fromJson(Map<String, dynamic> json) => PersonagemModel(
    characters: json["characters"] == null ? null : Characters.fromJson(json["characters"]),
    information: json["information"] == null ? null : Information.fromJson(json["information"]),
  );

  Map<String, dynamic> toJson() => {
    "characters": characters == null ? null : characters.toJson(),
    "information": information == null ? null : information.toJson(),
  };
}

class Characters {
  Characters({
    this.data,
    this.achievements,
    this.deaths,
    this.otherCharacters,
  });

  Data data;
  List<Achievement> achievements;
  List<Death> deaths;
  List<OtherCharacter> otherCharacters;

  factory Characters.fromRawJson(String str) => Characters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    achievements: json["achievements"] == null ? null : List<Achievement>.from(json["achievements"].map((x) => Achievement.fromJson(x))),
    deaths: json["deaths"] == null ? null : List<Death>.from(json["deaths"].map((x) => Death.fromJson(x))),
    otherCharacters: json["other_characters"] == null ? null : List<OtherCharacter>.from(json["other_characters"].map((x) => OtherCharacter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "achievements": achievements == null ? null : List<dynamic>.from(achievements.map((x) => x.toJson())),
    "deaths": deaths == null ? null : List<dynamic>.from(deaths.map((x) => x.toJson())),
    "other_characters": otherCharacters == null ? null : List<dynamic>.from(otherCharacters.map((x) => x.toJson())),
  };
}

class Achievement {
  Achievement({
    this.stars,
    this.name,
  });

  int stars;
  String name;

  factory Achievement.fromRawJson(String str) => Achievement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
    stars: json["stars"] == null ? null : json["stars"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "stars": stars == null ? null : stars,
    "name": name == null ? null : name,
  };
}

class Data {
  Data({
    this.name,
    this.formerNames,
    this.title,
    this.sex,
    this.vocation,
    this.level,
    this.achievementPoints,
    this.world,
    this.residence,
    this.marriedTo,
    this.house,
    this.guild,
    this.lastLogin,
    this.comment,
    this.accountStatus,
    this.status,
  });

  String name;
  List<String> formerNames;
  String title;
  String sex;
  String vocation;
  int level;
  int achievementPoints;
  String world;
  String residence;
  String marriedTo;
  House house;
  Guild guild;
  List<LastLogin> lastLogin;
  String comment;
  String accountStatus;
  String status;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"] == null ? null : json["name"],
    formerNames: json["former_names"] == null ? null : List<String>.from(json["former_names"].map((x) => x)),
    title: json["title"] == null ? null : json["title"],
    sex: json["sex"] == null ? null : json["sex"],
    vocation: json["vocation"] == null ? null : json["vocation"],
    level: json["level"] == null ? null : json["level"],
    achievementPoints: json["achievement_points"] == null ? null : json["achievement_points"],
    world: json["world"] == null ? null : json["world"],
    residence: json["residence"] == null ? null : json["residence"],
    marriedTo: json["married_to"] == null ? null : json["married_to"],
    house: json["house"] == null ? null : House.fromJson(json["house"]),
    guild: json["guild"] == null ? null : Guild.fromJson(json["guild"]),
    lastLogin: json["last_login"] == null ? null : List<LastLogin>.from(json["last_login"].map((x) => LastLogin.fromJson(x))),
    comment: json["comment"] == null ? null : json["comment"],
    accountStatus: json["account_status"] == null ? null : json["account_status"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "former_names": formerNames == null ? null : List<dynamic>.from(formerNames.map((x) => x)),
    "title": title == null ? null : title,
    "sex": sex == null ? null : sex,
    "vocation": vocation == null ? null : vocation,
    "level": level == null ? null : level,
    "achievement_points": achievementPoints == null ? null : achievementPoints,
    "world": world == null ? null : world,
    "residence": residence == null ? null : residence,
    "married_to": marriedTo == null ? null : marriedTo,
    "house": house == null ? null : house.toJson(),
    "guild": guild == null ? null : guild.toJson(),
    "last_login": lastLogin == null ? null : List<dynamic>.from(lastLogin.map((x) => x.toJson())),
    "comment": comment == null ? null : comment,
    "account_status": accountStatus == null ? null : accountStatus,
    "status": status == null ? null : status,
  };
}

class Guild {
  Guild({
    this.name,
    this.rank,
  });

  String name;
  String rank;

  factory Guild.fromRawJson(String str) => Guild.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guild.fromJson(Map<String, dynamic> json) => Guild(
    name: json["name"] == null ? null : json["name"],
    rank: json["rank"] == null ? null : json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "rank": rank == null ? null : rank,
  };
}

class House {
  House({
    this.name,
    this.town,
    this.paid,
    this.world,
    this.houseid,
  });

  String name;
  String town;
  DateTime paid;
  String world;
  int houseid;

  factory House.fromRawJson(String str) => House.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory House.fromJson(Map<String, dynamic> json) => House(
    name: json["name"] == null ? null : json["name"],
    town: json["town"] == null ? null : json["town"],
    paid: json["paid"] == null ? null : DateTime.parse(json["paid"]),
    world: json["world"] == null ? null : json["world"],
    houseid: json["houseid"] == null ? null : json["houseid"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "town": town == null ? null : town,
    "paid": paid == null ? null : "${paid.year.toString().padLeft(4, '0')}-${paid.month.toString().padLeft(2, '0')}-${paid.day.toString().padLeft(2, '0')}",
    "world": world == null ? null : world,
    "houseid": houseid == null ? null : houseid,
  };
}

class LastLogin {
  LastLogin({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory LastLogin.fromRawJson(String str) => LastLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LastLogin.fromJson(Map<String, dynamic> json) => LastLogin(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    timezoneType: json["timezone_type"] == null ? null : json["timezone_type"],
    timezone: json["timezone"] == null ? null : json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date.toIso8601String(),
    "timezone_type": timezoneType == null ? null : timezoneType,
    "timezone": timezone == null ? null : timezone,
  };
}

class Death {
  Death({
    this.date,
    this.level,
    this.reason,
    this.involved,
  });

  LastLogin date;
  int level;
  String reason;
  List<Involved> involved;

  factory Death.fromRawJson(String str) => Death.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Death.fromJson(Map<String, dynamic> json) => Death(
    date: json["date"] == null ? null : LastLogin.fromJson(json["date"]),
    level: json["level"] == null ? null : json["level"],
    reason: json["reason"] == null ? null : json["reason"],
    involved: json["involved"] == null ? null : List<Involved>.from(json["involved"].map((x) => Involved.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date.toJson(),
    "level": level == null ? null : level,
    "reason": reason == null ? null : reason,
    "involved": involved == null ? null : List<dynamic>.from(involved.map((x) => x.toJson())),
  };
}

class Involved {
  Involved({
    this.name,
  });

  String name;

  factory Involved.fromRawJson(String str) => Involved.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Involved.fromJson(Map<String, dynamic> json) => Involved(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
  };
}

class OtherCharacter {
  OtherCharacter({
    this.name,
    this.world,
    this.status,
  });

  String name;
  String world;
  String status;

  factory OtherCharacter.fromRawJson(String str) => OtherCharacter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtherCharacter.fromJson(Map<String, dynamic> json) => OtherCharacter(
    name: json["name"] == null ? null : json["name"],
    world: json["world"] == null ? null : json["world"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "world": world == null ? null : world,
    "status": status == null ? null : status,
  };
}

class Information {
  Information({
    this.apiVersion,
    this.executionTime,
    this.lastUpdated,
    this.timestamp,
  });

  int apiVersion;
  double executionTime;
  DateTime lastUpdated;
  DateTime timestamp;

  factory Information.fromRawJson(String str) => Information.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Information.fromJson(Map<String, dynamic> json) => Information(
    apiVersion: json["api_version"] == null ? null : json["api_version"],
    executionTime: json["execution_time"] == null ? null : json["execution_time"].toDouble(),
    lastUpdated: json["last_updated"] == null ? null : DateTime.parse(json["last_updated"]),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "api_version": apiVersion == null ? null : apiVersion,
    "execution_time": executionTime == null ? null : executionTime,
    "last_updated": lastUpdated == null ? null : lastUpdated.toIso8601String(),
    "timestamp": timestamp == null ? null : timestamp.toIso8601String(),
  };
}
