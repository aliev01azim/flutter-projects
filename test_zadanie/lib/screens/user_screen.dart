import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/users.dart';

class UserScreen extends StatelessWidget {
  static const routeName = '/user-screen';
  @override
  Widget build(BuildContext context) {
    Provider.of<Users>(context).fetchAndSetUsers();
    final routeId = ModalRoute.of(context).settings.arguments as int;
    final user = Provider.of<Users>(context, listen: false).findById(routeId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.username}\'s detail'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            const Text(
              'About me',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text('I am ${user.name}'),
                  Text('My email is ${user.email}'),
                  Text('Contact me: ${user.phone}'),
                  Text('WebSite: ${user.phone}'),
                ],
              ),
            ),
            const Text(
              'My Address',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text('City: ${user.address.city}'),
                  Text('street: ${user.address.street}'),
                  Text('suite: ${user.address.suite}'),
                  Text('zipcode: ${user.address.zipcode}'),
                  Text('I am ${user.address.geo.lat}'),
                  Text('I am ${user.address.geo.lng}'),
                ],
              ),
            ),
            const Text(
              'Company',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text('Company name: ${user.company.name}'),
                  Text('BS: ${user.company.bs}'),
                  Text('Our goal: ${user.company.catchPhrase}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
