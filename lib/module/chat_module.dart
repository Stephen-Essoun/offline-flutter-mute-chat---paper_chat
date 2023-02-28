class ChatMessage {
  ChatMessage({
    required this.messageContent,
    required this.messageType,
    required this.time,
  });
  String? messageContent, messageType;
  DateTime? time;
  
      //constructor to convert from json to object instance
      ChatMessage.fromJson(Map<String, dynamic> json):messageContent=json['messageContent'],messageType=json['messageType'],time=json['time'];
  //a method that convert object to json string
  Map<String, dynamic> toJson() => {
        'messageContent': messageContent,
        'messageType': messageType,
        'time': time,
      };
}
