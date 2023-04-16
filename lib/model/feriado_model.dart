class Feriado {
  late String date;
  late String name;
  late String type;

  Feriado({
    required this.date,
    required this.name,
    required this.type,
  });

  factory Feriado.fromJson(Map<String, dynamic> json) {
    return Feriado(
      date: json['date'],
      name: json['name'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}
