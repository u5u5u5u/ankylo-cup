import 'package:ankylo_cup/proto/ankirocup.pbgrpc.dart';
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

  // サービス終了時にチャネルを閉じる
  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}