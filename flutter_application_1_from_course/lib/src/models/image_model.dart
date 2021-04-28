// // class ImageModel {
// //   int id;
// //   String title;
// //   String url;
// //   ImageModel(this.id, this.title, this.url);
// //   ImageModel.fromJson(Map<String, dynamic> parse) {
// //     id = parse['id'];
// //     title = parse['title'];
// //     url = parse['url'];
// //   }
// // }

// class ImageModel {
//   int id;
//   String name;
//   String username;
//   String email;
//   Address address;
//   ImageModel(this.address, this.email, this.id, this.name, this.username);
//   ImageModel.fromJson(Map<String, dynamic> parsedModel) {
//     id = parsedModel['id'];
//     name = parsedModel['name'];
//     username = parsedModel['username'];
//     email = parsedModel['email'];
//     address = Address.fromJson(parsedModel['address']);
//   }
// }

// class Address {
//   String street;
//   String suite;
//   String city;
//   String zipcode;
//   Geo geo;
//   Address(this.city, this.street, this.suite, this.zipcode, this.geo);
//   Address.fromJson(Map<String, dynamic> parsedAddress) {
//     street = parsedAddress['street'];
//     suite = parsedAddress['suite'];
//     city = parsedAddress['city'];
//     zipcode = parsedAddress['zipcode'];
//     geo = Geo.fromJson(parsedAddress['geo']);
//   }
// }

// class Geo {
//   String lat;
//   String lng;
//   Geo(this.lat, this.lng);
//   Geo.fromJson(Map<String, dynamic> parsedGeo) {
//     lat = parsedGeo['lat'];
//     lng = parsedGeo['lng'];
//   }
// }

class Model {
  int id;
  String name;
  String email;
  String body;
  Model(
    this.body,
    this.email,
    this.id,
    this.name,
  );
  Model.fromJson(Map<String, dynamic> parsed) {
    id = parsed['id'];
    name = parsed['name'];
    email = parsed['email'];
    body = parsed['body'];
  }
}
