class TyreModel {
  int? statusCode;
  String? message;
  Data? data;

  TyreModel({this.statusCode, this.message, this.data});

  TyreModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  TyreBrandData? tyreBrandData;

  Data({this.token, this.tyreBrandData});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tyreBrandData = json['tyre_brand_data'] != null
        ? TyreBrandData.fromJson(json['tyre_brand_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (tyreBrandData != null) {
      data['tyre_brand_data'] = tyreBrandData!.toJson();
    }
    return data;
  }
}

class TyreBrandData {
  int? count;
  List<Rows>? rows;

  TyreBrandData({this.count, this.rows});

  TyreBrandData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  int? tyreBrandId;
  String? title;
  String? createdDatetime;
  Null? updatedDatetime;
  int? isDeleted;
  int? isActive;

  Rows(
      {this.tyreBrandId,
        this.title,
        this.createdDatetime,
        this.updatedDatetime,
        this.isDeleted,
        this.isActive});

  Rows.fromJson(Map<String, dynamic> json) {
    tyreBrandId = json['tyre_brand_id'];
    title = json['title'];
    createdDatetime = json['created_datetime'];
    updatedDatetime = json['updated_datetime'];
    isDeleted = json['is_deleted'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tyre_brand_id'] = tyreBrandId;
    data['title'] = title;
    data['created_datetime'] = createdDatetime;
    data['updated_datetime'] = updatedDatetime;
    data['is_deleted'] = isDeleted;
    data['is_active'] = isActive;
    return data;
  }
}
