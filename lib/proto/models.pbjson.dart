//
//  Generated code. Do not modify.
//  source: models.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'avatar_url', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'coin', '3': 6, '4': 1, '5': 5, '10': 'coin'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBIhCgxkaXNwbGF5X25hbWUYAiABKAlSC2Rpc3BsYXlOYW'
    '1lEh0KCmF2YXRhcl91cmwYAyABKAlSCWF2YXRhclVybBI5CgpjcmVhdGVkX2F0GAQgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYBSABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQSEgoEY29pbhgGIAEoBVIE'
    'Y29pbg==');

@$core.Deprecated('Use gameDescriptor instead')
const Game$json = {
  '1': 'Game',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'max_players', '3': 3, '4': 1, '5': 5, '10': 'maxPlayers'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Game`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameDescriptor = $convert.base64Decode(
    'CgRHYW1lEg4KAmlkGAEgASgFUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEh8KC21heF9wbGF5ZX'
    'JzGAMgASgFUgptYXhQbGF5ZXJzEjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use roomDescriptor instead')
const Room$json = {
  '1': 'Room',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'game_id', '3': 2, '4': 1, '5': 5, '10': 'gameId'},
    {'1': 'player1_id', '3': 3, '4': 1, '5': 9, '10': 'player1Id'},
    {'1': 'player2_id', '3': 4, '4': 1, '5': 9, '10': 'player2Id'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode(
    'CgRSb29tEg4KAmlkGAEgASgFUgJpZBIXCgdnYW1lX2lkGAIgASgFUgZnYW1lSWQSHQoKcGxheW'
    'VyMV9pZBgDIAEoCVIJcGxheWVyMUlkEh0KCnBsYXllcjJfaWQYBCABKAlSCXBsYXllcjJJZBIW'
    'CgZzdGF0dXMYBSABKAlSBnN0YXR1cxI5CgpjcmVhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYByABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use scoreDescriptor instead')
const Score$json = {
  '1': 'Score',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'game_id', '3': 3, '4': 1, '5': 5, '10': 'gameId'},
    {'1': 'score', '3': 4, '4': 1, '5': 5, '10': 'score'},
    {'1': 'played_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'playedAt'},
  ],
};

/// Descriptor for `Score`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scoreDescriptor = $convert.base64Decode(
    'CgVTY29yZRIOCgJpZBgBIAEoBVICaWQSFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklkEhcKB2dhbW'
    'VfaWQYAyABKAVSBmdhbWVJZBIUCgVzY29yZRgEIAEoBVIFc2NvcmUSNwoJcGxheWVkX2F0GAUg'
    'ASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIcGxheWVkQXQ=');

