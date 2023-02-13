import 'package:cloud_firestore/cloud_firestore.dart';

class MsgContent {
  final String? token;
  final String? content;
  final String? type;
  final Timestamp? addtime;

  MsgContent({
    this.token,
    this.content,
    this.type,
    this.addtime,
  });

  factory MsgContent.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return MsgContent(
      token: data?['token'],
      content: data?['content'],
      type: data?['type'],
      addtime: data?['addtime'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (token != null) "token": token,
      if (content != null) "content": content,
      if (type != null) "type": type,
      if (addtime != null) "addtime": addtime,
    };
  }
}