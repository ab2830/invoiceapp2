// class BillDeatilsModel {
//   int? statusCode;
//   String? message;
//   Data? data;
//
//   BillDeatilsModel({this.statusCode, this.message, this.data});
//
//   BillDeatilsModel.fromJson(Map<String, dynamic> json) {
//     statusCode = json['statusCode'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['statusCode'] = statusCode;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? token;
//   InvoiceData? invoiceData;
//
//   Data({this.token, this.invoiceData});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     invoiceData = json['invoiceData'] != null
//         ? InvoiceData.fromJson(json['invoiceData'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['token'] = token;
//     if (invoiceData != null) {
//       data['invoiceData'] = invoiceData!.toJson();
//     }
//     return data;
//   }
// }
//
// class InvoiceData {
//   int? invoiceId;
//   int? parentInvoiceId;
//   int? invoiceType;
//   int? userId;
//   String? userName;
//   int? invoiceNo;
//   String? invoiceDate;
//   String? carNo;
//   var note;
//   int? isGst;
//   int? isAlignmentBalancing;
//   int? tyreTypeId;
//   int? carBrandId;
//   int? currentKm;
//   int? warrentyType;
//   int? warrentyValue;
//   int? subtotal;
//  var finalTotal;
//   String? createdDatetime;
// var updatedDatetime;
//   int? updatedUserId;
//   int? createdUserId;
//   int? isDeleted;
//   int? isReplaceAvailable;
//   TyreType? tyreType;
//   List<InvoiceDataInner>? innerInvoice;
//
//   InvoiceData(
//       {this.invoiceId,
//         this.parentInvoiceId,
//         this.invoiceType,
//         this.userId,
//         this.userName,
//         this.invoiceNo,
//         this.invoiceDate,
//         this.carNo,
//         this.note,
//         this.isGst,
//         this.isAlignmentBalancing,
//         this.tyreTypeId,
//         this.carBrandId,
//         this.currentKm,
//         this.warrentyType,
//         this.warrentyValue,
//         this.subtotal,
//         this.finalTotal,
//         this.createdDatetime,
//         this.updatedDatetime,
//         this.updatedUserId,
//         this.createdUserId,
//         this.isDeleted,
//         this.isReplaceAvailable,
//         this.tyreType,
//         this.innerInvoice});
//
//   InvoiceData.fromJson(Map<String, dynamic> json) {
//     invoiceId = json['invoice_id'];
//     parentInvoiceId = json['parent_invoice_id'];
//     invoiceType = json['invoice_type'];
//     userId = json['user_id'];
//     userName = json['user_name'];
//     invoiceNo = json['invoice_no'];
//     invoiceDate = json['invoice_date'];
//     carNo = json['car_no'];
//     note = json['note'];
//     isGst = json['is_gst'];
//     isAlignmentBalancing = json['is_alignment_balancing'];
//     tyreTypeId = json['tyre_type_id'];
//     carBrandId = json['car_brand_id'];
//     currentKm = json['current_km'];
//     warrentyType = json['warrenty_type'];
//     warrentyValue = json['warrenty_value'];
//     subtotal = json['subtotal'];
//     finalTotal = json['final_total'];
//     createdDatetime = json['created_datetime'];
//     updatedDatetime = json['updated_datetime'];
//     updatedUserId = json['updated_user_id'];
//     createdUserId = json['created_user_id'];
//     isDeleted = json['is_deleted'];
//     isReplaceAvailable = json['is_replace_available'];
//     tyreType = json['tyre_type'] != null
//         ? TyreType.fromJson(json['tyre_type'])
//         : null;
//     if (json['invoice_data'] != null) {
//       innerInvoice = <InvoiceDataInner>[];
//       json['invoice_data'].forEach((v) {
//         innerInvoice!.add(InvoiceDataInner.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['invoice_id'] = invoiceId;
//     data['parent_invoice_id'] = parentInvoiceId;
//     data['invoice_type'] = invoiceType;
//     data['user_id'] = userId;
//     data['user_name'] = userName;
//     data['invoice_no'] = invoiceNo;
//     data['invoice_date'] = invoiceDate;
//     data['car_no'] = carNo;
//     data['note'] = note;
//     data['is_gst'] = isGst;
//     data['is_alignment_balancing'] = isAlignmentBalancing;
//     data['tyre_type_id'] = tyreTypeId;
//     data['car_brand_id'] = carBrandId;
//     data['current_km'] = currentKm;
//     data['warrenty_type'] = warrentyType;
//     data['warrenty_value'] = warrentyValue;
//     data['subtotal'] = subtotal;
//     data['final_total'] = finalTotal;
//     data['created_datetime'] = createdDatetime;
//     data['updated_datetime'] = updatedDatetime;
//     data['updated_user_id'] = updatedUserId;
//     data['created_user_id'] = createdUserId;
//     data['is_deleted'] = isDeleted;
//     data['is_replace_available'] = isReplaceAvailable;
//     if (tyreType != null) {
//       data['tyre_type'] = tyreType!.toJson();
//     }
//     if (innerInvoice != null) {
//       data['invoice_data'] = innerInvoice!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class TyreType {
//   int? tyreTypeId;
//   String? title;
//   int? width;
//   int? aspectRatio;
//   String? construction;
//   int? rimDiamete;
//   String? speedRating;
//   int? loadRating;
//   String? createdDatetime;
// var updatedDatetime;
//   int? isDeleted;
//   int? isActive;
//
//   TyreType(
//       {this.tyreTypeId,
//         this.title,
//         this.width,
//         this.aspectRatio,
//         this.construction,
//         this.rimDiamete,
//         this.speedRating,
//         this.loadRating,
//         this.createdDatetime,
//         this.updatedDatetime,
//         this.isDeleted,
//         this.isActive});
//
//   TyreType.fromJson(Map<String, dynamic> json) {
//     tyreTypeId = json['tyre_type_id'];
//     title = json['title'];
//     width = json['width'];
//     aspectRatio = json['aspect_ratio'];
//     construction = json['construction'];
//     rimDiamete = json['rim_diamete'];
//     speedRating = json['speed_rating'];
//     loadRating = json['load_rating'];
//     createdDatetime = json['created_datetime'];
//     updatedDatetime = json['updated_datetime'];
//     isDeleted = json['is_deleted'];
//     isActive = json['is_active'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['tyre_type_id'] = tyreTypeId;
//     data['title'] = title;
//     data['width'] = width;
//     data['aspect_ratio'] = aspectRatio;
//     data['construction'] = construction;
//     data['rim_diamete'] = rimDiamete;
//     data['speed_rating'] = speedRating;
//     data['load_rating'] = loadRating;
//     data['created_datetime'] = createdDatetime;
//     data['updated_datetime'] = updatedDatetime;
//     data['is_deleted'] = isDeleted;
//     data['is_active'] = isActive;
//     return data;
//   }
// }
//
// class InvoiceDataInner {
//   int? iInvoiceItemId;
//   int? parentInvoiceItemId;
//   int? invoiceId;
//   int? itemType;
//   int? tyreBrandId;
//   int? price;
//   int? total;
//   var childData;
//   TyreBrand? tyreBrand;
//
//   InvoiceDataInner(
//       {this.iInvoiceItemId,
//         this.parentInvoiceItemId,
//         this.invoiceId,
//         this.itemType,
//         this.tyreBrandId,
//         this.price,
//         this.total,
//         this.childData,
//         this.tyreBrand});
//
//   InvoiceDataInner.fromJson(Map<String, dynamic> json) {
//     iInvoiceItemId = json['_invoice_item_id'];
//     parentInvoiceItemId = json['parent_invoice_item_id'];
//     invoiceId = json['invoice_id'];
//     itemType = json['item_type'];
//     tyreBrandId = json['tyre_brand_id'];
//     price = json['price'];
//     total = json['total'];
//     childData = json['child_data'];
//     tyreBrand = json['tyre_brand'] != null
//         ? TyreBrand.fromJson(json['tyre_brand'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_invoice_item_id'] = iInvoiceItemId;
//     data['parent_invoice_item_id'] = parentInvoiceItemId;
//     data['invoice_id'] = invoiceId;
//     data['item_type'] = itemType;
//     data['tyre_brand_id'] = tyreBrandId;
//     data['price'] = price;
//     data['total'] = total;
//     data['child_data'] = childData;
//     if (tyreBrand != null) {
//       data['tyre_brand'] = tyreBrand!.toJson();
//     }
//     return data;
//   }
// }
//
// class TyreBrand {
//   int? tyreBrandId;
//   String? title;
//   String? createdDatetime;
//  var updatedDatetime;
//   int? isDeleted;
//   int? isActive;
//
//   TyreBrand(
//       {this.tyreBrandId,
//         this.title,
//         this.createdDatetime,
//         this.updatedDatetime,
//         this.isDeleted,
//         this.isActive});
//
//   TyreBrand.fromJson(Map<String, dynamic> json) {
//     tyreBrandId = json['tyre_brand_id'];
//     title = json['title'];
//     createdDatetime = json['created_datetime'];
//     updatedDatetime = json['updated_datetime'];
//     isDeleted = json['is_deleted'];
//     isActive = json['is_active'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['tyre_brand_id'] = tyreBrandId;
//     data['title'] = title;
//     data['created_datetime'] = createdDatetime;
//     data['updated_datetime'] = updatedDatetime;
//     data['is_deleted'] = isDeleted;
//     data['is_active'] = isActive;
//     return data;
//   }
// }

