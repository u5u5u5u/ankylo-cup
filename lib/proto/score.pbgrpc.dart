//
//  Generated code. Do not modify.
//  source: score.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'score.pb.dart' as $0;

export 'score.pb.dart';

@$pb.GrpcServiceName('score.ScoreService')
class ScoreServiceClient extends $grpc.Client {
  static final _$recordScore = $grpc.ClientMethod<$0.RecordScoreRequest, $0.RecordScoreResponse>(
      '/score.ScoreService/RecordScore',
      ($0.RecordScoreRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RecordScoreResponse.fromBuffer(value));
  static final _$getTop10ScoresByGame = $grpc.ClientMethod<$0.GetTop10ScoresByGameRequest, $0.GetTop10ScoresByGameResponse>(
      '/score.ScoreService/GetTop10ScoresByGame',
      ($0.GetTop10ScoresByGameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTop10ScoresByGameResponse.fromBuffer(value));

  ScoreServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.RecordScoreResponse> recordScore($0.RecordScoreRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$recordScore, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTop10ScoresByGameResponse> getTop10ScoresByGame($0.GetTop10ScoresByGameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTop10ScoresByGame, request, options: options);
  }
}

@$pb.GrpcServiceName('score.ScoreService')
abstract class ScoreServiceBase extends $grpc.Service {
  $core.String get $name => 'score.ScoreService';

  ScoreServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RecordScoreRequest, $0.RecordScoreResponse>(
        'RecordScore',
        recordScore_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RecordScoreRequest.fromBuffer(value),
        ($0.RecordScoreResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTop10ScoresByGameRequest, $0.GetTop10ScoresByGameResponse>(
        'GetTop10ScoresByGame',
        getTop10ScoresByGame_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTop10ScoresByGameRequest.fromBuffer(value),
        ($0.GetTop10ScoresByGameResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RecordScoreResponse> recordScore_Pre($grpc.ServiceCall call, $async.Future<$0.RecordScoreRequest> request) async {
    return recordScore(call, await request);
  }

  $async.Future<$0.GetTop10ScoresByGameResponse> getTop10ScoresByGame_Pre($grpc.ServiceCall call, $async.Future<$0.GetTop10ScoresByGameRequest> request) async {
    return getTop10ScoresByGame(call, await request);
  }

  $async.Future<$0.RecordScoreResponse> recordScore($grpc.ServiceCall call, $0.RecordScoreRequest request);
  $async.Future<$0.GetTop10ScoresByGameResponse> getTop10ScoresByGame($grpc.ServiceCall call, $0.GetTop10ScoresByGameRequest request);
}
