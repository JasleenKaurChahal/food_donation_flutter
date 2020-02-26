class NgoListModel {
  int id;
  String name;
  String address;
  NgoListModel(this.id, this.name, this.address);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'name': name, 'address': address};
    return map;
  }

  NgoListModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    address = map['address'];
  }
}
