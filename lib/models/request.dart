class Request {
  String id;
  String quantity;
  String name;
  String recipientName;
  String recipientContact;
  String recipientAddress;
  String recipientID;
  String img;

  Request({this.img, this.recipientName, this.quantity, this.name, this.id, this.recipientAddress, this.recipientContact, this.recipientID});

  Request.fromMap(Map snapshot, String id):
        id = id ?? '',
        quantity = snapshot['quantity'] ?? '',
        name = snapshot['name'] ?? '',
        recipientName = snapshot['recipientName'] ?? '',
        recipientID = snapshot['recipientID'] ?? '',
        recipientContact = snapshot['recipientContact'] ?? '',
        recipientAddress = snapshot['recipientAddress'] ?? '',
        img = snapshot['img'] ?? '';

  toJSON() {
    return {
      "name": name,
      "quantity": quantity,
      "img": img,
      "recipientName" : recipientName,
      "recipientContact": recipientContact,
      "recipientAddress": recipientAddress,
      "recipientID": recipientID,
    };
  }
}