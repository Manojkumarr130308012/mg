class HttpUrl {
  static const String baseUrl = 'https://dev.berighthere.com/';
  static const String getUserProfile = '${baseUrl}user/fetchlusers?id=';
  static const String login = '${baseUrl}user-management/api/v1/sign-in';
  static const String signup = '${baseUrl}user-management/api/v1/sign-up';
  static const String property_list = '${baseUrl}api/property-list?page=1';
  static const String amenities_list = '${baseUrl}api/amenities';
  static const String property_type_list = '${baseUrl}api/propertytype';
  static const String meeting_resource_group_list =
      '${baseUrl}api/meeting-resource-group';
}
