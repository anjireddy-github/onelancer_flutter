class ChatRoom {
  final String id;
  final String name;
  final bool isGroupChat;
  final List<Participant> participants;
  final String admin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  Message? lastMessage;

  ChatRoom({
    required this.id,
    required this.name,
    required this.isGroupChat,
    required this.participants,
    required this.admin,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.lastMessage,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['_id'],
      name: json['name'],
      isGroupChat: json['isGroupChat'],
      participants: List<Participant>.from(json['participants'].map((participantJson) => Participant.fromJson(participantJson))),
      admin: json['admin'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
      lastMessage: Message.fromJson(json["lastMessage"])
    );
  }
}

class Message {
  final String id;
  final Participant sender;
  final String content;
  final List<String> attachments;
  final String chatId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Message({
    required this.id,
    required this.sender,
    required this.content,
    required this.attachments,
    required this.chatId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      sender: Participant.fromJson(json['sender']),
      content: json['content'],
      attachments: List<String>.from(json['attachments']),
      chatId: json['chat'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class Participant {
  final String id;
  final String user;
  final String firstName;
  final String profileImage;

  Participant({
    required this.id,
    required this.user,
    required this.firstName,
    required this.profileImage,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['_id'],
      user: json['user'],
      firstName: json['first_name'],
      profileImage: json['profile_image'],
    );
  }
}

class SendMessageRequest {
  final String content;

  SendMessageRequest({
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': content,
    };
  }
}