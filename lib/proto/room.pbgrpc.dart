//
//  Generated code. Do not modify.
//  source: room.proto
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

import 'room.pb.dart' as $0;

export 'room.pb.dart';

@$pb.GrpcServiceName('room.RoomService')
class RoomServiceClient extends $grpc.Client {
  static final _$createRoom = $grpc.ClientMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
      '/room.RoomService/CreateRoom',
      ($0.CreateRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateRoomResponse.fromBuffer(value));
  static final _$joinRoom = $grpc.ClientMethod<$0.JoinRoomRequest, $0.JoinRoomResponse>(
      '/room.RoomService/JoinRoom',
      ($0.JoinRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.JoinRoomResponse.fromBuffer(value));
  static final _$startGame = $grpc.ClientMethod<$0.GameAction, $0.GameAction>(
      '/room.RoomService/StartGame',
      ($0.GameAction value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GameAction.fromBuffer(value));

  RoomServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateRoomResponse> createRoom($0.CreateRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.JoinRoomResponse> joinRoom($0.JoinRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$joinRoom, request, options: options);
  }

  $grpc.ResponseStream<$0.GameAction> startGame($async.Stream<$0.GameAction> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$startGame, request, options: options);
  }
}

@$pb.GrpcServiceName('room.RoomService')
abstract class RoomServiceBase extends $grpc.Service {
  $core.String get $name => 'room.RoomService';

  RoomServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRoomRequest, $0.CreateRoomResponse>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRoomRequest.fromBuffer(value),
        ($0.CreateRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.JoinRoomRequest, $0.JoinRoomResponse>(
        'JoinRoom',
        joinRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.JoinRoomRequest.fromBuffer(value),
        ($0.JoinRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GameAction, $0.GameAction>(
        'StartGame',
        startGame,
        true,
        true,
        ($core.List<$core.int> value) => $0.GameAction.fromBuffer(value),
        ($0.GameAction value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateRoomResponse> createRoom_Pre($grpc.ServiceCall call, $async.Future<$0.CreateRoomRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Future<$0.JoinRoomResponse> joinRoom_Pre($grpc.ServiceCall call, $async.Future<$0.JoinRoomRequest> request) async {
    return joinRoom(call, await request);
  }

  $async.Future<$0.CreateRoomResponse> createRoom($grpc.ServiceCall call, $0.CreateRoomRequest request);
  $async.Future<$0.JoinRoomResponse> joinRoom($grpc.ServiceCall call, $0.JoinRoomRequest request);
  $async.Stream<$0.GameAction> startGame($grpc.ServiceCall call, $async.Stream<$0.GameAction> request);
}
