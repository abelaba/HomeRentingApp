import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  const MessageCard(
      {Key? key,
      required this.message,
      required this.time,
      required this.senderName})
      : super(key: key);
  final String message;
  final String time;
  final String senderName;

  @override
  _MessageCardState createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffdcf8c6),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 30,
                  top: 5,
                  bottom: 20,
                ),
                child: Text(
                  widget.message,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
         