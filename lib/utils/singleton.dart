class FlashSingleton {
  Map<String, dynamic>? errorMapValues;
  String? bearerToken;
  int? id;
  double? latitude;
  double? longitude;
  int? minPrice = 0;
  int? maxPrice = 0;

  // Add latitude and longitude properties and a method to update them
  void updateLocation(double lat, double long) {
    latitude = lat;
    longitude = long;
  }

  List<int>? _amenityIdArray;
  List<int>? get amenityIdArray => _amenityIdArray;
  void addAmenityId(int id) {
    _amenityIdArray ??= [];
    if (_amenityIdArray!.contains(id)) {
      _amenityIdArray!.remove(id);
    } else {
      _amenityIdArray!.add(id);
    }
  }

  List<int>? _propertyIdArray;
  List<int>? get propertyIdArray => _propertyIdArray;
  void addPropertyId(int id) {
    _propertyIdArray ??= [];
    if (_propertyIdArray!.contains(id)) {
      _propertyIdArray!.remove(id);
    } else {
      _propertyIdArray!.add(id);
    }
  }

  List<int>? _resourceGroupIdArray;
  List<int>? get resourceGroupIdArray => _resourceGroupIdArray;
  void addResourceGroupId(int id) {
    _resourceGroupIdArray ??= [];
    if (_resourceGroupIdArray!.contains(id)) {
      _resourceGroupIdArray!.remove(id);
    } else {
      _resourceGroupIdArray!.add(id);
    }
  }

  static final FlashSingleton _singleton = FlashSingleton._internal();

  FlashSingleton._internal();

  static FlashSingleton get instance => _singleton;
}
