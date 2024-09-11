import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { Text, Image }

class MessageModel {
  String? senderid;
  String? content;
  MessageType? messageType;
  Timestamp? sentAt;

  MessageModel(
      {required this.senderid,
      required this.content,
      required this.messageType,
      required this.sentAt});

  MessageModel.fromJson(Map<String, dynamic> map) {
    senderid = map['senderid'];
    content = map['content'];
    sentAt = map['sentAt'];
    messageType = MessageType.values.byName(map['messageType']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderid'] = senderid;
    data['content'] = content;
    data['sentAt'] = sentAt;
    data['messageType'] = messageType!.name;

    return data;
  }
}
