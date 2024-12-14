import 'package:ankylo_cup/proto/game.pbgrpc.dart';
import 'package:ankylo_cup/services/grpc_channel.dart';
import 'package:grpc/grpc.dart';

class GameServices {
  late final ClientChannel _channel;
  late final GameServiceClient _stub;

  GameServices() {
    _channel = GrpcChannel.createChannel();
    _stub = GameServiceClient(_channel);
  }
  Future<GetGameListResponse> getGameList() async {
    try {
      final request = GetGameListRequest();
      final response = await _stub.getGameList(request);
      return response;
    } catch (e) {
      print('Error getting game list: $e');
      rethrow;
    }
  }

  Future<GetGameByIdResponse> getGame(int gameId) async {
    try {
      final request = GetGameByIdRequest()..gameId = gameId;
      final response = await _stub.getGameById(request);
      return response;
    } catch (e) {
      print('Error getting game: $e');
      rethrow;
    }
  }
}
