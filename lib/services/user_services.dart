import 'dart:core';

import 'package:ankylo_cup/proto/user.pbgrpc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'grpc_channel.dart'; // GrpcChannel のインポート

class UserService {
  late final ClientChannel _channel;
  late final UserServiceClient _stub;

  UserService() {
    // GrpcChannel からチャンネルを取得
    _channel = GrpcChannel.createChannel();
    _stub = UserServiceClient(_channel);
  }

  // GetUser メソッドを定義
  Future<GetUserResponse> getUser(String userId) async {
    try {
      // リクエストの作成
      final request = GetUserRequest()..userId = userId;

      // gRPC サーバーにリクエストを送信
      final response = await _stub.getUser(request);

      return response; // レスポンスを返す
    } catch (e) {
      print('Error getting user: $e');
      rethrow;
    }
  }

  Future<SignUpResponse> createUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    if (idToken == null) {
      throw Exception('Failed to get Firebase ID token');
    }

    final options = CallOptions(metadata: {'Authorization': 'Bearer $idToken'});

    final request = SignUpRequest();

    return await _stub.signUp(request, options: options);
  }
  Future<AddCoinResponse> addCoin(int amount) async {
    final user = FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    if (idToken == null) {
      throw Exception('Failed to get Firebase ID token');
    }

    final options = CallOptions(metadata: {'Authorization': 'Bearer $idToken'});

    final request = AddCoinRequest()..amount = amount;

    return await _stub.addCoin(request, options: options);
  }

  
  // サービス終了時にチャネルを閉じる
  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}
