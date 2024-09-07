import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatAssistant extends StatefulWidget {
  const ChatAssistant({super.key});

  @override
  State<ChatAssistant> createState() => _ChatAssistantState();
}

class _ChatAssistantState extends State<ChatAssistant> {
  final ChatUser _currentUser =
      ChatUser(id: '1', firstName: 'Sharfuddin', lastName: 'Khan');

  final ChatUser _gptChatUser =
      ChatUser(id: '2', firstName: 'Smart', lastName: 'Desk');

  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typingUsers = <ChatUser>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 173, 224),
        title: const Text(
          'Smart Desk',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: DashChat(
          currentUser: _currentUser,
          typingUsers: _typingUsers,
          messageOptions: const MessageOptions(
            currentUserContainerColor: Colors.black,
            containerColor: Color.fromRGBO(0, 119, 166, 1),
            textColor: Colors.white,
          ),
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _messages),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typingUsers.add(_gptChatUser);
    });

    Messages systemMessage = Messages(
      role: Role.system,
      content:
          "You are an helpful multi lingual assistant for central hospital ... (your system message content)",
    );

    List<Messages> _messagesHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();
    _messagesHistory.insert(0, systemMessage);

    // Get the last message from _messagesHistory
    String lastMessage = _messagesHistory.last.content ?? "";

    // Send a POST request to your API
    Uri apiUrl = Uri.parse(
        'https://closing-earwig-neatly.ngrok-free.app/api/assistant/');
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String requestBody = json.encode({'content': lastMessage});
    http.Response response =
        await http.post(apiUrl, headers: headers, body: requestBody);

    // Handle the response
    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Assuming the response contains a 'content' field
      String apiResponseContent = jsonResponse['content'];

      setState(() {
        _messages.insert(
          0,
          ChatMessage(
            user: _gptChatUser,
            createdAt: DateTime.now(),
            text: apiResponseContent,
          ),
        );
      });
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }

    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }
}
