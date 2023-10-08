class TyreSizeModel {
  int? statusCode;
  String? message;
  Data? data;

  TyreSizeModel({this.statusCode, this.message, this.data});

  TyreSizeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  TyreTypeData? tyreTypeData;

  Data({this.token, this.tyreTypeData});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tyreTypeData = json['tyre_type_data'] != null
        ? new TyreTypeData.fromJson(json['tyre_type_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.tyreTypeData != null) {
      data['tyre_type_data'] = this.tyreTypeData!.toJson();
    }
    return data;
  }
}

class TyreTypeData {
  int? count;
  List<Rows>? rows;

  TyreTypeData({this.count, this.rows});

  TyreTypeData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(new Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? tyreTypeId;
  String? title;
  int? width;
  int? aspectRatio;
  String? construction;
  int? rimDiamete;
  String? speedRating;
  int? loadRating;
  String? createdDatetime;
  Null? updatedDatetime;
  int? isDeleted;
  int? isActive;

  Rows(
      {this.tyreTypeId,
        this.title,
        this.width,
        this.aspectRatio,
        this.construction,
        this.rimDiamete,
        this.speedRating,
        this.loadRating,
        this.createdDatetime,
        this.updatedDatetime,
        this.isDeleted,
        this.isActive});

  Rows.fromJson(Map<String, dynamic> json) {
    tyreTypeId = json['tyre_type_id'];
    title = json['title'];
    width = json['width'];
    aspectRatio = json['aspect_ratio'];
    construction = json['construction'];
    rimDiamete = json['rim_diamete'];
    speedRating = json['speed_rating'];
    loadRating = json['load_rating'];
    createdDatetime = json['created_datetime'];
    updatedDatetime = json['updated_datetime'];
    isDeleted = json['is_deleted'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tyre_type_id'] = this.tyreTypeId;
    data['title'] = this.title;
    data['width'] = this.width;
    data['aspect_ratio'] = this.aspectRatio;
    data['construction'] = this.construction;
    data['rim_diamete'] = this.rimDiamete;
    data['speed_rating'] = this.speedRating;
    data['load_rating'] = this.loadRating;
    data['created_datetime'] = this.createdDatetime;
    data['updated_datetime'] = this.updatedDatetime;
    data['is_deleted'] = this.isDeleted;
    data['is_active'] = this.isActive;
    return data;
  }
}
