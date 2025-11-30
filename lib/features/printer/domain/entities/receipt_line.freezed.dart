// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReceiptLine {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, TextAlign align, bool bold) text,
    required TResult Function(String left, String right, bool bold) row,
    required TResult Function(String char) separator,
    required TResult Function() empty,
    required TResult Function(String text, TextAlign align, bool bold) header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, TextAlign align, bool bold)? text,
    TResult? Function(String left, String right, bool bold)? row,
    TResult? Function(String char)? separator,
    TResult? Function()? empty,
    TResult? Function(String text, TextAlign align, bool bold)? header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, TextAlign align, bool bold)? text,
    TResult Function(String left, String right, bool bold)? row,
    TResult Function(String char)? separator,
    TResult Function()? empty,
    TResult Function(String text, TextAlign align, bool bold)? header,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReceiptLineText value) text,
    required TResult Function(ReceiptLineRow value) row,
    required TResult Function(ReceiptLineSeparator value) separator,
    required TResult Function(ReceiptLineEmpty value) empty,
    required TResult Function(ReceiptLineHeader value) header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReceiptLineText value)? text,
    TResult? Function(ReceiptLineRow value)? row,
    TResult? Function(ReceiptLineSeparator value)? separator,
    TResult? Function(ReceiptLineEmpty value)? empty,
    TResult? Function(ReceiptLineHeader value)? header,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReceiptLineText value)? text,
    TResult Function(ReceiptLineRow value)? row,
    TResult Function(ReceiptLineSeparator value)? separator,
    TResult Function(ReceiptLineEmpty value)? empty,
    TResult Function(ReceiptLineHeader value)? header,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptLineCopyWith<$Res> {
  factory $ReceiptLineCopyWith(
          ReceiptLine value, $Res Function(ReceiptLine) then) =
      _$ReceiptLineCopyWithImpl<$Res, ReceiptLine>;
}

/// @nodoc
class _$ReceiptLineCopyWithImpl<$Res, $Val extends ReceiptLine>
    implements $ReceiptLineCopyWith<$Res> {
  _$ReceiptLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ReceiptLineTextImplCopyWith<$Res> {
  factory _$$ReceiptLineTextImplCopyWith(_$ReceiptLineTextImpl value,
          $Res Function(_$ReceiptLineTextImpl) then) =
      __$$ReceiptLineTextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, TextAlign align, bool bold});
}

/// @nodoc
class __$$ReceiptLineTextImplCopyWithImpl<$Res>
    extends _$ReceiptLineCopyWithImpl<$Res, _$ReceiptLineTextImpl>
    implements _$$ReceiptLineTextImplCopyWith<$Res> {
  __$$ReceiptLineTextImplCopyWithImpl(
      _$ReceiptLineTextImpl _value, $Res Function(_$ReceiptLineTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? align = null,
    Object? bold = null,
  }) {
    return _then(_$ReceiptLineTextImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      align: null == align
          ? _value.align
          : align // ignore: cast_nullable_to_non_nullable
              as TextAlign,
      bold: null == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReceiptLineTextImpl extends ReceiptLineText {
  const _$ReceiptLineTextImpl(
      {required this.text, this.align = TextAlign.left, this.bold = false})
      : super._();

  @override
  final String text;
  @override
  @JsonKey()
  final TextAlign align;
  @override
  @JsonKey()
  final bool bold;

  @override
  String toString() {
    return 'ReceiptLine.text(text: $text, align: $align, bold: $bold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptLineTextImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.align, align) || other.align == align) &&
            (identical(other.bold, bold) || other.bold == bold));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, align, bold);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptLineTextImplCopyWith<_$ReceiptLineTextImpl> get copyWith =>
      __$$ReceiptLineTextImplCopyWithImpl<_$ReceiptLineTextImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, TextAlign align, bool bold) text,
    required TResult Function(String left, String right, bool bold) row,
    required TResult Function(String char) separator,
    required TResult Function() empty,
    required TResult Function(String text, TextAlign align, bool bold) header,
  }) {
    return text(this.text, align, bold);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, TextAlign align, bool bold)? text,
    TResult? Function(String left, String right, bool bold)? row,
    TResult? Function(String char)? separator,
    TResult? Function()? empty,
    TResult? Function(String text, TextAlign align, bool bold)? header,
  }) {
    return text?.call(this.text, align, bold);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, TextAlign align, bool bold)? text,
    TResult Function(String left, String right, bool bold)? row,
    TResult Function(String char)? separator,
    TResult Function()? empty,
    TResult Function(String text, TextAlign align, bool bold)? header,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text, align, bold);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReceiptLineText value) text,
    required TResult Function(ReceiptLineRow value) row,
    required TResult Function(ReceiptLineSeparator value) separator,
    required TResult Function(ReceiptLineEmpty value) empty,
    required TResult Function(ReceiptLineHeader value) header,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReceiptLineText value)? text,
    TResult? Function(ReceiptLineRow value)? row,
    TResult? Function(ReceiptLineSeparator value)? separator,
    TResult? Function(ReceiptLineEmpty value)? empty,
    TResult? Function(ReceiptLineHeader value)? header,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReceiptLineText value)? text,
    TResult Function(ReceiptLineRow value)? row,
    TResult Function(ReceiptLineSeparator value)? separator,
    TResult Function(ReceiptLineEmpty value)? empty,
    TResult Function(ReceiptLineHeader value)? header,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class ReceiptLineText extends ReceiptLine {
  const factory ReceiptLineText(
      {required final String text,
      final TextAlign align,
      final bool bold}) = _$ReceiptLineTextImpl;
  const ReceiptLineText._() : super._();

  String get text;
  TextAlign get align;
  bool get bold;

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptLineTextImplCopyWith<_$ReceiptLineTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiptLineRowImplCopyWith<$Res> {
  factory _$$ReceiptLineRowImplCopyWith(_$ReceiptLineRowImpl value,
          $Res Function(_$ReceiptLineRowImpl) then) =
      __$$ReceiptLineRowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String left, String right, bool bold});
}

