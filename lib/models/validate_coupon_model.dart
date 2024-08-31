class ValidateCouponModel {
  bool? isvalid;
  String? couponCode;
  String? discount;
  String? discountType;
  String? discountAmount;
  String? finalAmount;

  ValidateCouponModel(
      {this.isvalid,
        this.couponCode,
        this.discount,
        this.discountType,
        this.discountAmount,
        this.finalAmount});

  ValidateCouponModel.fromJson(Map<String, dynamic> json) {
    isvalid = json['isvalid'];
    couponCode = json['couponCode'];
    discount = json['discount'];
    discountType = json['discountType'];
    discountAmount = json['discountAmount'];
    finalAmount = json['finalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isvalid'] = this.isvalid;
    data['couponCode'] = this.couponCode;
    data['discount'] = this.discount;
    data['discountType'] = this.discountType;
    data['discountAmount'] = this.discountAmount;
    data['finalAmount'] = this.finalAmount;
    return data;
  }
}
