class Favorites {
  String? status;
  String? message;
  List<Results>? results;

  Favorites({this.status, this.message, this.results});

  Favorites.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
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
  String? propertyName;
  String? pseudoname;
  int? showActualName;
  int? sortId;
  String? locality;
  String? resourceName;
  int? resourceGroupId;
  String? resourceGroupName;
  City? city;
  LeastPlanPrice? leastPlanPrice;
  List<Images>? images;
  List<PropertyAmenities>? propertyAmenities;
  int? wishList;
  List<WishListData>? wishListData;

  Results(
      {this.id,
      this.userId,
      this.propertyId,
      this.resourceId,
      this.isMeetingSpace,
      this.isWorkspace,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.propertyName,
      this.pseudoname,
      this.showActualName,
      this.sortId,
      this.locality,
      this.resourceName,
      this.resourceGroupId,
      this.resourceGroupName,
      this.city,
      this.leastPlanPrice,
      this.images,
      this.propertyAmenities,
      this.wishList,
      this.wishListData});

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
    propertyName = json['property_name'];
    pseudoname = json['pseudoname'];
    showActualName = json['show_actual_name'];
    sortId = json['sort_id'];
    locality = json['locality'];
    resourceName = json['resource_name'];
    resourceGroupId = json['resource_group_id'];
    resourceGroupName = json['resource_group_name'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    leastPlanPrice = json['least_plan_price'] != null
        ? new LeastPlanPrice.fromJson(json['least_plan_price'])
        : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['property_amenities'] != null) {
      propertyAmenities = [];
      json['property_amenities'].forEach((v) {
        propertyAmenities!.add(new PropertyAmenities.fromJson(v));
      });
    }
    wishList = json['wish_list'];
    if (json['wish_list_data'] != null) {
      wishListData = [];
      json['wish_list_data'].forEach((v) {
        wishListData!.add(new WishListData.fromJson(v));
      });
    }
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
    data['property_name'] = this.propertyName;
    data['pseudoname'] = this.pseudoname;
    data['show_actual_name'] = this.showActualName;
    data['sort_id'] = this.sortId;
    data['locality'] = this.locality;
    data['resource_name'] = this.resourceName;
    data['resource_group_id'] = this.resourceGroupId;
    data['resource_group_name'] = this.resourceGroupName;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.leastPlanPrice != null) {
      data['least_plan_price'] = this.leastPlanPrice!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.propertyAmenities != null) {
      data['property_amenities'] =
          this.propertyAmenities!.map((v) => v.toJson()).toList();
    }
    data['wish_list'] = this.wishList;
    if (this.wishListData != null) {
      data['wish_list_data'] =
          this.wishListData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  String? name;

  City({this.name});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class LeastPlanPrice {
  int? id;
  String? planName;
  int? price;
  String? requestOnly;
  int? isOnlyRequestBooking;
  String? unit;

  LeastPlanPrice(
      {this.id,
      this.planName,
      this.price,
      this.requestOnly,
      this.isOnlyRequestBooking,
      this.unit});

  LeastPlanPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    price = json['price'];
    requestOnly = json['request_only'];
    isOnlyRequestBooking = json['is_only_request_booking'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plan_name'] = this.planName;
    data['price'] = this.price;
    data['request_only'] = this.requestOnly;
    data['is_only_request_booking'] = this.isOnlyRequestBooking;
    data['unit'] = this.unit;
    return data;
  }
}

class Images {
  String? imagePath;
  int? isDefault;

  Images({this.imagePath, this.isDefault});

  Images.fromJson(Map<String, dynamic> json) {
    imagePath = json['image_path'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_path'] = this.imagePath;
    data['is_default'] = this.isDefault;
    return data;
  }
}

class PropertyAmenities {
  String? amenityName;
  String? iconPath;
  int? status;

  PropertyAmenities({this.amenityName, this.iconPath, this.status});

  PropertyAmenities.fromJson(Map<String, dynamic> json) {
    amenityName = json['amenity_name'];
    iconPath = json['icon_path'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amenity_name'] = this.amenityName;
    data['icon_path'] = this.iconPath;
    data['status'] = this.status;
    return data;
  }
}

class WishListData {
  int? id;
  int? userId;
  int? propertyId;
  int? resourceId;
  int? isMeetingSpace;
  int? isWorkspace;
  int? status;
  String? createdAt;
  String? updatedAt;

  WishListData(
      {this.id,
      this.userId,
      this.propertyId,
      this.resourceId,
      this.isMeetingSpace,
      this.isWorkspace,
      this.status,
      this.createdAt,
      this.updatedAt});

  WishListData.fromJson(Map<String, dynamic> json) {
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
