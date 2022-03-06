import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/post_service.dart';

import '../viewmodel/post_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
      create: (context) => PostCubit(
          service: PostService(
              Dio(BaseOptions(baseUrl: servicePath.BASE_URL.rawValue)))),
      child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context, PostState state) {
    return Scaffold(
      floatingActionButton: FAB(context),
      appBar: AppBar(
        title: Text(
          "List of item : ${context.read<PostCubit>().post_lists.length}",
          overflow: TextOverflow.fade,
        ),
      ),
      body: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            itemCount: context.read<PostCubit>().post_lists.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                child: ListTile(
                    title: Text(
                        context.read<PostCubit>().post_lists[index].body ??
                            "null body")),
              );
            },
          );
        },
      ),
    );
  }

  FloatingActionButton FAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<PostCubit>().getData();
      },
      child: Icon(Icons.refresh),
    );
  }
}
