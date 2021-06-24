import 'package:bloc_sessions/bloc/article_bloc.dart';
import 'package:bloc_sessions/models/registered_user.dart';
import 'package:bloc_sessions/util/local_cred.dart';
import 'package:bloc_sessions/widgets/h_list.dart';
import 'package:bloc_sessions/widgets/v_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  ArticleBloc _articleBloc;
  Profile({
    Key key,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider<ArticleBloc>(
      create: (context) {
        _articleBloc = ArticleBloc();
        _articleBloc.add(FetchDataEvent());
        return _articleBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: FutureBuilder(
            future: StorageUtil.getInstance().getAuth(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text('${snapshot.data['username']}');
              else
                return CircularProgressIndicator();
            },
          ),
        ),
        body: Container(
          width: size.width,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: MyList(),
              ),
              Expanded(
                flex: 4,
                child: VerticalList(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Theme.of(context).primaryColor,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _articleBloc.add(FetchDataEvent());
                  },
                  icon: Icon(Icons.replay_outlined, color: Colors.white),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      StorageUtil.getInstance().clean();
                      Get.offAllNamed('/home');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
