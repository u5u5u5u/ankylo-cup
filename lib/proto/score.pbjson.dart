//
//  Generated code. Do not modify.
//  source: score.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use recordScoreRequestDescriptor instead')
const RecordScoreRequest$json = {
  '1': 'RecordScoreRequest',
  '2': [
    {'1': 'game_id', '3': 1, '4': 1, '5': 5, '10': 'gameId'},
    {'1': 'score', '3': 2, '4': 1, '5': 5, '10': 'score'},
  ],
};

/// Descriptor for `RecordScoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordScoreRequestDescriptor = $convert.base64Decode(
    'ChJSZWNvcmRTY29yZVJlcXVlc3QSFwoHZ2FtZV9pZBgBIAEoBVIGZ2FtZUlkEhQKBXNjb3JlGA'
    'IgASgFUgVzY29yZQ==');

@$core.Deprecated('Use recordScoreResponseDescriptor instead')
const RecordScoreResponse$json = {
  '1': 'RecordScoreResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RecordScoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordScoreResponseDescriptor = $convert.base64Decode(
    'ChNSZWNvcmRTY29yZVJlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use getTop10ScoresByGameRequestDescriptor instead')
const GetTop10ScoresByGameRequest$json = {
  '1': 'GetTop10ScoresByGameRequest',
  '2': [
    {'1': 'game_id', '3': 1, '4': 1, '5': 5, '10': 'gameId'},
  ],
};

/// Descriptor for `GetTop10ScoresByGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTop10ScoresByGameRequestDescriptor = $convert.base64Decode(
    'ChtHZXRUb3AxMFNjb3Jlc0J5R2FtZVJlcXVlc3QSFwoHZ2FtZV9pZBgBIAEoBVIGZ2FtZUlk');

@$core.Deprecated('Use getTop10ScoresByGameResponseDescriptor instead')
const GetTop10ScoresByGameResponse$json = {
  '1': 'GetTop10ScoresByGameResponse',
  '2': [
    {'1': 'scores', '3': 1, '4': 3, '5': 11, '6': '.score.TopScoreEntry', '10': 'scores'},
  ],
};

/// Descriptor for `GetTop10ScoresByGameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTop10ScoresByGameResponseDescriptor = $convert.base64Decode(
    'ChxHZXRUb3AxMFNjb3Jlc0J5R2FtZVJlc3BvbnNlEiwKBnNjb3JlcxgBIAMoCzIULnNjb3JlLl'
    'RvcFNjb3JlRW50cnlSBnNjb3Jlcw==');

@$core.Deprecated('Use topScoreEntryDescriptor instead')
const TopScoreEntry$json = {
  '1': 'TopScoreEntry',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'score', '3': 2, '4': 1, '5': 5, '10': 'score'},
  ],
};

/// Descriptor for `TopScoreEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topScoreEntryDescriptor = $convert.base64Decode(
    'Cg1Ub3BTY29yZUVudHJ5EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIUCgVzY29yZRgCIAEoBV'
    'IFc2NvcmU=');

