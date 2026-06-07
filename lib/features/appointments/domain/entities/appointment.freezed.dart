// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Appointment {
  String get id;
  String get specialistId;
  String get patiendId;
  DateTime get sheduledAt;
  AppointmentStatus get status;
  int get durationMinutes;
  String? get notes;
  String? get paymentRefrence;
  int? get amountPaidKobo;
  String? get cancellationReason;
  DateTime? get cancelledAt;
  Specialist? get specialist;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppointmentCopyWith<Appointment> get copyWith =>
      _$AppointmentCopyWithImpl<Appointment>(this as Appointment, _$identity);

  /// Serializes this Appointment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Appointment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            (identical(other.patiendId, patiendId) ||
                other.patiendId == patiendId) &&
            (identical(other.sheduledAt, sheduledAt) ||
                other.sheduledAt == sheduledAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paymentRefrence, paymentRefrence) ||
                other.paymentRefrence == paymentRefrence) &&
            (identical(other.amountPaidKobo, amountPaidKobo) ||
                other.amountPaidKobo == amountPaidKobo) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.specialist, specialist) ||
                other.specialist == specialist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      specialistId,
      patiendId,
      sheduledAt,
      status,
      durationMinutes,
      notes,
      paymentRefrence,
      amountPaidKobo,
      cancellationReason,
      cancelledAt,
      specialist);

  @override
  String toString() {
    return 'Appointment(id: $id, specialistId: $specialistId, patiendId: $patiendId, sheduledAt: $sheduledAt, status: $status, durationMinutes: $durationMinutes, notes: $notes, paymentRefrence: $paymentRefrence, amountPaidKobo: $amountPaidKobo, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, specialist: $specialist)';
  }
}

/// @nodoc
abstract mixin class $AppointmentCopyWith<$Res> {
  factory $AppointmentCopyWith(
          Appointment value, $Res Function(Appointment) _then) =
      _$AppointmentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String specialistId,
      String patiendId,
      DateTime sheduledAt,
      AppointmentStatus status,
      int durationMinutes,
      String? notes,
      String? paymentRefrence,
      int? amountPaidKobo,
      String? cancellationReason,
      DateTime? cancelledAt,
      Specialist? specialist});

  $SpecialistCopyWith<$Res>? get specialist;
}

/// @nodoc
class _$AppointmentCopyWithImpl<$Res> implements $AppointmentCopyWith<$Res> {
  _$AppointmentCopyWithImpl(this._self, this._then);

