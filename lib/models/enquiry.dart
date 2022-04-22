/// name : "mohanish"
/// email : "mohanishp1@gmail.com"
/// phone_number : "+918128912111"

class Enquiry {
  Enquiry({
      String? name, 
      String? email, 
      String? phoneNumber,}){
    _name = name;
    _email = email;
    _phoneNumber = phoneNumber;
}

  Enquiry.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
  }
  String? _name;
  String? _email;
  String? _phoneNumber;
Enquiry copyWith({  String? name,
  String? email,
  String? phoneNumber,
}) => Enquiry(  name: name ?? _name,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
);
  String? get name => _name;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "email:$email";
  }

}