//
//  Generated code. Do not modify.
//  source: game.proto
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

import 'game.pb.dart' as $0;

export 'game.pb.dart';

@$pb.GrpcServiceName('game.GameService')
class GameServiceClient extends $grpc.Client {
  static final _$getGameList = $grpc.ClientMethod<$0.GetGameListRequest, $0.GetGameListResponse>(
      '/game.GameService/GetGameList',
      ($0.GetGameListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetGameListResponse.fromBuffer(value));
  static final _$getGameById = $grpc.ClientMethod<$0.GetGameByIdRequest, $0.GetGameByIdResponse>(
      '/game.GameService/GetGameById',
      ($0.GetGameByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetGameByIdResponse.fromBuffer(value));

  GameServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetGameListResponse> getGameList($0.GetGameListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGameList, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetGameByIdResponse> getGameById($0.GetGameByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGameById, request, options: options);
  }
}

@$pb.GrpcServiceName('game.GameService')
abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'game.GameService';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetGameListRequest, $0.GetGameListResponse>(
        'GetGameList',
        getGameList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetGameListRequest.fromBuffer(value),
        ($0.GetGameListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetGameByIdRequest, $0.GetGameByIdResponse>(
        'GetGameById',
        getGameById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetGameByIdRequest.fromBuffer(value),
        ($0.GetGameByIdResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetGameListResponse> getGameList_Pre($grpc.ServiceCall call, $async.Future<$0.GetGameListRequest> request) async {
    return getGameList(call, await request);
  }

  $async.Future<$0.GetGameByIdResponse> getGameById_Pre($grpc.ServiceCall call, $async.Future<$0.GetGameByIdRequest> request) async {
    return getGameById(call, await request);
  }

  $async.Future<$0.GetGameListResponse> getGameList($grpc.ServiceCall call, $0.GetGameListRequest request);
  $async.Future<$0.GetGameByIdResponse> getGameById($grpc.ServiceCall call, $0.GetGameByIdRequest request);
}
