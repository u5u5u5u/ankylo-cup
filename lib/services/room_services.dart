import 'package:ankylo_cup/proto/room.pbgrpc.dart';
import 'package:ankylo_cup/services/grpc_channel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';

class RoomServices {
  late final ClientChannel _channel;
  late final RoomServiceClient _stub;

  RoomService() {
    // GrpcChannel からチャンネルを取得
    _channel = GrpcChannel.createChannel();
    _stub = RoomServiceClient(_channel);
  }
  Future<CreateRoomResponse> createRoom(int gameId) async {
    final user = FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    if (idToken == null) {
      throw Exception('Failed to get Firebase ID token');
    }

    final options = CallOptions(metadata: {'Authorization': 'Bearer $idToken'});

    final request = CreateRoomRequest()..gameId = gameId;

    return await _stub.createRoom(request, options: options);
  }

  Future<JoinRoomResponse> joinRoom(int roomId) async {
    final user = FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    if (idToken == null) {
      throw Exception('Failed to get Firebase ID token');
    }

    final options = CallOptions(metadata: {'Authorization': 'Bearer $idToken'});

    final request = JoinRoomRequest()..roomId = roomId;

    return await _stub.joinRoom(request, options: options);
  }
  
}