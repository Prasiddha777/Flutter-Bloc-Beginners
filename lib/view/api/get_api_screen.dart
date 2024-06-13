import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/get_api/bloc/get_api_bloc.dart';
import 'package:learnbloc/utils/enums.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetApiBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetApiBloc, GetApiState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              print(PostStatus.loading);
              return const Center(child: CircularProgressIndicator());
            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                    ),
                    onChanged: (filterKey) {
                      context.read<GetApiBloc>().add(SearchItem(searchText: filterKey));
                    },
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(child: Text(state.searchMessage))
                        : ListView.builder(
                            itemCount: state.tempPostList.isEmpty
                                ? state.postList.length
                                : state.tempPostList.length,
                            itemBuilder: (context, index) {
                              if (state.tempPostList.isNotEmpty) {
                                final item = state.tempPostList[index];

                                return Card(
                                  child: ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),
                                );
                              } else {
                                final item = state.postList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ],
              );
            case PostStatus.failure:
              return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
