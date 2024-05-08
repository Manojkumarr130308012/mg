class PropertyDetailsInfo {
  String? status;
  String? message;
  List<Results>? results;

  PropertyDetailsInfo({this.status, this.message, this.results});

  PropertyDetailsInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['results'] != null) {
      results = <Results>[];
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
  String? propertyName;
  int? providerId;
  String? pseudoname;
  String? locality;
  String? shortDesc;
  String? longDesc;
  String? latitude;
  String? longitude;
  String? startAt;
  String? endAt;
  String? address1;
  String? address2;
  Null? contactNo;
  String? mobileNo;
  int? propertyTypeId;
  int? resourceId;
  String? resourceName;
  City? city;
  LeastPlanPrice? leastPlanPrice;
  List<PropertyImages>? propertyImages;
  List<ResourceImages>? resourceImages;
  List<PropertyTimings>? propertyTimings;
  List<PropertyAmenities>? propertyAmenities;
  List<Resources>? resources;
  List<ResourcePlan>? resourcePlan;
  TermsConditionsDoc? termsConditionsDoc;
  TermsConditionsDoc? cancellationPolicyDoc;
  List<Null>? discountsCoupons;

  Results(
      {this.id,
      this.propertyName,
      this.providerId,
      this.pseudoname,
      this.locality,
      this.shortDesc,
      this.longDesc,
      this.latitude,
      this.longitude,
      this.startAt,
      this.endAt,
      this.address1,
      this.address2,
      this.contactNo,
      this.mobileNo,
      this.propertyTypeId,
      this.resourceId,
      this.resourceName,
      this.city,
      this.leastPlanPrice,
      this.propertyImages,
      this.resourceImages,
      this.propertyTimings,
      this.propertyAmenities,
      this.resources,
      this.resourcePlan,
      this.termsConditionsDoc,
      this.cancellationPolicyDoc,
      this.discountsCoupons});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyName = json['property_name'];
    providerId = json['provider_id'];
    pseudoname = json['pseudoname'];
    locality = json['locality'];
    shortDesc = json['short_desc'];
    longDesc = json['long_desc'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    startAt = json['start_at'];
    endAt = json['end_at'];
    address1 = json['address1'];
    address2 = json['address2'];
    contactNo = json['contact_no'];
    mobileNo = json['mobile_no'];
    propertyTypeId = json['property_type_id'];
    resourceId = json['resource_id'];
    resourceName = json['resource_name'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    leastPlanPrice = json['least_plan_price'] != null
        ? new LeastPlanPrice.fromJson(json['least_plan_price'])
        : null;
    if (json['property_images'] != null) {
      propertyImages = <PropertyImages>[];
      json['property_images'].forEach((v) {
        propertyImages!.add(new PropertyImages.fromJson(v));
      });
    }
    if (json['resource_images'] != null) {
      resourceImages = <ResourceImages>[];
      json['resource_images'].forEach((v) {
        resourceImages!.add(new ResourceImages.fromJson(v));
      });
    }
    if (json['property_timings'] != null) {
      propertyTimings = <PropertyTimings>[];
      json['property_timings'].forEach((v) {
        propertyTimings!.add(new PropertyTimings.fromJson(v));
      });
    }
    if (json['property_amenities'] != null) {
      propertyAmenities = <PropertyAmenities>[];
      json['property_amenities'].forEach((v) {
        propertyAmenities!.add(new PropertyAmenities.fromJson(v));
      });
    }
    if (json['resources'] != null) {
      resources = <Resources>[];
      json['resources'].forEach((v) {
        resources!.add(new Resources.fromJson(v));
      });
    }
    if (json['resource_plan'] != null) {
      resourcePlan = <ResourcePlan>[];
      json['resource_plan'].forEach((v) {
        resourcePlan!.add(new ResourcePlan.fromJson(v));
      });
    }
    termsConditionsDoc = json['terms_conditions_doc'] != null
        ? new TermsConditionsDoc.fromJson(json['terms_conditions_doc'])
        : null;
    cancellationPolicyDoc = json['cancellation_policy_doc'] != null
        ? new TermsConditionsDoc.fromJson(json['cancellation_policy_doc'])
        : null;
    // if (json['discounts_coupons'] != null) {
    //   discountsCoupons = <Null>[];
    //   json['discounts_coupons'].forEach((v) {
    //     discountsCoupons!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_name'] = this.propertyName;
    data['provider_id'] = this.providerId;
    data['pseudoname'] = this.pseudoname;
    data['locality'] = this.locality;
    data['short_desc'] = this.shortDesc;
    data['long_desc'] = this.longDesc;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['start_at'] = this.startAt;
    data['end_at'] = this.endAt;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['contact_no'] = this.contactNo;
    data['mobile_no'] = this.mobileNo;
    data['property_type_id'] = this.propertyTypeId;
    data['resource_id'] = this.resourceId;
    data['resource_name'] = this.resourceName;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.leastPlanPrice != null) {
      data['least_plan_price'] = this.leastPlanPrice!.toJson();
    }
    if (this.propertyImages != null) {
      data['property_images'] =
          this.propertyImages!.map((v) => v.toJson()).toList();
    }
    if (this.resourceImages != null) {
      data['resource_images'] =
          this.resourceImages!.map((v) => v.toJson()).toList();
    }
    if (this.propertyTimings != null) {
      data['property_timings'] =
          this.propertyTimings!.map((v) => v.toJson()).toList();
    }
    if (this.propertyAmenities != null) {
      data['property_amenities'] =
          this.propertyAmenities!.map((v) => v.toJson()).toList();
    }
    if (this.resources != null) {
      data['resources'] = this.resources!.map((v) => v.toJson()).toList();
    }
    if (this.resourcePlan != null) {
      data['resource_plan'] =
          this.resourcePlan!.map((v) => v.toJson()).toList();
    }
    if (this.termsConditionsDoc != null) {
      data['terms_conditions_doc'] = this.termsConditionsDoc!.toJson();
    }
    if (this.cancellationPolicyDoc != null) {
      data['cancellation_policy_doc'] = this.cancellationPolicyDoc!.toJson();
    }
    // if (this.discountsCoupons != null) {
    //   data['discounts_coupons'] =
    //       this.discountsCoupons!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class DiscountCoupon {
  String code;
  int discount;

  DiscountCoupon({required this.code, required this.discount});

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'discount': discount,
    };
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
  int? price;
  String? requestOnly;
  int? isOnlyRequestBooking;
  String? unit;

  LeastPlanPrice(
      {this.price, this.requestOnly, this.isOnlyRequestBooking, this.unit});

  LeastPlanPrice.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    requestOnly = json['request_only'];
    isOnlyRequestBooking = json['is_only_request_booking'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['request_only'] = this.requestOnly;
    data['is_only_request_booking'] = this.isOnlyRequestBooking;
    data['unit'] = this.unit;
    return data;
  }
}