  final Appointment _self;
  final $Res Function(Appointment) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? specialistId = null,
    Object? patiendId = null,
    Object? sheduledAt = null,
    Object? status = null,
    Object? durationMinutes = null,
    Object? notes = freezed,
    Object? paymentRefrence = freezed,
    Object? amountPaidKobo = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? specialist = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: null == specialistId
          ? _self.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      patiendId: null == patiendId
          ? _self.patiendId
          : patiendId // ignore: cast_nullable_to_non_nullable
              as String,
      sheduledAt: null == sheduledAt
          ? _self.sheduledAt
          : sheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
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
      amountPaidKobo: freezed == amountPaidKobo
          ? _self.amountPaidKobo
          : amountPaidKobo // ignore: cast_nullable_to_non_nullable
              as int?,
      cancellationReason: freezed == cancellationReason
          ? _self.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _self.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specialist: freezed == specialist
          ? _self.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as Specialist?,
    ));
  }

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecialistCopyWith<$Res>? get specialist {
    if (_self.specialist == null) {
      return null;
    }

    return $SpecialistCopyWith<$Res>(_self.specialist!, (value) {
      return _then(_self.copyWith(specialist: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Appointment].
extension AppointmentPatterns on Appointment {
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
    TResult Function(_Appointment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
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
    TResult Function(_Appointment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment():
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
    TResult? Function(_Appointment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
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
    TResult Function(
            String id,
            String specialistId,
            String patiendId,
            DateTime sheduledAt,
            AppointmentStatus status,
            int durationMinutes,
            String? notes,
            String? paymentRefrence,
            int? amountPaidKobo,
            String? cancellationReason,
            DateTime? cancelledAt,
            Specialist? specialist)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(
            _that.id,
            _that.specialistId,
            _that.patiendId,
            _that.sheduledAt,
            _that.status,
            _that.durationMinutes,
            _that.notes,
            _that.paymentRefrence,
            _that.amountPaidKobo,
            _that.cancellationReason,
            _that.cancelledAt,
            _that.specialist);
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
    TResult Function(
            String id,
            String specialistId,
            String patiendId,
            DateTime sheduledAt,
            AppointmentStatus status,
            int durationMinutes,
            String? notes,
            String? paymentRefrence,
            int? amountPaidKobo,
            String? cancellationReason,
            DateTime? cancelledAt,
            Specialist? specialist)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment():
        return $default(
            _that.id,
            _that.specialistId,
            _that.patiendId,
            _that.sheduledAt,
            _that.status,
            _that.durationMinutes,
            _that.notes,
            _that.paymentRefrence,
            _that.amountPaidKobo,
            _that.cancellationReason,
            _that.cancelledAt,
            _that.specialist);
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
    TResult? Function(
            String id,
            String specialistId,
            String patiendId,
            DateTime sheduledAt,
            AppointmentStatus status,
            int durationMinutes,
            String? notes,
            String? paymentRefrence,
            int? amountPaidKobo,
            String? cancellationReason,
            DateTime? cancelledAt,
            Specialist? specialist)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Appointment() when $default != null:
        return $default(
            _that.id,
            _that.specialistId,
            _that.patiendId,
            _that.sheduledAt,
            _that.status,
            _that.durationMinutes,
            _that.notes,
            _that.paymentRefrence,
            _that.amountPaidKobo,
            _that.cancellationReason,
            _that.cancelledAt,
            _that.specialist);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Appointment extends Appointment {
  const _Appointment(
      {required this.id,
      required this.specialistId,
      required this.patiendId,
      required this.sheduledAt,
      required this.status,
      this.durationMinutes = 30,
      this.notes,
      this.paymentRefrence,
      this.amountPaidKobo,
      this.cancellationReason,
      this.cancelledAt,
      this.specialist})
      : super._();
  factory _Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  @override
  final String id;
  @override
  final String specialistId;
  @override
  final String patiendId;
  @override
  final DateTime sheduledAt;
  @override
  final AppointmentStatus status;
  @override
  @JsonKey()
  final int durationMinutes;
  @override
  final String? notes;
  @override
  final String? paymentRefrence;
  @override
  final int? amountPaidKobo;
  @override
  final String? cancellationReason;
  @override
  final DateTime? cancelledAt;
  @override
  final Specialist? specialist;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppointmentCopyWith<_Appointment> get copyWith =>
      __$AppointmentCopyWithImpl<_Appointment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppointmentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Appointment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.specialistId, specialistId) ||
                other.specialistId == specialistId) &&
            (identical(other.patiendId, patiendId) ||
                other.patiendId == patiendId) &&
            (identical(other.sheduledAt, sheduledAt) ||
                other.sheduledAt == sheduledAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.paymentRefrence, paymentRefrence) ||
                other.paymentRefrence == paymentRefrence) &&
            (identical(other.amountPaidKobo, amountPaidKobo) ||
                other.amountPaidKobo == amountPaidKobo) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt) &&
            (identical(other.specialist, specialist) ||
                other.specialist == specialist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      specialistId,
      patiendId,
      sheduledAt,
      status,
      durationMinutes,
      notes,
      paymentRefrence,
      amountPaidKobo,
      cancellationReason,
      cancelledAt,
      specialist);

  @override
  String toString() {
    return 'Appointment(id: $id, specialistId: $specialistId, patiendId: $patiendId, sheduledAt: $sheduledAt, status: $status, durationMinutes: $durationMinutes, notes: $notes, paymentRefrence: $paymentRefrence, amountPaidKobo: $amountPaidKobo, cancellationReason: $cancellationReason, cancelledAt: $cancelledAt, specialist: $specialist)';
  }
}

/// @nodoc
abstract mixin class _$AppointmentCopyWith<$Res>
    implements $AppointmentCopyWith<$Res> {
  factory _$AppointmentCopyWith(
          _Appointment value, $Res Function(_Appointment) _then) =
      __$AppointmentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String specialistId,
      String patiendId,
      DateTime sheduledAt,
      AppointmentStatus status,
      int durationMinutes,
      String? notes,
      String? paymentRefrence,
      int? amountPaidKobo,
      String? cancellationReason,
      DateTime? cancelledAt,
      Specialist? specialist});

  @override
  $SpecialistCopyWith<$Res>? get specialist;
}

/// @nodoc
class __$AppointmentCopyWithImpl<$Res> implements _$AppointmentCopyWith<$Res> {
  __$AppointmentCopyWithImpl(this._self, this._then);

  final _Appointment _self;
  final $Res Function(_Appointment) _then;

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? specialistId = null,
    Object? patiendId = null,
    Object? sheduledAt = null,
    Object? status = null,
    Object? durationMinutes = null,
    Object? notes = freezed,
    Object? paymentRefrence = freezed,
    Object? amountPaidKobo = freezed,
    Object? cancellationReason = freezed,
    Object? cancelledAt = freezed,
    Object? specialist = freezed,
  }) {
    return _then(_Appointment(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      specialistId: null == specialistId
          ? _self.specialistId
          : specialistId // ignore: cast_nullable_to_non_nullable
              as String,
      patiendId: null == patiendId
          ? _self.patiendId
          : patiendId // ignore: cast_nullable_to_non_nullable
              as String,
      sheduledAt: null == sheduledAt
          ? _self.sheduledAt
          : sheduledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppointmentStatus,
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
      amountPaidKobo: freezed == amountPaidKobo
          ? _self.amountPaidKobo
          : amountPaidKobo // ignore: cast_nullable_to_non_nullable
              as int?,
      cancellationReason: freezed == cancellationReason
          ? _self.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledAt: freezed == cancelledAt
          ? _self.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specialist: freezed == specialist
          ? _self.specialist
          : specialist // ignore: cast_nullable_to_non_nullable
              as Specialist?,
    ));
  }

  /// Create a copy of Appointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpecialistCopyWith<$Res>? get specialist {
    if (_self.specialist == null) {
      return null;
    }

    return $SpecialistCopyWith<$Res>(_self.specialist!, (value) {
      return _then(_self.copyWith(specialist: value));
    });
  }
}

// dart format on
