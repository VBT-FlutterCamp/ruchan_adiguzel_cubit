import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../model/post_model.dart';

import '../service/post_service.dart';

class PostCubit extends Cubit<PostState> {
  List<PostModel> post_lists = [];

  final IPostService service;

  bool isLoading = false;
  PostCubit({required this.service}) : super(PostInitial());

  Future<void> getData() async {
    changeLoadingView();
    post_lists = await service.getData();
    changeLoadingView();
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(DataLoadingState(isLoading));
  }
}

abstract class PostState {}

class PostInitial extends PostState {}

class DataLoadingState extends PostState {
  final bool isLoading;

  DataLoadingState(this.isLoading);
}