class BillDeatilsModel {
  int? statusCode;
  String? message;
  Data? data;

  BillDeatilsModel({this.statusCode, this.message, this.data});

  BillDeatilsModel.fromJson(Map<String, dynamic> json) {
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
  InvoiceData? invoiceData;

  Data({this.token, this.invoiceData});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    invoiceData = json['invoiceData'] != null
        ? new InvoiceData.fromJson(json['invoiceData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.invoiceData != null) {
      data['invoiceData'] = this.invoiceData!.toJson();
    }
    return data;
  }
}

class InvoiceData {
  int? invoiceId;
  int? parentInvoiceId;
  int? invoiceType;
  int? userId;
  String? userName;
  int? invoiceNo;
  String? invoiceDate;
  String? carNo;
var note;
  int? isGst;
  int? isAlignmentBalancing;
  int? tyreTypeId;
  int? carBrandId;
  int? currentKm;
  int? warrentyType;
  int? warrentyValue;
var subtotal;
var finalTotal;
 var
 createdDatetime;
  var updatedDatetime;
  int? updatedUserId;
  int? createdUserId;
  int? isDeleted;
  int? isReplaceAvailable;
  TyreType? tyreType;
  CarBrand? carBrand;
  List<InvoiceDataInner>? innerInvoice;

