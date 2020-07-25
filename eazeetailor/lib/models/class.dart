class OutfitDetails {
  String title, desc;
  List <String> imgurl;

  OutfitDetails(this.title, this.desc, this.imgurl);
}

class Members {
  String id;
  String name;
  double sleeve;
  double chest;
  double body;

  Members ({this.id, this.name, this.sleeve, this.chest,this.body});
  Members.copy(Members from) : this(id: from.id, name: from.name, sleeve: from.sleeve, body: from.body, chest: from.chest);
  Members.fromJson(Map<String, dynamic> json)
    : this(
      id: json['id'], 
      name: json['name'], 
      sleeve: json['sleeve'].toDouble(), 
      chest: json['chest'].toDouble(), 
      body: json['body'].toDouble()
    );
  Map<String, dynamic> toJson() =>
    {'id': id, 'name': name, 'sleeve': sleeve, 'chest': chest, 'body': body};
}

class Order{
  String id;
  String design;
  String size;
  String fabric;

  Order({this.id, this.design, this.size, this.fabric});
  Order.fromJson(Map<String, dynamic> json)
    : this(
      id: json['id'], 
      design: json['design'], 
      size: json['size'], 
      fabric: json['fabric'], 
    );
  Map<String, dynamic> toJson() =>
    {'id': id, 'design': design, 'size': size, 'fabric': fabric};
}

class Appointment{
  String id;
  String date;
  String time;

  Appointment({this.id, this.date, this.time});
 Appointment.fromJson(Map<String, dynamic> json)
    : this(
      id: json['id'], 
      date: json['date'].toString(), 
      time: json['time'].toString(), 
    );
  Map<String, dynamic> toJson() =>
    {'id': id, 'date': date, 'time': time};
}

class User{
  
  String name;
  String address;
  String phone;
  String email;

  User({this.name, this.address, this.phone, this.email});
  User.fromJson(Map<String, dynamic> json)
    : this(
      name: json['name'].toString(), 
      address: json['address'].toString(), 
      phone: json['phone'].toString(), 
      email: json['email'].toString(), 
    );
  Map<String, dynamic> toJson() =>
    {'name': name, 'address': address, 'phone': phone, 'email': email};
}
