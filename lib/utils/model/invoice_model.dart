

class InvoiceListModel {
  int? invoiceId;
  int? parentInvoiceId;
  String? invoiceDate;
  String? createdDatetime;
 var finalTotal;
var currentKm;
 var warrentyType;
var warrentyValue;
  String? tyreTypeTitle;
  List<InvoiceDataInner>? invoiceData;

  InvoiceListModel(
      {this.invoiceId,
        this.parentInvoiceId,
        this.invoiceDate,
        this.createdDatetime,
        this.finalTotal,
        this.currentKm,
        this.warrentyType,
        this.warrentyValue,
        this.tyreTypeTitle,
        this.invoiceData
      });

  InvoiceListModel.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoice_id'];
    parentInvoiceId = json['parent_invoice_id'];
    invoiceDate = json['invoice_date'];
    createdDatetime = json['created_datetime'];
    finalTotal = json['final_total'];
    currentKm = json['current_km'];
    warrentyType = json['warrenty_type'];
    warrentyValue = json['warrenty_value'];
    tyreTypeTitle = json['tyre_type_title'];
    if (json['invoice_data'] != null) {
      invoiceData = <InvoiceDataInner>[];
      json['invoice_data'].forEach((v) {
        invoiceData!.add(InvoiceDataInner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice_id'] = invoiceId;
    data['parent_invoice_id'] = parentInvoiceId;
    data['invoice_date'] = invoiceDate;
    data['created_datetime'] = createdDatetime;
    data['final_total'] = finalTotal;
    data['current_km'] = currentKm;
    data['warrenty_type'] = warrentyType;
    data['warrenty_value'] = warrentyValue;
    data['tyre_type_title'] = tyreTypeTitle;
    if (invoiceData != null) {
      data['invoice_data'] = invoiceData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InvoiceDataInner {
  int? invoiceId;
  String? tyreBrandTitle;
  int? count;

  InvoiceDataInner({this.invoiceId, this.tyreBrandTitle, this.count});

  InvoiceDataInner.fromJson(Map<String, dynamic> json) {
    invoiceId = json['invoice_id'];
    tyreBrandTitle = json['tyre_brand_title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['invoice_id'] = invoiceId;
    data['tyre_brand_title'] = tyreBrandTitle;
    data['count'] = count;
    return data;
  }
}
