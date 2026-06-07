// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingDraft {
  Specialist get specialist;
  DateTime get scheduledAt;
  int get durationMinutes;
  String? get notes;
  String? get paymentRefrence;

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingDraftCopyWith<BookingDraft> get copyWith =>
      _$BookingDraftCopyWithImpl<BookingDraft>(
          this as BookingDraft, _$identity);

  /// Serializes this BookingDraft to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingDraft &&
            (identical(other.specialist, specialist) ||
                other.specialist == specialist) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paymentRefrence, paymentRefrence) ||
                other.paymentRefrence == paymentRefrence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, specialist, scheduledAt,
      durationMinutes, notes, paymentRefrence);

  @override
  String toString() {
    return 'BookingDraft(specialist: $specialist, scheduledAt: $scheduledAt, durationMinutes: $durationMinutes, notes: $notes, paymentRefrence: $paymentRefrence)';
  }
}

/// @nodoc
abstract mixin class $BookingDraftCopyWith<$Res> {
  factory $BookingDraftCopyWith(
          BookingDraft value, $Res Function(BookingDraft) _then) =
      _$BookingDraftCopyWithImpl;
  @useResult
  $Res call(
      {Specialist specialist,
      DateTime scheduledAt,
      int durationMinutes,
      String? notes,
      String? paymentRefrence});

  $SpecialistCopyWith<$Res> get specialist;
}

/// @nodoc
class _$BookingDraftCopyWithImpl<$Res> implements $BookingDraftCopyWith<$Res> {
  _$BookingDraftCopyWithImpl(this._self, this._then);

  final BookingDraft _self;
  final $Res Function(BookingDraft) _then;

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialist = null,
    Object? scheduledAt = null,
    Object? durationMinutes = null,
    Object? notes = freezed,
    Object? paymentRefrence = freezed,
  }) {
    return _then(_self.copyWith(
      specialist: null == specialist
          ? _self.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as Specialist,
      scheduledAt: null == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRefrence: freezed == paymentRefrence
          ? _self.paymentRefrence
          : paymentRefrence // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecialistCopyWith<$Res> get specialist {
    return $SpecialistCopyWith<$Res>(_self.specialist, (value) {
      return _then(_self.copyWith(specialist: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BookingDraft].
extension BookingDraftPatterns on BookingDraft {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BookingDraft value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BookingDraft() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BookingDraft value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingDraft():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BookingDraft value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingDraft() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Specialist specialist, DateTime scheduledAt,
            int durationMinutes, String? notes, String? paymentRefrence)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BookingDraft() when $default != null:
        return $default(_that.specialist, _that.scheduledAt,
            _that.durationMinutes, _that.notes, _that.paymentRefrence);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Specialist specialist, DateTime scheduledAt,
            int durationMinutes, String? notes, String? paymentRefrence)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingDraft():
        return $default(_that.specialist, _that.scheduledAt,
            _that.durationMinutes, _that.notes, _that.paymentRefrence);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Specialist specialist, DateTime scheduledAt,
            int durationMinutes, String? notes, String? paymentRefrence)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BookingDraft() when $default != null:
        return $default(_that.specialist, _that.scheduledAt,
            _that.durationMinutes, _that.notes, _that.paymentRefrence);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BookingDraft extends BookingDraft {
  const _BookingDraft(
      {required this.specialist,
      required this.scheduledAt,
      this.durationMinutes = 30,
      this.notes,
      this.paymentRefrence})
      : super._();
  factory _BookingDraft.fromJson(Map<String, dynamic> json) =>
      _$BookingDraftFromJson(json);

  @override
  final Specialist specialist;
  @override
  final DateTime scheduledAt;
  @override
  @JsonKey()
  final int durationMinutes;
  @override
  final String? notes;
  @override
  final String? paymentRefrence;

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingDraftCopyWith<_BookingDraft> get copyWith =>
      __$BookingDraftCopyWithImpl<_BookingDraft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingDraftToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingDraft &&
            (identical(other.specialist, specialist) ||
                other.specialist == specialist) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paymentRefrence, paymentRefrence) ||
                other.paymentRefrence == paymentRefrence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, specialist, scheduledAt,
      durationMinutes, notes, paymentRefrence);

  @override
  String toString() {
    return 'BookingDraft(specialist: $specialist, scheduledAt: $scheduledAt, durationMinutes: $durationMinutes, notes: $notes, paymentRefrence: $paymentRefrence)';
  }
}

/// @nodoc
abstract mixin class _$BookingDraftCopyWith<$Res>
    implements $BookingDraftCopyWith<$Res> {
  factory _$BookingDraftCopyWith(
          _BookingDraft value, $Res Function(_BookingDraft) _then) =
      __$BookingDraftCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Specialist specialist,
      DateTime scheduledAt,
      int durationMinutes,
      String? notes,
      String? paymentRefrence});

  @override
  $SpecialistCopyWith<$Res> get specialist;
}

/// @nodoc
class __$BookingDraftCopyWithImpl<$Res>
    implements _$BookingDraftCopyWith<$Res> {
  __$BookingDraftCopyWithImpl(this._self, this._then);

  final _BookingDraft _self;
  final $Res Function(_BookingDraft) _then;

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? specialist = null,
    Object? scheduledAt = null,
    Object? durationMinutes = null,
    Object? notes = freezed,
    Object? paymentRefrence = freezed,
  }) {
    return _then(_BookingDraft(
      specialist: null == specialist
          ? _self.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as Specialist,
      scheduledAt: null == scheduledAt
          ? _self.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _self.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRefrence: freezed == paymentRefrence
          ? _self.paymentRefrence
          : paymentRefrence // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of BookingDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecialistCopyWith<$Res> get specialist {
    return $SpecialistCopyWith<$Res>(_self.specialist, (value) {
      return _then(_self.copyWith(specialist: value));
    });
  }
}

// dart format on
