class PrizeModel {
  List<NobelPrizes>? nobelPrizes;

  PrizeModel({this.nobelPrizes});

  PrizeModel.fromJson(Map<String, dynamic> json) {
    if (json['nobelPrizes'] != null) {
      nobelPrizes = <NobelPrizes>[];
      json['nobelPrizes'].forEach((v) {
        nobelPrizes!.add(new NobelPrizes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nobelPrizes != null) {
      data['nobelPrizes'] = this.nobelPrizes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NobelPrizes {
  String? awardYear;
  String? category;
  String? categoryFullName;
  String? dateAwarded;
  int? prizeAmount;
  int? prizeAmountAdjusted;
  List<Laureates>? laureates;

  NobelPrizes(
      {this.awardYear,
      this.category,
      this.categoryFullName,
      this.dateAwarded,
      this.prizeAmount,
      this.prizeAmountAdjusted,
      this.laureates});

  NobelPrizes.fromJson(Map<String, dynamic> json) {
    awardYear = json['awardYear'];
    category = json['category'];
    categoryFullName = json['categoryFullName'];
    dateAwarded = json['dateAwarded'];
    prizeAmount = json['prizeAmount'];
    prizeAmountAdjusted = json['prizeAmountAdjusted'];
    if (json['laureates'] != null) {
      laureates = <Laureates>[];
      json['laureates'].forEach((v) {
        laureates!.add(new Laureates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['awardYear'] = this.awardYear;
    data['category'] = this.category;
    data['categoryFullName'] = this.categoryFullName;
    data['dateAwarded'] = this.dateAwarded;
    data['prizeAmount'] = this.prizeAmount;
    data['prizeAmountAdjusted'] = this.prizeAmountAdjusted;
    if (this.laureates != null) {
      data['laureates'] = this.laureates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Laureates {
  String? id;
  String? knownName;
  String? fullName;
  String? portion;
  String? sortOrder;
  String? motivation;

  Laureates(
      {this.id,
      this.knownName,
      this.fullName,
      this.portion,
      this.sortOrder,
      this.motivation});

  Laureates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    knownName = json['knownName'];
    fullName = json['fullName'];
    portion = json['portion'];
    sortOrder = json['sortOrder'];
    motivation = json['motivation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['knownName'] = this.knownName;
    data['fullName'] = this.fullName;
    data['portion'] = this.portion;
    data['sortOrder'] = this.sortOrder;
    data['motivation'] = this.motivation;
    return data;
  }
}
