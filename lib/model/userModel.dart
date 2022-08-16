class UserModel {
  bool? success;
  Payload? payload;
  Null error;

  UserModel({this.success, this.payload, this.error});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Payload {
  String? refresh;
  String? access;
  String? id;

  Payload({this.refresh, this.access, this.id});

  Payload.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    data['id'] = this.id;
    return data;
  }
}