class PropertyImages {
  int? id;
  int? propertyId;
  String? imagePath;
  String? thumbnailPath;
  String? imageOrder;
  int? status;
  int? isDefault;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  PropertyImages(
      {this.id,
      this.propertyId,
      this.imagePath,
      this.thumbnailPath,
      this.imageOrder,
      this.status,
      this.isDefault,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PropertyImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    imagePath = json['image_path'];
    thumbnailPath = json['thumbnail_path'];
    imageOrder = json['image_order'];
    status = json['status'];
    isDefault = json['is_default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['image_path'] = this.imagePath;
    data['thumbnail_path'] = this.thumbnailPath;
    data['image_order'] = this.imageOrder;
    data['status'] = this.status;
    data['is_default'] = this.isDefault;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class ResourceImages {
  int? id;
  int? resourceId;
  String? imagePath;
  String? thumbnailPath;
  String? imageOrder;
  Null? isDefault;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ResourceImages(
      {this.id,
      this.resourceId,
      this.imagePath,
      this.thumbnailPath,
      this.imageOrder,
      this.isDefault,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ResourceImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resourceId = json['resource_id'];
    imagePath = json['image_path'];
    thumbnailPath = json['thumbnail_path'];
    imageOrder = json['image_order'];
    isDefault = json['is_default'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['resource_id'] = this.resourceId;
    data['image_path'] = this.imagePath;
    data['thumbnail_path'] = this.thumbnailPath;
    data['image_order'] = this.imageOrder;
    data['is_default'] = this.isDefault;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class PropertyTimings {
  int? id;
  int? propertyId;
  int? dayCode;
  String? dayId;
  int? isOpen;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  PropertyTimings(
      {this.id,
      this.propertyId,
      this.dayCode,
      this.dayId,
      this.isOpen,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PropertyTimings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    dayCode = json['day_code'];
    dayId = json['day_id'];
    isOpen = json['is_open'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['day_code'] = this.dayCode;
    data['day_id'] = this.dayId;
    data['is_open'] = this.isOpen;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class PropertyAmenities {
  int? id;
  int? propertyId;
  int? amenityId;
  String? paidUnits;
  String? feePerUnit;
  int? isPaid;
  int? status;
  int? isDraft;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? amenityName;
  String? iconPath;

  PropertyAmenities(
      {this.id,
      this.propertyId,
      this.amenityId,
      this.paidUnits,
      this.feePerUnit,
      this.isPaid,
      this.status,
      this.isDraft,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.amenityName,
      this.iconPath});

  PropertyAmenities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    amenityId = json['amenity_id'];
    paidUnits = json['paid_units'];
    feePerUnit = json['fee_per_unit'];
    isPaid = json['is_paid'];
    status = json['status'];
    isDraft = json['is_draft'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    amenityName = json['amenity_name'];
    iconPath = json['icon_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['amenity_id'] = this.amenityId;
    data['paid_units'] = this.paidUnits;
    data['fee_per_unit'] = this.feePerUnit;
    data['is_paid'] = this.isPaid;
    data['status'] = this.status;
    data['is_draft'] = this.isDraft;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['amenity_name'] = this.amenityName;
    data['icon_path'] = this.iconPath;
    return data;
  }
}

class Resources {
  int? id;
  int? propertyId;
  int? resourceGroupId;
  String? resourceName;
  String? resourceCode;
  String? description;
  int? quantity;
  int? capacity;
  int? sortId;
  int? isMeetingConfRoom;
  int? isOnlyAdminBooking;
  int? isOnlyRequestBooking;
  int? status;
  Null? propertyCode;
  int? isDraft;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<ResourcePaths>? resourceImages;

  Resources(
      {this.id,
      this.propertyId,
      this.resourceGroupId,
      this.resourceName,
      this.resourceCode,
      this.description,
      this.quantity,
      this.capacity,
      this.sortId,
      this.isMeetingConfRoom,
      this.isOnlyAdminBooking,
      this.isOnlyRequestBooking,
      this.status,
      this.propertyCode,
      this.isDraft,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.resourceImages});

  Resources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    resourceGroupId = json['resource_group_id'];
    resourceName = json['resource_name'];
    resourceCode = json['resource_code'];
    description = json['description'];
    quantity = json['quantity'];
    capacity = json['capacity'];
    sortId = json['sort_id'];
    isMeetingConfRoom = json['is_meeting_conf_room'];
    isOnlyAdminBooking = json['is_only_admin_booking'];
    isOnlyRequestBooking = json['is_only_request_booking'];
    status = json['status'];
    propertyCode = json['property_code'];
    isDraft = json['is_draft'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['resource_images'] != null) {
      resourceImages = <ResourcePaths>[];
      json['resource_images'].forEach((v) {
        resourceImages!.add(new ResourcePaths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['resource_group_id'] = this.resourceGroupId;
    data['resource_name'] = this.resourceName;
    data['resource_code'] = this.resourceCode;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['capacity'] = this.capacity;
    data['sort_id'] = this.sortId;
    data['is_meeting_conf_room'] = this.isMeetingConfRoom;
    data['is_only_admin_booking'] = this.isOnlyAdminBooking;
    data['is_only_request_booking'] = this.isOnlyRequestBooking;
    data['status'] = this.status;
    data['property_code'] = this.propertyCode;
    data['is_draft'] = this.isDraft;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.resourceImages != null) {
      data['resource_images'] =
          this.resourceImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResourcePaths {
  String? imagePath;

  ResourcePaths({this.imagePath});

  ResourcePaths.fromJson(Map<String, dynamic> json) {
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_path'] = this.imagePath;
    return data;
  }
}

class ResourcePlan {
  int? id;
  int? propertyId;
  int? resourceId;
  int? planForId;
  String? planName;
  String? requestOnly;
  int? price;
  Null? description;
  String? hsnCode;
  Null? securityAmt;
  Null? extraInformation;
  int? accessPeriodUnitId;
  String? advance;
  int? sortOrderId;
  int? adminOnly;
  int? isOnlyRequestBooking;
  int? status;
  int? isDraft;
  int? invoiceTemplateId;
  String? accessPeriod;
  int? isOvernight;
  int? isLocationTime;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? capacity;
  int? resourceGroupId;
  String? resourceGroupName;
  String? unit;
  List<ImagePath>? imagePath;

  ResourcePlan(
      {this.id,
      this.propertyId,
      this.resourceId,
      this.planForId,
      this.planName,
      this.requestOnly,
      this.price,
      this.description,
      this.hsnCode,
      this.securityAmt,
      this.extraInformation,
      this.accessPeriodUnitId,
      this.advance,
      this.sortOrderId,
      this.adminOnly,
      this.isOnlyRequestBooking,
      this.status,
      this.isDraft,
      this.invoiceTemplateId,
      this.accessPeriod,
      this.isOvernight,
      this.isLocationTime,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.capacity,
      this.resourceGroupId,
      this.resourceGroupName,
      this.unit,
      this.imagePath});

  ResourcePlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    resourceId = json['resource_id'];
    planForId = json['plan_for_id'];
    planName = json['plan_name'];
    requestOnly = json['request_only'];
    price = json['price'];
    description = json['description'];
    hsnCode = json['hsn_code'];
    securityAmt = json['security_amt'];
    extraInformation = json['extra_information'];
    accessPeriodUnitId = json['access_period_unit_id'];
    advance = json['advance'];
    sortOrderId = json['sort_order_id'];
    adminOnly = json['admin_only'];
    isOnlyRequestBooking = json['is_only_request_booking'];
    status = json['status'];
    isDraft = json['is_draft'];
    invoiceTemplateId = json['invoice_template_id'];
    accessPeriod = json['access_period'];
    isOvernight = json['is_overnight'];
    isLocationTime = json['is_location_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    capacity = json['capacity'];
    resourceGroupId = json['resource_group_id'];
    resourceGroupName = json['resource_group_name'];
    unit = json['unit'];
    if (json['image_path'] != null) {
      imagePath = <ImagePath>[];
      json['image_path'].forEach((v) {
        imagePath!.add(new ImagePath.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['resource_id'] = this.resourceId;
    data['plan_for_id'] = this.planForId;
    data['plan_name'] = this.planName;
    data['request_only'] = this.requestOnly;
    data['price'] = this.price;
    data['description'] = this.description;
    data['hsn_code'] = this.hsnCode;
    data['security_amt'] = this.securityAmt;
    data['extra_information'] = this.extraInformation;
    data['access_period_unit_id'] = this.accessPeriodUnitId;
    data['advance'] = this.advance;
    data['sort_order_id'] = this.sortOrderId;
    data['admin_only'] = this.adminOnly;
    data['is_only_request_booking'] = this.isOnlyRequestBooking;
    data['status'] = this.status;
    data['is_draft'] = this.isDraft;
    data['invoice_template_id'] = this.invoiceTemplateId;
    data['access_period'] = this.accessPeriod;
    data['is_overnight'] = this.isOvernight;
    data['is_location_time'] = this.isLocationTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['capacity'] = this.capacity;
    data['resource_group_id'] = this.resourceGroupId;
    data['resource_group_name'] = this.resourceGroupName;
    data['unit'] = this.unit;
    if (this.imagePath != null) {
      data['image_path'] = this.imagePath!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagePath {
  String? imagePaths;

  ImagePath({
    this.imagePaths,
  });

  ImagePath.fromJson(Map<String, dynamic> json) {
    imagePaths = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_path'] = this.imagePaths;
    return data;
  }
}

class TermsConditionsDoc {
  int? id;
  String? tcTypeName;
  String? tcTypeTemplatePath;
  int? tcProvider;
  int? tcMember;
  int? tcCorporate;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  TermsConditionsDoc(
      {this.id,
      this.tcTypeName,
      this.tcTypeTemplatePath,
      this.tcProvider,
      this.tcMember,
      this.tcCorporate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  TermsConditionsDoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tcTypeName = json['tc_type_name'];
    tcTypeTemplatePath = json['tc_type_template_path'];
    tcProvider = json['tc_provider'];
    tcMember = json['tc_member'];
    tcCorporate = json['tc_corporate'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tc_type_name'] = this.tcTypeName;
    data['tc_type_template_path'] = this.tcTypeTemplatePath;
    data['tc_provider'] = this.tcProvider;
    data['tc_member'] = this.tcMember;
    data['tc_corporate'] = this.tcCorporate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
