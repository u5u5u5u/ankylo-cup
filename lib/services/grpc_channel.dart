import 'package:grpc/grpc.dart';

// ClientChannel を定義するクラス
class GrpcChannel {
  static ClientChannel createChannel() {
    return ClientChannel(
      '10.0.2.2', // バックエンドサーバーのアドレス
      port: 50051, // バックエンドサーバーのポート
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  }
}
