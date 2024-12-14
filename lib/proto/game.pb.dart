//
//  Generated code. Do not modify.
//  source: game.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'models.pb.dart' as $1;

class GetGameListRequest extends $pb.GeneratedMessage {
  factory GetGameListRequest() => create();
  GetGameListRequest._() : super();
  factory GetGameListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGameListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGameListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGameListRequest clone() => GetGameListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGameListRequest copyWith(void Function(GetGameListRequest) updates) => super.copyWith((message) => updates(message as GetGameListRequest)) as GetGameListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGameListRequest create() => GetGameListRequest._();
  GetGameListRequest createEmptyInstance() => create();
  static $pb.PbList<GetGameListRequest> createRepeated() => $pb.PbList<GetGameListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGameListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGameListRequest>(create);
  static GetGameListRequest? _defaultInstance;
}

class GetGameListResponse extends $pb.GeneratedMessage {
  factory GetGameListResponse({
    $core.Iterable<$1.Game>? games,
  }) {
    final $result = create();
    if (games != null) {
      $result.games.addAll(games);
    }
    return $result;
  }
  GetGameListResponse._() : super();
  factory GetGameListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGameListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGameListResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game'), createEmptyInstance: create)
    ..pc<$1.Game>(1, _omitFieldNames ? '' : 'games', $pb.PbFieldType.PM, subBuilder: $1.Game.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGameListResponse clone() => GetGameListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGameListResponse copyWith(void Function(GetGameListResponse) updates) => super.copyWith((message) => updates(message as GetGameListResponse)) as GetGameListResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGameListResponse create() => GetGameListResponse._();
  GetGameListResponse createEmptyInstance() => create();
  static $pb.PbList<GetGameListResponse> createRepeated() => $pb.PbList<GetGameListResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGameListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGameListResponse>(create);
  static GetGameListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Game> get games => $_getList(0);
}

class GetGameByIdRequest extends $pb.GeneratedMessage {
  factory GetGameByIdRequest({
    $core.int? gameId,
  }) {
    final $result = create();
    if (gameId != null) {
      $result.gameId = gameId;
    }
    return $result;
  }
  GetGameByIdRequest._() : super();
  factory GetGameByIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGameByIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGameByIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'game'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'gameId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGameByIdRequest clone() => GetGameByIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGameByIdRequest copyWith(void Function(GetGameByIdRequest) updates) => super.copyWith((message) => updates(message as GetGameByIdRequest)) as GetGameByIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGameByIdRequest create() => GetGameByIdRequest._();
  GetGameByIdRequest createEmptyInstance() => create();
  static $pb.PbList<GetGameByIdRequest> createRepeated() => $pb.PbList<GetGameByIdRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGameByIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGameByIdRequest>(create);
  static GetGameByIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gameId => $_getIZ(0);
  @$pb.TagNumber(1)
  set gameId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);
}

class GetGameByIdResponse extends $pb.GeneratedMessage {
  factory GetGameByIdResponse({
    $1.Game? game,
  }) {
    final $result = create();
    if (game != null) {
      $result.game = game;
    }
    return $result;
  }
  GetGameByIdResponse._() : super();
  factory GetGameByIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetGameByIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGameByIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'game'), createEmptyInstance: create)
    ..aOM<$1.Game>(1, _omitFieldNames ? '' : 'game', subBuilder: $1.Game.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetGameByIdResponse clone() => GetGameByIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetGameByIdResponse copyWith(void Function(GetGameByIdResponse) updates) => super.copyWith((message) => updates(message as GetGameByIdResponse)) as GetGameByIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGameByIdResponse create() => GetGameByIdResponse._();
  GetGameByIdResponse createEmptyInstance() => create();
  static $pb.PbList<GetGameByIdResponse> createRepeated() => $pb.PbList<GetGameByIdResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGameByIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGameByIdResponse>(create);
  static GetGameByIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Game get game => $_getN(0);
  @$pb.TagNumber(1)
  set game($1.Game v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGame() => $_has(0);
  @$pb.TagNumber(1)
  void clearGame() => clearField(1);
  @$pb.TagNumber(1)
  $1.Game ensureGame() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
