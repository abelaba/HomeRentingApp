import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_renting_app/chat//Custom/MessageCard.dart';
import 'package:home_renting_app/chat/bloc/chat/chat_bloc.dart';
import 'package:home_renting_app/chat/bloc/chat/chat_event.dart';
import 'package:home_renting_app/chat/bloc/message/message_bloc.dart';
import 'package:home_renting_app/chat/bloc/message/message_state.dart';
import 'package:home_renting_app/chat/bloc/message/message_event.dart';
import 'package:home_renting_app/chat/models/ChatModel.dart';
import 'package:home_renting_app/chat/models/MessageModel.dart';
import 'package:home_renting_app/rental/screens/HomeScreen.dart';
import 'package:home_renting_app/routes.dart';

class IndividualPage extends StatefulWidget {
  static const routeName = 'individualPage';
  final ChatArguments chatArguments;
  IndividualPage({Key? key, required this.chatArguments}) : super(key: key);

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  // late IO.Socket socket;
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    BlocProvider.of<MessageBloc>(context)
        .add(LoadMessages(widget.chatArguments.chatId));

    // connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leadingWidth: 200,
        leading: InkWell(
          onTap: () {
            BlocProvider.of<ChatBloc>(context).add(LoadChats());
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                child: Icon(Icons.person),
                radius: 20,
              ),
              Text(widget.chatArguments.user1Name),
            ],
          ),
        ),
      ),
