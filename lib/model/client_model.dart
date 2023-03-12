class ClientModel {
  Meta? meta;
  List<ClientPojo>? data;

  ClientModel({this.meta, this.data});

  ClientModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <ClientPojo>[];
      json['data'].forEach((v) {
        data!.add( ClientPojo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  String? responseCode;
  String? message;
  String? total;
  String? limit;

  Meta({this.responseCode, this.message, this.total, this.limit});

  Meta.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    total = json['total'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    data['total'] = this.total;
    data['limit'] = this.limit;
    return data;
  }
}

class ClientPojo {
  int? id;
  String? name;
  String? phone;
  String? email;

  ClientPojo({this.id, this.name, this.phone, this.email});

  ClientPojo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}
