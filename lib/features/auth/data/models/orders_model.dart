class DatabaseOrdersModel {
  String? id;
  DateTime? createdAt;
  String? sellerId;
  String? customername;
  String? customerPhone;
  String? shippingaddress;
  double? ordertotal;
  String? status;
  String? paymentstatus;
  String? notes;
  DateTime? expectedDeliveryDate;

  DatabaseOrdersModel({
    this.id,
    this.createdAt,
    this.sellerId,
    this.customername,
    this.customerPhone,
    this.shippingaddress,
    this.ordertotal,
    this.status,
    this.paymentstatus,
    this.notes,
    this.expectedDeliveryDate,
  });

  factory DatabaseOrdersModel.fromJson(Map<String, dynamic> order) {
    return DatabaseOrdersModel(
      id: order['id'],
      createdAt: DateTime.parse(order['created_at']),
      sellerId: order['seller_id'],
      customerPhone: order['customer_phone'],
      customername: order['customer_name'],
      shippingaddress: order['shipping_address'],
      ordertotal: order['order_total'],
      status: order['status'],
      paymentstatus: order['payment_status'],
      notes: order['notes'],
      expectedDeliveryDate: DateTime.parse(order['expected_delivery_date']),
    );
  }
}
