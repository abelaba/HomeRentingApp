import 'package:equatable/equatable.dart';
import 'package:home_renting_app/chat/models/ChatModel.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}