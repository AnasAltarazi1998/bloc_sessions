import 'package:bloc_sessions/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class VerticalList extends StatefulWidget {
  const VerticalList({Key key}) : super(key: key);

  @override
  _VerticalListState createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleInitial || state is LoadingDataState) {
          return Container(
            child: PlayStoreShimmer(
              colors: [Colors.white, Colors.grey],
            ),
            width: 10,
            height: 10,
          );
        } else if (state is ErrorState) {
          return Center(
            child: Column(
              children: [
                Text('${state.messsage}'),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<ArticleBloc>(context)
                          .add(FetchDataEvent());
                    },
                    icon: Icon(Icons.replay_outlined))
              ],
            ),
          );
        } else if (state is LoadedDataState) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.data.articles.length,
            itemBuilder: (context, index) {
              return Container(
                height: 250,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            '${state.data.articles[index].urlToImage}'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Container(
                        child: Text('${state.data.articles[index].content}'),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else
          return Container(
            child: Text('something went wrong'),
          );
      },
    );
  }
}
