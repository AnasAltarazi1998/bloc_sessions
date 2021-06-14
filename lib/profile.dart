import 'package:bloc_sessions/models/registered_user.dart';
import 'package:bloc_sessions/util/local_cred.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;

  Profile({
    Key key,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Profile',
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
