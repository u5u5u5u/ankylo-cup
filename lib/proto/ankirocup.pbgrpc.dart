//
//  Generated code. Do not modify.
//  source: ankirocup.proto
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

import 'ankirocup.pb.dart' as $0;

export 'ankirocup.pb.dart';

@$pb.GrpcServiceName('ankylo_up.UserService')
class UserServiceClient extends $grpc.Client {
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.GetUserResponse>(
      '/ankylo_up.UserService/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetUserResponse> getUser($0.GetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }
}

@$pb.GrpcServiceName('ankylo_up.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'ankylo_up.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.GetUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUserResponse> getUser_Pre($grpc.ServiceCall call, $async.Future<$0.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$0.GetUserResponse> getUser($grpc.ServiceCall call, $0.GetUserRequest request);
}
