import 'package:ankylo_cup/proto/score.pbgrpc.dart';
import 'package:ankylo_cup/services/grpc_channel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';

class ScoreService {
  late final ClientChannel _channel;
  late final ScoreServiceClient _stub;

  UserService() {
    // GrpcChannel からチャンネルを取得
    _channel = GrpcChannel.createChannel();
    _stub = ScoreServiceClient(_channel);
  }
  Future<RecordScoreResponse> recordScore(int score) async {
    final user = FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    if (idToken == null) {
      throw Exception('Failed to get Firebase ID token');
    }

    final options = CallOptions(metadata: {'Authorization': 'Bearer $idToken'});

    final request = RecordScoreRequest()..score = score;

    return await _stub.recordScore(request, options: options);
  }

  Future<GetTop10ScoresByGameResponse> getTop10ScoresByGame(int gameId) async {
    final user = FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    if (idToken == null) {
      throw Exception('Failed to get Firebase ID token');
    }

    final options = CallOptions(metadata: {'Authorization': 'Bearer $idToken'});

    final request = GetTop10ScoresByGameRequest()..gameId = gameId;

    return await _stub.getTop10ScoresByGame(request, options: options);
  }
}