/// @nodoc
class __$$ReceiptLineRowImplCopyWithImpl<$Res>
    extends _$ReceiptLineCopyWithImpl<$Res, _$ReceiptLineRowImpl>
    implements _$$ReceiptLineRowImplCopyWith<$Res> {
  __$$ReceiptLineRowImplCopyWithImpl(
      _$ReceiptLineRowImpl _value, $Res Function(_$ReceiptLineRowImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? right = null,
    Object? bold = null,
  }) {
    return _then(_$ReceiptLineRowImpl(
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as String,
      right: null == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as String,
      bold: null == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReceiptLineRowImpl extends ReceiptLineRow {
  const _$ReceiptLineRowImpl(
      {required this.left, required this.right, this.bold = false})
      : super._();

  @override
  final String left;
  @override
  final String right;
  @override
  @JsonKey()
  final bool bold;

  @override
  String toString() {
    return 'ReceiptLine.row(left: $left, right: $right, bold: $bold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptLineRowImpl &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.right, right) || other.right == right) &&
            (identical(other.bold, bold) || other.bold == bold));
  }

  @override
  int get hashCode => Object.hash(runtimeType, left, right, bold);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptLineRowImplCopyWith<_$ReceiptLineRowImpl> get copyWith =>
      __$$ReceiptLineRowImplCopyWithImpl<_$ReceiptLineRowImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, TextAlign align, bool bold) text,
    required TResult Function(String left, String right, bool bold) row,
    required TResult Function(String char) separator,
    required TResult Function() empty,
    required TResult Function(String text, TextAlign align, bool bold) header,
  }) {
    return row(left, right, bold);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, TextAlign align, bool bold)? text,
    TResult? Function(String left, String right, bool bold)? row,
    TResult? Function(String char)? separator,
    TResult? Function()? empty,
    TResult? Function(String text, TextAlign align, bool bold)? header,
  }) {
    return row?.call(left, right, bold);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, TextAlign align, bool bold)? text,
    TResult Function(String left, String right, bool bold)? row,
    TResult Function(String char)? separator,
    TResult Function()? empty,
    TResult Function(String text, TextAlign align, bool bold)? header,
    required TResult orElse(),
  }) {
    if (row != null) {
      return row(left, right, bold);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReceiptLineText value) text,
    required TResult Function(ReceiptLineRow value) row,
    required TResult Function(ReceiptLineSeparator value) separator,
    required TResult Function(ReceiptLineEmpty value) empty,
    required TResult Function(ReceiptLineHeader value) header,
  }) {
    return row(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReceiptLineText value)? text,
    TResult? Function(ReceiptLineRow value)? row,
    TResult? Function(ReceiptLineSeparator value)? separator,
    TResult? Function(ReceiptLineEmpty value)? empty,
    TResult? Function(ReceiptLineHeader value)? header,
  }) {
    return row?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReceiptLineText value)? text,
    TResult Function(ReceiptLineRow value)? row,
    TResult Function(ReceiptLineSeparator value)? separator,
    TResult Function(ReceiptLineEmpty value)? empty,
    TResult Function(ReceiptLineHeader value)? header,
    required TResult orElse(),
  }) {
    if (row != null) {
      return row(this);
    }
    return orElse();
  }
}

