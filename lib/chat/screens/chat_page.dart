import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_renting_app/chat/bloc/chat/chat_bloc.dart';
import 'package:home_renting_app/chat/bloc/chat/chat_event.dart';
import 'package:home_renting_app/chat/bloc/chat/chat_state.dart';
import 'package:home_renting_app/chat/models/ChatModel.dart';
import 'package:home_renting_app/chat/screens/messages_page.dart';

import '../../routes.dart';

class ChatPage extends StatefulWidget {
  static const routeName = "chatpage";
  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ChatBloc>(context).add(LoadChats());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _customCard(ChatModel chatModel) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, IndividualPage.routeName,
            arguments: ChatArguments(
                chatId: chatModel.sId!,
                user1Id: chatModel.user1Id!,
                user2Id: chatModel.user2Id!,
                user1Name: chatModel.user1Name!,
                user2Name: chatModel.user2Name!,
                messages: chatModel.messages));
      },
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Icon(Icons.person),
          ),
          trailing: Text(chatModel.user1Name!),
          title: Text(chatModel.user2Name!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: [
              Icon(Icons.message_outlined),
              SizedBox(
                width: 5,
              ),
              Text(
                chatModel.messages!.length != 0
                    ? "${chatModel.messages![chatModel.messages!.length - 1]["message"]}"
                    : " ",
                style: TextStyle(fontSize: 13),
              ),
            ],
          )),
    );
  }





  }