// ignore_for_file: avoid_print

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:get/get.dart';
import 'package:getx_amplify/amplifyconfiguration.dart';
import 'package:getx_amplify/models/ModelProvider.dart';

class Controller extends GetxController {
  var todoList = <Todos>[].obs;

  @override
  void onInit() {
    _configureAmplify();
    super.onInit();
  }

  // configutre amplify. This should be run at first
  void _configureAmplify() async {
    // Add the following lines to your app initialization to add the DataStore plugin
    AmplifyDataStore datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    Amplify.addPlugin(datastorePlugin);
    await Amplify.addPlugin(AmplifyAPI());
    try {
      await Amplify.configure(amplifyconfig);
      readData();
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  // read data
  Future<void> readData() async {
    try {
      todoList = RxList(await Amplify.DataStore.query(Todos.classType));
      update();
    } catch (e) {
      print(e);
    }
  }

  // add new todo
  Future<void> addPost(String? task) async {
    try {
      Todos _newTodo = Todos(task: task!, isDone: false);

      await Amplify.DataStore.save(_newTodo);
      readData();
    } on Exception catch (e) {
      print(e);
    }
  }

  // update todo
  Future<void> updatePost(String? id, bool? isDone) async {
    try {
      Todos _oldTodo = (await Amplify.DataStore.query(Todos.classType,
          where: Todos.ID.eq(id)))[0];

      Todos _newTodo =
          _oldTodo.copyWith(id: id!, task: _oldTodo.task, isDone: isDone!);

      await Amplify.DataStore.save(_newTodo);
      readData();
    } on Exception catch (e) {
      print(e);
    }
  }

  // delete todo
  Future<void> deleteTodo(String? id) async {
    (await Amplify.DataStore.query(Todos.classType, where: Todos.ID.eq(id)))
        .forEach((element) async {
      try {
        await Amplify.DataStore.delete(element);
      } catch (e) {
        print(e);
      }
    });
    readData();
  }
}