abstract class ReceiptLineRow extends ReceiptLine {
  const factory ReceiptLineRow(
      {required final String left,
      required final String right,
      final bool bold}) = _$ReceiptLineRowImpl;
  const ReceiptLineRow._() : super._();

  String get left;
  String get right;
  bool get bold;

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptLineRowImplCopyWith<_$ReceiptLineRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiptLineSeparatorImplCopyWith<$Res> {
  factory _$$ReceiptLineSeparatorImplCopyWith(_$ReceiptLineSeparatorImpl value,
          $Res Function(_$ReceiptLineSeparatorImpl) then) =
      __$$ReceiptLineSeparatorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String char});
}

/// @nodoc
class __$$ReceiptLineSeparatorImplCopyWithImpl<$Res>
    extends _$ReceiptLineCopyWithImpl<$Res, _$ReceiptLineSeparatorImpl>
    implements _$$ReceiptLineSeparatorImplCopyWith<$Res> {
  __$$ReceiptLineSeparatorImplCopyWithImpl(_$ReceiptLineSeparatorImpl _value,
      $Res Function(_$ReceiptLineSeparatorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? char = null,
  }) {
    return _then(_$ReceiptLineSeparatorImpl(
      char: null == char
          ? _value.char
          : char // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReceiptLineSeparatorImpl extends ReceiptLineSeparator {
  const _$ReceiptLineSeparatorImpl({this.char = '-'}) : super._();

  @override
  @JsonKey()
  final String char;

  @override
  String toString() {
    return 'ReceiptLine.separator(char: $char)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptLineSeparatorImpl &&
            (identical(other.char, char) || other.char == char));
  }

  @override
  int get hashCode => Object.hash(runtimeType, char);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptLineSeparatorImplCopyWith<_$ReceiptLineSeparatorImpl>
      get copyWith =>
          __$$ReceiptLineSeparatorImplCopyWithImpl<_$ReceiptLineSeparatorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, TextAlign align, bool bold) text,
    required TResult Function(String left, String right, bool bold) row,
    required TResult Function(String char) separator,
    required TResult Function() empty,
    required TResult Function(String text, TextAlign align, bool bold) header,
  }) {
    return separator(char);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, TextAlign align, bool bold)? text,
    TResult? Function(String left, String right, bool bold)? row,
    TResult? Function(String char)? separator,
    TResult? Function()? empty,
    TResult? Function(String text, TextAlign align, bool bold)? header,
  }) {
    return separator?.call(char);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, TextAlign align, bool bold)? text,
    TResult Function(String left, String right, bool bold)? row,
    TResult Function(String char)? separator,
    TResult Function()? empty,
    TResult Function(String text, TextAlign align, bool bold)? header,
    required TResult orElse(),
  }) {
    if (separator != null) {
      return separator(char);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReceiptLineText value) text,
    required TResult Function(ReceiptLineRow value) row,
    required TResult Function(ReceiptLineSeparator value) separator,
    required TResult Function(ReceiptLineEmpty value) empty,
    required TResult Function(ReceiptLineHeader value) header,
  }) {
    return separator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReceiptLineText value)? text,
    TResult? Function(ReceiptLineRow value)? row,
    TResult? Function(ReceiptLineSeparator value)? separator,
    TResult? Function(ReceiptLineEmpty value)? empty,
    TResult? Function(ReceiptLineHeader value)? header,
  }) {
    return separator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReceiptLineText value)? text,
    TResult Function(ReceiptLineRow value)? row,
    TResult Function(ReceiptLineSeparator value)? separator,
    TResult Function(ReceiptLineEmpty value)? empty,
    TResult Function(ReceiptLineHeader value)? header,
    required TResult orElse(),
  }) {
    if (separator != null) {
      return separator(this);
    }
    return orElse();
  }
}

abstract class ReceiptLineSeparator extends ReceiptLine {
  const factory ReceiptLineSeparator({final String char}) =
      _$ReceiptLineSeparatorImpl;
  const ReceiptLineSeparator._() : super._();

