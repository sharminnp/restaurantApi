// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  Restaurant({
    required this.response,
    required this.menuItems,
    required this.pageTitle,
    required this.website,
  });

  String response;
  List<MenuItem> menuItems;
  String pageTitle;
  Website website;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        response: json["response"],
        menuItems: List<MenuItem>.from(
            json["menu_items"].map((x) => MenuItem.fromJson(x))),
        pageTitle: json["page_title"],
        website: Website.fromJson(json["website"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "menu_items": List<dynamic>.from(menuItems.map((x) => x.toJson())),
        "page_title": pageTitle,
        "website": website.toJson(),
      };
}

class MenuItem {
  MenuItem({
    required this.name,
    required this.sliderTitle,
    required this.sliderDesc,
    required this.isActive,
    required this.sliderImage,
    required this.products,
  });

  String name;
  SliderTitle sliderTitle;
  SliderDesc sliderDesc;
  String isActive;
  String sliderImage;
  List<Product> products;

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        name: json["name"],
        sliderTitle: sliderTitleValues.map[json["slider_title"]]!,
        sliderDesc: sliderDescValues.map[json["slider_desc"]]!,
        isActive: json["is_active"],
        sliderImage: json["slider_image"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slider_title": sliderTitleValues.reverse[sliderTitle],
        "slider_desc": sliderDescValues.reverse[sliderDesc],
        "is_active": isActive,
        "slider_image": sliderImage,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.desc,
    required this.amount,
    required this.productType,
    required this.isActive,
    required this.image,
    required this.currency,
  });

  String id;
  String name;
  String desc;
  String amount;
  String productType;
  String isActive;
  String image;
  Currency currency;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        amount: json["amount"],
        productType: json["product_type"],
        isActive: json["is_active"],
        image: json["image"],
        currency: currencyValues.map[json["currency"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "amount": amount,
        "product_type": productType,
        "is_active": isActive,
        "image": image,
        "currency": currencyValues.reverse[currency],
      };
}

enum Currency { INR, U20_B9 }

final currencyValues =
    EnumValues({"INR": Currency.INR, "u20b9": Currency.U20_B9});

enum SliderDesc { EMPTY, STARTERDISHES }

final sliderDescValues = EnumValues(
    {"": SliderDesc.EMPTY, "Starterdishes": SliderDesc.STARTERDISHES});

enum SliderTitle { EMPTY, STARTER }

final sliderTitleValues =
    EnumValues({"": SliderTitle.EMPTY, "Starter": SliderTitle.STARTER});

class Website {
  Website({
    required this.id,
    required this.restaurantId,
    required this.eventId,
    required this.aboutUs,
    required this.sliderTitle,
    required this.sliderDesc,
    required this.phone,
    required this.mobile,
    required this.email,
    required this.address,
    required this.copyright,
    required this.facebookLink,
    required this.instagramLink,
    required this.twitterLink,
    required this.pinterestLink,
    required this.linkedinLink,
    required this.image,
    required this.isPdfMenu,
    required this.pdfMenu,
  });

  String id;
  String restaurantId;
  String eventId;
  String aboutUs;
  String sliderTitle;
  String sliderDesc;
  String phone;
  String mobile;
  String email;
  String address;
  String copyright;
  String facebookLink;
  String instagramLink;
  String twitterLink;
  String pinterestLink;
  String linkedinLink;
  String image;
  String isPdfMenu;
  String pdfMenu;

  factory Website.fromJson(Map<String, dynamic> json) => Website(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        eventId: json["event_id"],
        aboutUs: json["about_us"],
        sliderTitle: json["slider_title"],
        sliderDesc: json["slider_desc"],
        phone: json["phone"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        copyright: json["copyright"],
        facebookLink: json["facebook_link"],
        instagramLink: json["instagram_link"],
        twitterLink: json["twitter_link"],
        pinterestLink: json["pinterest_link"],
        linkedinLink: json["linkedin_link"],
        image: json["image"],
        isPdfMenu: json["is_pdf_menu"],
        pdfMenu: json["pdf_menu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_id": restaurantId,
        "event_id": eventId,
        "about_us": aboutUs,
        "slider_title": sliderTitle,
        "slider_desc": sliderDesc,
        "phone": phone,
        "mobile": mobile,
        "email": email,
        "address": address,
        "copyright": copyright,
        "facebook_link": facebookLink,
        "instagram_link": instagramLink,
        "twitter_link": twitterLink,
        "pinterest_link": pinterestLink,
        "linkedin_link": linkedinLink,
        "image": image,
        "is_pdf_menu": isPdfMenu,
        "pdf_menu": pdfMenu,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