  InvoiceData(
      {this.invoiceId,
        this.parentInvoiceId,
        this.invoiceType,
        this.userId,
        this.userName,
        this.invoiceNo,
        this.invoiceDate,
        this.carNo,
        this.note,
        this.isGst,
        this.isAlignmentBalancing,
        this.tyreTypeId,
        this.carBrandId,
        this.currentKm,
        this.warrentyType,
        this.warrentyValue,
        this.subtotal,
        this.finalTotal,
        this.createdDatetime,
        this.updatedDatetime,
        this.updatedUserId,
        this.createdUserId,
        this.isDeleted,
        this.isReplaceAvailable,
        this.tyreType,
        this.carBrand,
        this.innerInvoice});

  InvoiceData.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoice_id'];
    parentInvoiceId = json['parent_invoice_id'];
    invoiceType = json['invoice_type'];
    userId = json['user_id'];
    userName = json['user_name'];
    invoiceNo = json['invoice_no'];
    invoiceDate = json['invoice_date'];
    carNo = json['car_no'];
    note = json['note'];
    isGst = json['is_gst'];
    isAlignmentBalancing = json['is_alignment_balancing'];
    tyreTypeId = json['tyre_type_id'];
    carBrandId = json['car_brand_id'];
    currentKm = json['current_km'];
    warrentyType = json['warrenty_type'];
    warrentyValue = json['warrenty_value'];
    subtotal = json['subtotal'];
    finalTotal = json['final_total'];
    createdDatetime = json['created_datetime'];
    updatedDatetime = json['updated_datetime'];
    updatedUserId = json['updated_user_id'];
    createdUserId = json['created_user_id'];
    isDeleted = json['is_deleted'];
    isReplaceAvailable = json['is_replace_available'];
    tyreType = json['tyre_type'] != null
        ? new TyreType.fromJson(json['tyre_type'])
        : null;
    carBrand = json['car_brand'] != null
        ? new CarBrand.fromJson(json['car_brand'])
        : null;
    if (json['invoice_data'] != null) {
      innerInvoice = <InvoiceDataInner>[];
      json['invoice_data'].forEach((v) {
        innerInvoice!.add(new InvoiceDataInner
            .fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_id'] = this.invoiceId;
    data['parent_invoice_id'] = this.parentInvoiceId;
    data['invoice_type'] = this.invoiceType;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['invoice_no'] = this.invoiceNo;
    data['invoice_date'] = this.invoiceDate;
    data['car_no'] = this.carNo;
    data['note'] = this.note;
    data['is_gst'] = this.isGst;
    data['is_alignment_balancing'] = this.isAlignmentBalancing;
    data['tyre_type_id'] = this.tyreTypeId;
    data['car_brand_id'] = this.carBrandId;
    data['current_km'] = this.currentKm;
    data['warrenty_type'] = this.warrentyType;
    data['warrenty_value'] = this.warrentyValue;
    data['subtotal'] = this.subtotal;
    data['final_total'] = this.finalTotal;
    data['created_datetime'] = this.createdDatetime;
    data['updated_datetime'] = this.updatedDatetime;
    data['updated_user_id'] = this.updatedUserId;
    data['created_user_id'] = this.createdUserId;
    data['is_deleted'] = this.isDeleted;
    data['is_replace_available'] = this.isReplaceAvailable;
    if (this.tyreType != null) {
      data['tyre_type'] = this.tyreType!.toJson();
    }
    if (this.carBrand != null) {
      data['car_brand'] = this.carBrand!.toJson();
    }
    if (this.innerInvoice != null) {
      data['invoice_data'] = this.innerInvoice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TyreType {
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

  TyreType(
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

  TyreType.fromJson(Map<String, dynamic> json) {
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

class CarBrand {
  int? carBrandId;
  String? title;
  String? createdDatetime;
  Null? updatedDatetime;
  int? isDeleted;
  int? isActive;

  CarBrand(
      {this.carBrandId,
        this.title,
        this.createdDatetime,
        this.updatedDatetime,
        this.isDeleted,
        this.isActive});

  CarBrand.fromJson(Map<String, dynamic> json) {
    carBrandId = json['car_brand_id'];
    title = json['title'];
    createdDatetime = json['created_datetime'];
    updatedDatetime = json['updated_datetime'];
    isDeleted = json['is_deleted'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_brand_id'] = this.carBrandId;
    data['title'] = this.title;
    data['created_datetime'] = this.createdDatetime;
    data['updated_datetime'] = this.updatedDatetime;
    data['is_deleted'] = this.isDeleted;
    data['is_active'] = this.isActive;
    return data;
  }
}

class InvoiceDataInner {
  int? iInvoiceItemId;
  int? parentInvoiceItemId;
  int? invoiceId;
  int? itemType;
  int? tyreBrandId;
  int? price;
  int? total;
  ChildData? childData;
  TyreBrand? tyreBrand;

  InvoiceDataInner(
      {this.iInvoiceItemId,
        this.parentInvoiceItemId,
        this.invoiceId,
        this.itemType,
        this.tyreBrandId,
        this.price,
        this.total,
        this.childData,
        this.tyreBrand});

  InvoiceDataInner.fromJson(Map<String, dynamic> json) {
    iInvoiceItemId = json['_invoice_item_id'];
    parentInvoiceItemId = json['parent_invoice_item_id'];
    invoiceId = json['invoice_id'];
    itemType = json['item_type'];
    tyreBrandId = json['tyre_brand_id'];
    price = json['price'];
    total = json['total'];
    childData = json['child_data'] != null
        ? new ChildData.fromJson(json['child_data'])
        : null;
    tyreBrand = json['tyre_brand'] != null
        ? new TyreBrand.fromJson(json['tyre_brand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_invoice_item_id'] = this.iInvoiceItemId;
    data['parent_invoice_item_id'] = this.parentInvoiceItemId;
    data['invoice_id'] = this.invoiceId;
    data['item_type'] = this.itemType;
    data['tyre_brand_id'] = this.tyreBrandId;
    data['price'] = this.price;
    data['total'] = this.total;
    if (this.childData != null) {
      data['child_data'] = this.childData!.toJson();
    }
    if (this.tyreBrand != null) {
      data['tyre_brand'] = this.tyreBrand!.toJson();
    }
    return data;
  }
}

class ChildData {
  int? iInvoiceItemId;
  int? parentInvoiceItemId;
  int? invoiceId;
  int? itemType;
  int? tyreBrandId;
  int? price;
  int? total;
  TyreBrand? tyreBrand;

  ChildData(
      {this.iInvoiceItemId,
        this.parentInvoiceItemId,
        this.invoiceId,
        this.itemType,
        this.tyreBrandId,
        this.price,
        this.total,
        this.tyreBrand});

  ChildData.fromJson(Map<String, dynamic> json) {
    iInvoiceItemId = json['_invoice_item_id'];
    parentInvoiceItemId = json['parent_invoice_item_id'];
    invoiceId = json['invoice_id'];
    itemType = json['item_type'];
    tyreBrandId = json['tyre_brand_id'];
    price = json['price'];
    total = json['total'];
    tyreBrand = json['tyre_brand'] != null
        ? new TyreBrand.fromJson(json['tyre_brand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_invoice_item_id'] = this.iInvoiceItemId;
    data['parent_invoice_item_id'] = this.parentInvoiceItemId;
    data['invoice_id'] = this.invoiceId;
    data['item_type'] = this.itemType;
    data['tyre_brand_id'] = this.tyreBrandId;
    data['price'] = this.price;
    data['total'] = this.total;
    if (this.tyreBrand != null) {
      data['tyre_brand'] = this.tyreBrand!.toJson();
    }
    return data;
  }
}

class TyreBrand {
  int? tyreBrandId;
  String? title;
  String? createdDatetime;
  Null? updatedDatetime;
  int? isDeleted;
  int? isActive;

  TyreBrand({this.tyreBrandId,
    this.title,
    this.createdDatetime,
    this.updatedDatetime,
    this.isDeleted,
    this.isActive});

  TyreBrand.fromJson(Map<String, dynamic> json) {
    tyreBrandId = json['tyre_brand_id'];
    title = json['title'];
    createdDatetime = json['created_datetime'];
    updatedDatetime = json['updated_datetime'];
    isDeleted = json['is_deleted'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tyre_brand_id'] = this.tyreBrandId;
    data['title'] = this.title;
    data['created_datetime'] = this.createdDatetime;
    data['updated_datetime'] = this.updatedDatetime;
    data['is_deleted'] = this.isDeleted;
    data['is_active'] = this.isActive;
    return data;
  }
}
// }
// #"C:\Users\Ankit\Desktop\clone\keystore_nav.jks"
// keytool -list -v -keystore C:\Users\Ankit\Desktop\clone\keystore_nav.jks -alias nav
