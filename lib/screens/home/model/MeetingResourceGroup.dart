class MeetingResourceGroup {
  String? status;
  String? message;
  List<ResourceResults>? results;

  MeetingResourceGroup({this.status, this.message, this.results});

  MeetingResourceGroup.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['results'] != null) {
      results = <ResourceResults>[];
      json['results'].forEach((v) {
        results!.add(new ResourceResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResourceResults {
  int? id;
  String? resourceGroupCode;
  String? resourceGroupName;
  String? desc;
  int? sortOrder;
  int? status;
  Null? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ResourceResults(
      {this.id,
      this.resourceGroupCode,
      this.resourceGroupName,
      this.desc,
      this.sortOrder,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ResourceResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resourceGroupCode = json['resource_group_code'];
    resourceGroupName = json['resource_group_name'];
    desc = json['desc'];
    sortOrder = json['sort_order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['resource_group_code'] = this.resourceGroupCode;
    data['resource_group_name'] = this.resourceGroupName;
    data['desc'] = this.desc;
    data['sort_order'] = this.sortOrder;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
