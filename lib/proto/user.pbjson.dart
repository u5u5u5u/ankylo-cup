//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use signUpRequestDescriptor instead')
const SignUpRequest$json = {
  '1': 'SignUpRequest',
};

/// Descriptor for `SignUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpRequestDescriptor = $convert.base64Decode(
    'Cg1TaWduVXBSZXF1ZXN0');

@$core.Deprecated('Use signUpResponseDescriptor instead')
const SignUpResponse$json = {
  '1': 'SignUpResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'avatar_url', '3': 4, '4': 1, '5': 9, '10': 'avatarUrl'},
  ],
};

/// Descriptor for `SignUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpResponseDescriptor = $convert.base64Decode(
    'Cg5TaWduVXBSZXNwb25zZRIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSFAoFZW1haWwYAiABKA'
    'lSBWVtYWlsEiEKDGRpc3BsYXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSHQoKYXZhdGFyX3Vy'
    'bBgEIAEoCVIJYXZhdGFyVXJs');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEiEKDGRpc3BsYXlfbm'
    'FtZRgCIAEoCVILZGlzcGxheU5hbWU=');

@$core.Deprecated('Use addCoinRequestDescriptor instead')
const AddCoinRequest$json = {
  '1': 'AddCoinRequest',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 5, '10': 'amount'},
  ],
};

/// Descriptor for `AddCoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCoinRequestDescriptor = $convert.base64Decode(
    'Cg5BZGRDb2luUmVxdWVzdBIWCgZhbW91bnQYASABKAVSBmFtb3VudA==');

@$core.Deprecated('Use addCoinResponseDescriptor instead')
const AddCoinResponse$json = {
  '1': 'AddCoinResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AddCoinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCoinResponseDescriptor = $convert.base64Decode(
    'Cg9BZGRDb2luUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use getTop10ByCoinRequestDescriptor instead')
const GetTop10ByCoinRequest$json = {
  '1': 'GetTop10ByCoinRequest',
};

/// Descriptor for `GetTop10ByCoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTop10ByCoinRequestDescriptor = $convert.base64Decode(
    'ChVHZXRUb3AxMEJ5Q29pblJlcXVlc3Q=');

@$core.Deprecated('Use getTop10ByCoinResponseDescriptor instead')
const GetTop10ByCoinResponse$json = {
  '1': 'GetTop10ByCoinResponse',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.user.TopUserByCoin', '10': 'users'},
  ],
};

/// Descriptor for `GetTop10ByCoinResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTop10ByCoinResponseDescriptor = $convert.base64Decode(
    'ChZHZXRUb3AxMEJ5Q29pblJlc3BvbnNlEikKBXVzZXJzGAEgAygLMhMudXNlci5Ub3BVc2VyQn'
    'lDb2luUgV1c2Vycw==');

@$core.Deprecated('Use topUserByCoinDescriptor instead')
const TopUserByCoin$json = {
  '1': 'TopUserByCoin',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'coin', '3': 3, '4': 1, '5': 5, '10': 'coin'},
  ],
};

/// Descriptor for `TopUserByCoin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topUserByCoinDescriptor = $convert.base64Decode(
    'Cg1Ub3BVc2VyQnlDb2luEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIhCgxkaXNwbGF5X25hbW'
    'UYAiABKAlSC2Rpc3BsYXlOYW1lEhIKBGNvaW4YAyABKAVSBGNvaW4=');

