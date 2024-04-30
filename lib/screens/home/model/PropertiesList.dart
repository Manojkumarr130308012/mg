class PropertiesList {
  String? status;
  String? message;
  Results? results;

  PropertiesList({this.status, this.message, this.results});

  PropertiesList.fromJson(Map<String, dynamic> json) {
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
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Results(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Results.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? propertyName;
  String? pseudoname;
  int? showActualName;
  String? locality;
  int? sortId;
  String? latitude;
  String? longitude;
  int? resourceId;
  String? resourceName;
  int? resourceGroupId;
  String? resourceGroupName;
  City? city;
  LeastPlanPrice? leastPlanPrice;
  List<Images>? images;
  List<PropertyAmenities>? propertyAmenities;
  int? wishList;
  List<Null>? wishListData;

  Data(
      {this.id,
      this.propertyName,
      this.pseudoname,
      this.showActualName,
      this.locality,
      this.sortId,
      this.latitude,
      this.longitude,
      this.resourceId,
      this.resourceName,
      this.resourceGroupId,
      this.resourceGroupName,
      this.city,
      this.leastPlanPrice,
      this.images,
      this.propertyAmenities,
      this.wishList,
      this.wishListData});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyName = json['property_name'];
    pseudoname = json['pseudoname'];
    showActualName = json['show_actual_name'];
    locality = json['locality'];
    sortId = json['sort_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resourceId = json['resource_id'];
    resourceName = json['resource_name'];
    resourceGroupId = json['resource_group_id'];
    resourceGroupName = json['resource_group_name'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    leastPlanPrice = json['least_plan_price'] != null
        ? new LeastPlanPrice.fromJson(json['least_plan_price'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['property_amenities'] != null) {
      propertyAmenities = <PropertyAmenities>[];
      json['property_amenities'].forEach((v) {
        propertyAmenities!.add(new PropertyAmenities.fromJson(v));
      });
    }
    wishList = json['wish_list'];
    if (json['wish_list_data'] != null) {
      wishListData = <Null>[];
      json['wish_list_data'].forEach((v) {
        // wishListData!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_name'] = this.propertyName;
    data['pseudoname'] = this.pseudoname;
    data['show_actual_name'] = this.showActualName;
    data['locality'] = this.locality;
    data['sort_id'] = this.sortId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['resource_id'] = this.resourceId;
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
      // data['wish_list_data'] =
      // this.wishListData!.map((v) => v.toJson()).toList();
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
  Null? isDefault;

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

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
