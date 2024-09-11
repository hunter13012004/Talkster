import 'package:talkster/model/message_model.dart';

class ChatModel {
  String? chatid;
  List<String>? participants;
  List<MessageModel>? messages;

  ChatModel(
      {required this.chatid,
      required this.participants,
      required this.messages});

  ChatModel.fromJson(Map<String, dynamic> map) {
    chatid = map['chatid'];
    participants = List<String>.from(map['participants']);
    messages = List.from(map['messages'])
        .map((m) => MessageModel.fromJson(m))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatid'] = chatid;
    data['participants'] = participants;
    data['messages'] = messages?.map((m) => m.toJson()).toList() ?? [];
    return data;
  }
}
