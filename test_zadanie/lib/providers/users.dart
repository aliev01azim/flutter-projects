import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;
  UserModel(
      {@required this.address,
      @required this.company,
      @required this.email,
      @required this.id,
      @required this.name,
      @required this.phone,
      @required this.username,
      @required this.website});
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;
  Address(
      {@required this.city,
      @required this.geo,
      @required this.street,
      @required this.suite,
      @required this.zipcode});
  Address.fromJson(Map<String, dynamic> parsed) {
    street = parsed['street'];
    suite = parsed['suite'];
    city = parsed['city'];
    zipcode = parsed['zipcode'];
    geo = Geo.fromJson(parsed['geo']);
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;
  Company({@required this.bs, @required this.catchPhrase, @required this.name});
  Company.fromJson(Map<String, dynamic> parsed) {
    name = parsed['name'];
    catchPhrase = parsed['catchPhrase'];
    bs = parsed['bs'];
  }
}

class Geo {
  String lat;
  String lng;
  Geo({@required this.lat, @required this.lng});
  Geo.fromJson(Map<String, dynamic> parsed) {
    lat = parsed['lat'];
    lng = parsed['lng'];
  }
}

class Users with ChangeNotifier {
  List<UserModel> _users = [];
  List<UserModel> get users {
    return [..._users];
  }

  void fetchAndSetUsers() async {
    try {
      const url = 'https://jsonplaceholder.typicode.com/users';
      final response = await get(url);
      final List<UserModel> loadedUsers = [];
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }
      print(extractedData);
      extractedData.forEach((user) {
        loadedUsers.add(UserModel(
          email: user['email'],
          id: user['id'],
          name: user['name'],
          phone: user['phone'],
          username: user['username'],
          website: user['website'],
          address: Address.fromJson(user['address']),
          company: Company.fromJson(user['company']),
        ));
      });
      _users = loadedUsers;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  UserModel findById(int id) {
    return _users.firstWhere((element) => element.id == id);
  }
}
