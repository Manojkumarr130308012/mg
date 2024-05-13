class Favourite {
  String? status;
  String? message;
  Results? results;

  Favourite({this.status, this.message, this.results});

  Favourite.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  int? id;
  int? userId;
  int? propertyId;
  int? resourceId;
  int? isMeetingSpace;
  int? isWorkspace;
  int? status;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.id,
      this.userId,
      this.propertyId,
      this.resourceId,
      this.isMeetingSpace,
      this.isWorkspace,
      this.status,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    resourceId = json['resource_id'];
    isMeetingSpace = json['is_meeting_space'];
    isWorkspace = json['is_workspace'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['property_id'] = this.propertyId;
    data['resource_id'] = this.resourceId;
    data['is_meeting_space'] = this.isMeetingSpace;
    data['is_workspace'] = this.isWorkspace;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
