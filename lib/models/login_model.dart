class UserLoginModel {
  int id;
  String name;
  Null email;
  Null gender;
  Null birthDate;
  int newsLetter;
  int offers;
  String mobile;
  Null emailVerifiedAt;
  Null mobileVerifiedAt;
  String img;
  int notification;
  Null rememberToken;
  String createdAt;
  String updatedAt;
  int socialAccountsCount;
  String accessToken;
  String accessProvider;

  UserLoginModel(
      {this.id,
        this.name,
        this.email,
        this.gender,
        this.birthDate,
        this.newsLetter,
        this.offers,
        this.mobile,
        this.emailVerifiedAt,
        this.mobileVerifiedAt,
        this.img,
        this.notification,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
        this.socialAccountsCount,
        this.accessToken,
        this.accessProvider});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    newsLetter = json['news_letter'];
    offers = json['offers'];
    mobile = json['mobile'];
    emailVerifiedAt = json['email_verified_at'];
    mobileVerifiedAt = json['mobile_verified_at'];
    img = json['img'];
    notification = json['notification'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    socialAccountsCount = json['social_accounts_count'];
    accessToken = json['access_token'];
    accessProvider = json['access_provider'];
  }

}