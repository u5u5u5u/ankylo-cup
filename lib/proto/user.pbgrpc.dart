//
//  Generated code. Do not modify.
//  source: user.proto
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

import 'user.pb.dart' as $0;

export 'user.pb.dart';

@$pb.GrpcServiceName('user.UserService')
class UserServiceClient extends $grpc.Client {
  static final _$signUp = $grpc.ClientMethod<$0.SignUpRequest, $0.SignUpResponse>(
      '/user.UserService/SignUp',
      ($0.SignUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignUpResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.GetUserResponse>(
      '/user.UserService/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserResponse.fromBuffer(value));
  static final _$addCoin = $grpc.ClientMethod<$0.AddCoinRequest, $0.AddCoinResponse>(
      '/user.UserService/AddCoin',
      ($0.AddCoinRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddCoinResponse.fromBuffer(value));
  static final _$getTop10ByCoin = $grpc.ClientMethod<$0.GetTop10ByCoinRequest, $0.GetTop10ByCoinResponse>(
      '/user.UserService/GetTop10ByCoin',
      ($0.GetTop10ByCoinRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetTop10ByCoinResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.SignUpResponse> signUp($0.SignUpRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserResponse> getUser($0.GetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddCoinResponse> addCoin($0.AddCoinRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addCoin, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTop10ByCoinResponse> getTop10ByCoin($0.GetTop10ByCoinRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTop10ByCoin, request, options: options);
  }
}

@$pb.GrpcServiceName('user.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignUpRequest, $0.SignUpResponse>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignUpRequest.fromBuffer(value),
        ($0.SignUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.GetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddCoinRequest, $0.AddCoinResponse>(
        'AddCoin',
        addCoin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddCoinRequest.fromBuffer(value),
        ($0.AddCoinResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTop10ByCoinRequest, $0.GetTop10ByCoinResponse>(
        'GetTop10ByCoin',
        getTop10ByCoin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTop10ByCoinRequest.fromBuffer(value),
        ($0.GetTop10ByCoinResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignUpResponse> signUp_Pre($grpc.ServiceCall call, $async.Future<$0.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$0.GetUserResponse> getUser_Pre($grpc.ServiceCall call, $async.Future<$0.GetUserRequest> request) async {
    return getUser(call, await request);
  }

  $async.Future<$0.AddCoinResponse> addCoin_Pre($grpc.ServiceCall call, $async.Future<$0.AddCoinRequest> request) async {
    return addCoin(call, await request);
  }

  $async.Future<$0.GetTop10ByCoinResponse> getTop10ByCoin_Pre($grpc.ServiceCall call, $async.Future<$0.GetTop10ByCoinRequest> request) async {
    return getTop10ByCoin(call, await request);
  }

  $async.Future<$0.SignUpResponse> signUp($grpc.ServiceCall call, $0.SignUpRequest request);
  $async.Future<$0.GetUserResponse> getUser($grpc.ServiceCall call, $0.GetUserRequest request);
  $async.Future<$0.AddCoinResponse> addCoin($grpc.ServiceCall call, $0.AddCoinRequest request);
  $async.Future<$0.GetTop10ByCoinResponse> getTop10ByCoin($grpc.ServiceCall call, $0.GetTop10ByCoinRequest request);
}