  String get char;

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptLineSeparatorImplCopyWith<_$ReceiptLineSeparatorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiptLineEmptyImplCopyWith<$Res> {
  factory _$$ReceiptLineEmptyImplCopyWith(_$ReceiptLineEmptyImpl value,
          $Res Function(_$ReceiptLineEmptyImpl) then) =
      __$$ReceiptLineEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReceiptLineEmptyImplCopyWithImpl<$Res>
    extends _$ReceiptLineCopyWithImpl<$Res, _$ReceiptLineEmptyImpl>
    implements _$$ReceiptLineEmptyImplCopyWith<$Res> {
  __$$ReceiptLineEmptyImplCopyWithImpl(_$ReceiptLineEmptyImpl _value,
      $Res Function(_$ReceiptLineEmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReceiptLineEmptyImpl extends ReceiptLineEmpty {
  const _$ReceiptLineEmptyImpl() : super._();

  @override
  String toString() {
    return 'ReceiptLine.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReceiptLineEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, TextAlign align, bool bold) text,
    required TResult Function(String left, String right, bool bold) row,
    required TResult Function(String char) separator,
    required TResult Function() empty,
    required TResult Function(String text, TextAlign align, bool bold) header,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, TextAlign align, bool bold)? text,
    TResult? Function(String left, String right, bool bold)? row,
    TResult? Function(String char)? separator,
    TResult? Function()? empty,
    TResult? Function(String text, TextAlign align, bool bold)? header,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, TextAlign align, bool bold)? text,
    TResult Function(String left, String right, bool bold)? row,
    TResult Function(String char)? separator,
    TResult Function()? empty,
    TResult Function(String text, TextAlign align, bool bold)? header,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReceiptLineText value) text,
    required TResult Function(ReceiptLineRow value) row,
    required TResult Function(ReceiptLineSeparator value) separator,
    required TResult Function(ReceiptLineEmpty value) empty,
    required TResult Function(ReceiptLineHeader value) header,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReceiptLineText value)? text,
    TResult? Function(ReceiptLineRow value)? row,
    TResult? Function(ReceiptLineSeparator value)? separator,
    TResult? Function(ReceiptLineEmpty value)? empty,
    TResult? Function(ReceiptLineHeader value)? header,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReceiptLineText value)? text,
    TResult Function(ReceiptLineRow value)? row,
    TResult Function(ReceiptLineSeparator value)? separator,
    TResult Function(ReceiptLineEmpty value)? empty,
    TResult Function(ReceiptLineHeader value)? header,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ReceiptLineEmpty extends ReceiptLine {
  const factory ReceiptLineEmpty() = _$ReceiptLineEmptyImpl;
  const ReceiptLineEmpty._() : super._();
}

/// @nodoc
abstract class _$$ReceiptLineHeaderImplCopyWith<$Res> {
  factory _$$ReceiptLineHeaderImplCopyWith(_$ReceiptLineHeaderImpl value,
          $Res Function(_$ReceiptLineHeaderImpl) then) =
      __$$ReceiptLineHeaderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, TextAlign align, bool bold});
}

/// @nodoc
class __$$ReceiptLineHeaderImplCopyWithImpl<$Res>
    extends _$ReceiptLineCopyWithImpl<$Res, _$ReceiptLineHeaderImpl>
    implements _$$ReceiptLineHeaderImplCopyWith<$Res> {
  __$$ReceiptLineHeaderImplCopyWithImpl(_$ReceiptLineHeaderImpl _value,
      $Res Function(_$ReceiptLineHeaderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? align = null,
    Object? bold = null,
  }) {
    return _then(_$ReceiptLineHeaderImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      align: null == align
          ? _value.align
          : align // ignore: cast_nullable_to_non_nullable
              as TextAlign,
      bold: null == bold
          ? _value.bold
          : bold // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReceiptLineHeaderImpl extends ReceiptLineHeader {
  const _$ReceiptLineHeaderImpl(
      {required this.text, this.align = TextAlign.center, this.bold = true})
      : super._();

  @override
  final String text;
  @override
  @JsonKey()
  final TextAlign align;
  @override
  @JsonKey()
  final bool bold;

  @override
  String toString() {
    return 'ReceiptLine.header(text: $text, align: $align, bold: $bold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptLineHeaderImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.align, align) || other.align == align) &&
            (identical(other.bold, bold) || other.bold == bold));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, align, bold);

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptLineHeaderImplCopyWith<_$ReceiptLineHeaderImpl> get copyWith =>
      __$$ReceiptLineHeaderImplCopyWithImpl<_$ReceiptLineHeaderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text, TextAlign align, bool bold) text,
    required TResult Function(String left, String right, bool bold) row,
    required TResult Function(String char) separator,
    required TResult Function() empty,
    required TResult Function(String text, TextAlign align, bool bold) header,
  }) {
    return header(this.text, align, bold);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text, TextAlign align, bool bold)? text,
    TResult? Function(String left, String right, bool bold)? row,
    TResult? Function(String char)? separator,
    TResult? Function()? empty,
    TResult? Function(String text, TextAlign align, bool bold)? header,
  }) {
    return header?.call(this.text, align, bold);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text, TextAlign align, bool bold)? text,
    TResult Function(String left, String right, bool bold)? row,
    TResult Function(String char)? separator,
    TResult Function()? empty,
    TResult Function(String text, TextAlign align, bool bold)? header,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(this.text, align, bold);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReceiptLineText value) text,
    required TResult Function(ReceiptLineRow value) row,
    required TResult Function(ReceiptLineSeparator value) separator,
    required TResult Function(ReceiptLineEmpty value) empty,
    required TResult Function(ReceiptLineHeader value) header,
  }) {
    return header(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReceiptLineText value)? text,
    TResult? Function(ReceiptLineRow value)? row,
    TResult? Function(ReceiptLineSeparator value)? separator,
    TResult? Function(ReceiptLineEmpty value)? empty,
    TResult? Function(ReceiptLineHeader value)? header,
  }) {
    return header?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReceiptLineText value)? text,
    TResult Function(ReceiptLineRow value)? row,
    TResult Function(ReceiptLineSeparator value)? separator,
    TResult Function(ReceiptLineEmpty value)? empty,
    TResult Function(ReceiptLineHeader value)? header,
    required TResult orElse(),
  }) {
    if (header != null) {
      return header(this);
    }
    return orElse();
  }
}

