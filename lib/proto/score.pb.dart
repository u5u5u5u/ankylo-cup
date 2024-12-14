//
//  Generated code. Do not modify.
//  source: score.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RecordScoreRequest extends $pb.GeneratedMessage {
  factory RecordScoreRequest({
    $core.int? gameId,
    $core.int? score,
  }) {
    final $result = create();
    if (gameId != null) {
      $result.gameId = gameId;
    }
    if (score != null) {
      $result.score = score;
    }
    return $result;
  }
  RecordScoreRequest._() : super();
  factory RecordScoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordScoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordScoreRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'score'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'gameId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'score', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordScoreRequest clone() => RecordScoreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordScoreRequest copyWith(void Function(RecordScoreRequest) updates) => super.copyWith((message) => updates(message as RecordScoreRequest)) as RecordScoreRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordScoreRequest create() => RecordScoreRequest._();
  RecordScoreRequest createEmptyInstance() => create();
  static $pb.PbList<RecordScoreRequest> createRepeated() => $pb.PbList<RecordScoreRequest>();
  @$core.pragma('dart2js:noInline')
  static RecordScoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordScoreRequest>(create);
  static RecordScoreRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gameId => $_getIZ(0);
  @$pb.TagNumber(1)
  set gameId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);
}

class RecordScoreResponse extends $pb.GeneratedMessage {
  factory RecordScoreResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  RecordScoreResponse._() : super();
  factory RecordScoreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordScoreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecordScoreResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'score'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordScoreResponse clone() => RecordScoreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordScoreResponse copyWith(void Function(RecordScoreResponse) updates) => super.copyWith((message) => updates(message as RecordScoreResponse)) as RecordScoreResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecordScoreResponse create() => RecordScoreResponse._();
  RecordScoreResponse createEmptyInstance() => create();
  static $pb.PbList<RecordScoreResponse> createRepeated() => $pb.PbList<RecordScoreResponse>();
  @$core.pragma('dart2js:noInline')
  static RecordScoreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordScoreResponse>(create);
  static RecordScoreResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class GetTop10ScoresByGameRequest extends $pb.GeneratedMessage {
  factory GetTop10ScoresByGameRequest({
    $core.int? gameId,
  }) {
    final $result = create();
    if (gameId != null) {
      $result.gameId = gameId;
    }
    return $result;
  }
  GetTop10ScoresByGameRequest._() : super();
  factory GetTop10ScoresByGameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTop10ScoresByGameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTop10ScoresByGameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'score'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'gameId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTop10ScoresByGameRequest clone() => GetTop10ScoresByGameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTop10ScoresByGameRequest copyWith(void Function(GetTop10ScoresByGameRequest) updates) => super.copyWith((message) => updates(message as GetTop10ScoresByGameRequest)) as GetTop10ScoresByGameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTop10ScoresByGameRequest create() => GetTop10ScoresByGameRequest._();
  GetTop10ScoresByGameRequest createEmptyInstance() => create();
  static $pb.PbList<GetTop10ScoresByGameRequest> createRepeated() => $pb.PbList<GetTop10ScoresByGameRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTop10ScoresByGameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTop10ScoresByGameRequest>(create);
  static GetTop10ScoresByGameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gameId => $_getIZ(0);
  @$pb.TagNumber(1)
  set gameId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);
}

class GetTop10ScoresByGameResponse extends $pb.GeneratedMessage {
  factory GetTop10ScoresByGameResponse({
    $core.Iterable<TopScoreEntry>? scores,
  }) {
    final $result = create();
    if (scores != null) {
      $result.scores.addAll(scores);
    }
    return $result;
  }
  GetTop10ScoresByGameResponse._() : super();
  factory GetTop10ScoresByGameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTop10ScoresByGameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTop10ScoresByGameResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'score'), createEmptyInstance: create)
    ..pc<TopScoreEntry>(1, _omitFieldNames ? '' : 'scores', $pb.PbFieldType.PM, subBuilder: TopScoreEntry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTop10ScoresByGameResponse clone() => GetTop10ScoresByGameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTop10ScoresByGameResponse copyWith(void Function(GetTop10ScoresByGameResponse) updates) => super.copyWith((message) => updates(message as GetTop10ScoresByGameResponse)) as GetTop10ScoresByGameResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTop10ScoresByGameResponse create() => GetTop10ScoresByGameResponse._();
  GetTop10ScoresByGameResponse createEmptyInstance() => create();
  static $pb.PbList<GetTop10ScoresByGameResponse> createRepeated() => $pb.PbList<GetTop10ScoresByGameResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTop10ScoresByGameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTop10ScoresByGameResponse>(create);
  static GetTop10ScoresByGameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TopScoreEntry> get scores => $_getList(0);
}

class TopScoreEntry extends $pb.GeneratedMessage {
  factory TopScoreEntry({
    $core.String? userId,
    $core.int? score,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (score != null) {
      $result.score = score;
    }
    return $result;
  }
  TopScoreEntry._() : super();
  factory TopScoreEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopScoreEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TopScoreEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'score'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'score', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopScoreEntry clone() => TopScoreEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopScoreEntry copyWith(void Function(TopScoreEntry) updates) => super.copyWith((message) => updates(message as TopScoreEntry)) as TopScoreEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TopScoreEntry create() => TopScoreEntry._();
  TopScoreEntry createEmptyInstance() => create();
  static $pb.PbList<TopScoreEntry> createRepeated() => $pb.PbList<TopScoreEntry>();
  @$core.pragma('dart2js:noInline')
  static TopScoreEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopScoreEntry>(create);
  static TopScoreEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get score => $_getIZ(1);
  @$pb.TagNumber(2)
  set score($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearScore() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
