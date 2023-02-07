class UserDetails{
  String firstName='',
      middleName='',
      lastName='',
      username='',
      phone='',
      email='',
      userType='',
      identificationType='',
      identificationNumber='',
notificationPeriod='',
fuelUnits='',
distanceUnits = '';
  int id;
  bool enabled=false,
      accountNonExpired=false,
      accountNonLocked=false,
      credentialsNonExpired=false;
  List<IdentificationMediasModel> identificationMedias=[];
  List<UserRoles>roles=[];
  Map user_settings = Map<int, String>();



  UserDetails({required this.firstName,
    required this.notificationPeriod,
    required this.fuelUnits,
    required this.distanceUnits,
    required this.middleName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.email,
    required this.userType,
    required this.identificationType,
    required this.identificationNumber,
    required this.id,
    required this.enabled,
    required this.accountNonExpired,
    required  this.accountNonLocked,
    required  this.credentialsNonExpired,
    required this.user_settings,
    // required  this.identificationMedias,
    // required  this.roles
  }
      );
  factory UserDetails.fromJson(Map<String, dynamic> responseData){
    List<dynamic>media=responseData['identificationMedias'];
    List<dynamic>roles=responseData['roles'];
    return UserDetails(firstName: responseData['firstName'],
        fuelUnits: responseData['fuelUnits'],
        distanceUnits: responseData['distanceUnits'],
        notificationPeriod: responseData['notificationPeriod'],
        middleName:responseData.containsKey('middleName')? responseData['middleName']:'',
        lastName: responseData['lastName'],
        username: responseData['username'],
        phone: responseData['phone'],
        email: responseData['email'],
        userType: responseData['userType'],
        identificationType: responseData['identificationType'],
        identificationNumber: responseData['identificationNumber'],
        id: responseData['id'],
        enabled: responseData['enabled'],
        accountNonExpired: responseData['accountNonExpired'],
        accountNonLocked: responseData['accountNonLocked'],
        credentialsNonExpired: responseData['credentialsNonExpired'],
        user_settings: responseData['userSettings'],
        // identificationMedias: media.map((e) => IdentificationMediasModel.fromJson(e)).toList(),
        // roles:  roles.map((e) => UserRoles.fromJson(e)).toList()

    );
  }
}
class UserRoles{
  int id=0;
  String name='';

  UserRoles({required this.id, required this.name});
  factory UserRoles.fromJson(Map<String, dynamic> responseData){
    return UserRoles(id: responseData['id'], name: responseData['name']);
  }
}
class IdentificationMediasModel{
  int id=0,user=0;
  String initialName='';
  String mimeType='';
  String mirrorCode='';

  IdentificationMediasModel({
    required this.id, required this.user, required this.initialName, required this.mimeType, required this.mirrorCode});
  factory IdentificationMediasModel.fromJson(Map<String, dynamic> responseData){
    return IdentificationMediasModel(id: responseData['id'], initialName: responseData['initialName'], user: responseData['user']['id'],mimeType: responseData['mimeType'],mirrorCode: responseData['mirrorCode']);
  }
}