abstract class ReceiptLineHeader extends ReceiptLine {
  const factory ReceiptLineHeader(
      {required final String text,
      final TextAlign align,
      final bool bold}) = _$ReceiptLineHeaderImpl;
  const ReceiptLineHeader._() : super._();

  String get text;
  TextAlign get align;
  bool get bold;

  /// Create a copy of ReceiptLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptLineHeaderImplCopyWith<_$ReceiptLineHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Receipt {
  List<ReceiptLine> get lines => throw _privateConstructorUsedError;
  PaperSize get paperSize => throw _privateConstructorUsedError;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptCopyWith<Receipt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptCopyWith<$Res> {
  factory $ReceiptCopyWith(Receipt value, $Res Function(Receipt) then) =
      _$ReceiptCopyWithImpl<$Res, Receipt>;
  @useResult
  $Res call({List<ReceiptLine> lines, PaperSize paperSize});
}

/// @nodoc
class _$ReceiptCopyWithImpl<$Res, $Val extends Receipt>
    implements $ReceiptCopyWith<$Res> {
  _$ReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
    Object? paperSize = null,
  }) {
    return _then(_value.copyWith(
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<ReceiptLine>,
      paperSize: null == paperSize
          ? _value.paperSize
          : paperSize // ignore: cast_nullable_to_non_nullable
              as PaperSize,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptImplCopyWith<$Res> implements $ReceiptCopyWith<$Res> {
  factory _$$ReceiptImplCopyWith(
          _$ReceiptImpl value, $Res Function(_$ReceiptImpl) then) =
      __$$ReceiptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReceiptLine> lines, PaperSize paperSize});
}

/// @nodoc
class __$$ReceiptImplCopyWithImpl<$Res>
    extends _$ReceiptCopyWithImpl<$Res, _$ReceiptImpl>
    implements _$$ReceiptImplCopyWith<$Res> {
  __$$ReceiptImplCopyWithImpl(
      _$ReceiptImpl _value, $Res Function(_$ReceiptImpl) _then)
      : super(_value, _then);

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
    Object? paperSize = null,
  }) {
    return _then(_$ReceiptImpl(
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<ReceiptLine>,
      paperSize: null == paperSize
          ? _value.paperSize
          : paperSize // ignore: cast_nullable_to_non_nullable
              as PaperSize,
    ));
  }
}

/// @nodoc

class _$ReceiptImpl extends _Receipt {
  const _$ReceiptImpl(
      {required final List<ReceiptLine> lines, this.paperSize = PaperSize.mm80})
      : _lines = lines,
        super._();

  final List<ReceiptLine> _lines;
  @override
  List<ReceiptLine> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  @JsonKey()
  final PaperSize paperSize;

  @override
  String toString() {
    return 'Receipt(lines: $lines, paperSize: $paperSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptImpl &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            (identical(other.paperSize, paperSize) ||
                other.paperSize == paperSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_lines), paperSize);

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptImplCopyWith<_$ReceiptImpl> get copyWith =>
      __$$ReceiptImplCopyWithImpl<_$ReceiptImpl>(this, _$identity);
}

abstract class _Receipt extends Receipt {
  const factory _Receipt(
      {required final List<ReceiptLine> lines,
      final PaperSize paperSize}) = _$ReceiptImpl;
  const _Receipt._() : super._();

  @override
  List<ReceiptLine> get lines;
  @override
  PaperSize get paperSize;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptImplCopyWith<_$ReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
