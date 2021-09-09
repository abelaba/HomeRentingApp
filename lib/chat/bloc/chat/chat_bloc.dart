import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:home_renting_app/chat/bloc/chat/chat_event.dart';
import 'package:home_renting_app/chat/bloc/chat/chat_state.dart';
import 'package:home_renting_app/chat/models/ChatModel.dart';
import 'package:home_renting_app/chat/models/MessageModel.dart';
import 'package:home_renting_app/chat/repository/chat-repository.dart';