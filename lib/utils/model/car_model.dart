class CarModel {
  int? statusCode;
  String? message;
  Data? data;

  CarModel({this.statusCode, this.message, this.data});

  CarModel.fromJson(Map<String, dynamic> json) {
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
  CarBrandData? carBrandData;

  Data({this.token, this.carBrandData});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    carBrandData = json['car_brand_data'] != null
        ? CarBrandData.fromJson(json['car_brand_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (carBrandData != null) {
      data['car_brand_data'] = carBrandData!.toJson();
    }
    return data;
  }
}

class CarBrandData {
  int? count;
  List<Rows>? rows;

  CarBrandData({this.count, this.rows});

  CarBrandData.fromJson(Map<String, dynamic> json) {
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
  int? carBrandId;
  String? title;
  String? createdDatetime;
  String? updatedDatetime;
  int? isDeleted;
  int? isActive;

  Rows(
      {this.carBrandId,
        this.title,
        this.createdDatetime,
        this.updatedDatetime,
        this.isDeleted,
        this.isActive});

  Rows.fromJson(Map<String, dynamic> json) {
    carBrandId = json['car_brand_id'];
    title = json['title'];
    createdDatetime = json['created_datetime'];
    updatedDatetime = json['updated_datetime'];
    isDeleted = json['is_deleted'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['car_brand_id'] = carBrandId;
    data['title'] = title;
    data['created_datetime'] = createdDatetime;
    data['updated_datetime'] = updatedDatetime;
    data['is_deleted'] = isDeleted;
    data['is_active'] = isActive;
    return data;
  }
}
