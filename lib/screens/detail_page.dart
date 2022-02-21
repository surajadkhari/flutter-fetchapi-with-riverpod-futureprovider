import 'package:api_future/model/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.e}) : super(key: key);
  final UserModel e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: CachedNetworkImageProvider(e.avatar)),
            ),
            Text(
              e.firstname + " " + e.lastname,
            ),
            Text(e.email),
          ],
        ),
      ),
    );
  }
}
