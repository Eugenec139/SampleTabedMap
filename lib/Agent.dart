class Agent {

  String name;
  String phone;
  String email;
  String photo;
  String address;

  Agent({
    this.name,
    this.phone,
    this.email,
    this.photo,
    this.address,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photo :json['photo'],
      address:json['address'],

    );
  }
}