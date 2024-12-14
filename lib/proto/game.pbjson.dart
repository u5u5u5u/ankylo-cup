//
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getGameListRequestDescriptor instead')
const GetGameListRequest$json = {
  '1': 'GetGameListRequest',
};

/// Descriptor for `GetGameListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGameListRequestDescriptor = $convert.base64Decode(
    'ChJHZXRHYW1lTGlzdFJlcXVlc3Q=');

@$core.Deprecated('Use getGameListResponseDescriptor instead')
const GetGameListResponse$json = {
  '1': 'GetGameListResponse',
  '2': [
    {'1': 'games', '3': 1, '4': 3, '5': 11, '6': '.models.Game', '10': 'games'},
  ],
};

/// Descriptor for `GetGameListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGameListResponseDescriptor = $convert.base64Decode(
    'ChNHZXRHYW1lTGlzdFJlc3BvbnNlEiIKBWdhbWVzGAEgAygLMgwubW9kZWxzLkdhbWVSBWdhbW'
    'Vz');

@$core.Deprecated('Use getGameByIdRequestDescriptor instead')
const GetGameByIdRequest$json = {
  '1': 'GetGameByIdRequest',
  '2': [
    {'1': 'game_id', '3': 1, '4': 1, '5': 5, '10': 'gameId'},
  ],
};

/// Descriptor for `GetGameByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGameByIdRequestDescriptor = $convert.base64Decode(
    'ChJHZXRHYW1lQnlJZFJlcXVlc3QSFwoHZ2FtZV9pZBgBIAEoBVIGZ2FtZUlk');

@$core.Deprecated('Use getGameByIdResponseDescriptor instead')
const GetGameByIdResponse$json = {
  '1': 'GetGameByIdResponse',
  '2': [
    {'1': 'game', '3': 1, '4': 1, '5': 11, '6': '.models.Game', '10': 'game'},
  ],
};

/// Descriptor for `GetGameByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGameByIdResponseDescriptor = $convert.base64Decode(
    'ChNHZXRHYW1lQnlJZFJlc3BvbnNlEiAKBGdhbWUYASABKAsyDC5tb2RlbHMuR2FtZVIEZ2FtZQ'
    '==');

