import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/photos.dart';
import 'package:test_zadanie/widgets/main_drawer.dart';
import 'package:test_zadanie/widgets/photos_grid.dart';

class PhotosScreen extends StatelessWidget {
  static const routeName = '/photos-screen';
  Future<void> _refresh(BuildContext context) async {
    await Provider.of<Photos>(context, listen: false)
        .fetchAndSetPhotos(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos Screen'),
      ),
      drawer: MainDrawer(),
      body: FutureBuilder(
        future: _refresh(context),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => _refresh(context),
                child: Consumer<Photos>(
                  builder: (context, value, _) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3 / 2,
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (_, index) => ChangeNotifierProvider.value(
                        value: value.photos[index],
                        child: PhotosGridItem(value.photos[index]),
                      ),
                      itemCount: value.photos.length,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
