import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
      fromFirestore: (snapshot, _) {
        return Task.fromJson(snapshot.data()!);
      },
      toFirestore: (Task, _) => Task.toJson());
}

Future<void> addTaskToFireStore(Task task) {
  var taskCollection = getTaskCollection();
  var docRef = taskCollection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Future<void> deleteTaskFromFireStore(Task task) {
  var taskCollections = getTaskCollection();
  return taskCollections.doc(task.id).delete();
}

Future<void> updateTaskToFireStore(Task task) {
  var taskCollections = getTaskCollection();
  return taskCollections.doc(task.id).update({'isDone': true});
}
