

class DashboardStat {
  String? token;
  int? totalInvoice;
var totalRevenue;
  var tyreRevenue;
  var replaceTyreRevenue;

  DashboardStat(
      {this.token,
        this.totalInvoice,
        this.totalRevenue,
        this.tyreRevenue,
        this.replaceTyreRevenue});

  DashboardStat.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    totalInvoice = json['total_invoice'];
    totalRevenue = json['total_revenue'];
    tyreRevenue = json['tyre_revenue'];
    replaceTyreRevenue = json['replace_tyre_revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    data['total_invoice'] = totalInvoice;
    data['total_revenue'] = totalRevenue;
    data['tyre_revenue'] = tyreRevenue;
    data['replace_tyre_revenue'] = replaceTyreRevenue;
    return data;
  }
}
