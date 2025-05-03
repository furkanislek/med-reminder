class MedicineModel {
  final String id;
  final String name;
  final List<String> doseTime;
  final int amount;
  final int duration;
  final String withFood;
  final int quantity;
  final String unit;

  MedicineModel({
    required this.id,
    required this.name,
    required this.doseTime,
    required this.amount,
    required this.duration,
    required this.withFood,
    required this.quantity,
    required this.unit,
  });

  factory MedicineModel.fromMap(String id, Map<String, dynamic> data) {
    return MedicineModel(
      id: id,
      name: data['name'],
      doseTime: List<String>.from(data['doseTime']),
      amount: data['amount'],
      duration: data['duration'],
      withFood: data['withFood'],
      quantity: data['quantity'],
      unit: data['unit'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'doseTime': doseTime,
      'amount': amount,
      'duration': duration,
      'withFood': withFood,
      'quantity': quantity,
      'unit': unit,
    };
  }
}
