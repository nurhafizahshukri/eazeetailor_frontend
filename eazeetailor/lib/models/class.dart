class OutfitDetails {
  String title, desc;
  List <String> imgurl;

  OutfitDetails(this.title, this.desc, this.imgurl);
}

class Size {
  double sleeve;
  double chest;
  double body;

  Size(this.body,this.chest,this.sleeve);
  Size.copy(Size from) : this(from.body,from.chest,from.sleeve);
}

class Members {
  String name;
  Size sizes;

  Members(this.name, this.sizes);
  Members.copy(Members from) : this(from.name, from.sizes);
}

class Order{
  String design;
  String size;
  String fabric;

  Order(this.design, this.size, this.fabric);
  Order.copy(Order from) : this(from.design, from.size, from.fabric);
}

class Appointment{
  String date;
  String time;

  Appointment(this.date, this.time);
  Appointment.copy(Appointment from) : this(from.date, from.time);
}
