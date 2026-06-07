// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'specialist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Specialist {
  String get id;
  String get fullName;
  String get specialty;
  double get rating;
  int get reviewCount;
  int get consultationFeeKobo;
  String? get photoUrl;
  String? get bio;
  int get yearsExperience;
  bool get isAvailable;

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SpecialistCopyWith<Specialist> get copyWith =>
      _$SpecialistCopyWithImpl<Specialist>(this as Specialist, _$identity);

  /// Serializes this Specialist to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Specialist &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.consultationFeeKobo, consultationFeeKobo) ||
                other.consultationFeeKobo == consultationFeeKobo) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.yearsExperience, yearsExperience) ||
                other.yearsExperience == yearsExperience) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      specialty,
      rating,
      reviewCount,
      consultationFeeKobo,
      photoUrl,
      bio,
      yearsExperience,
      isAvailable);

  @override
  String toString() {
    return 'Specialist(id: $id, fullName: $fullName, specialty: $specialty, rating: $rating, reviewCount: $reviewCount, consultationFeeKobo: $consultationFeeKobo, photoUrl: $photoUrl, bio: $bio, yearsExperience: $yearsExperience, isAvailable: $isAvailable)';
  }
}

/// @nodoc
abstract mixin class $SpecialistCopyWith<$Res> {
  factory $SpecialistCopyWith(
          Specialist value, $Res Function(Specialist) _then) =
      _$SpecialistCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String fullName,
      String specialty,
      double rating,
      int reviewCount,
      int consultationFeeKobo,
      String? photoUrl,
      String? bio,
      int yearsExperience,
      bool isAvailable});
}

/// @nodoc
class _$SpecialistCopyWithImpl<$Res> implements $SpecialistCopyWith<$Res> {
  _$SpecialistCopyWithImpl(this._self, this._then);

  final Specialist _self;
  final $Res Function(Specialist) _then;

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? specialty = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? consultationFeeKobo = null,
    Object? photoUrl = freezed,
    Object? bio = freezed,
    Object? yearsExperience = null,
    Object? isAvailable = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _self.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      consultationFeeKobo: null == consultationFeeKobo
          ? _self.consultationFeeKobo
          : consultationFeeKobo // ignore: cast_nullable_to_non_nullable
              as int,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      yearsExperience: null == yearsExperience
          ? _self.yearsExperience
          : yearsExperience // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Specialist].
extension SpecialistPatterns on Specialist {
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
    TResult Function(_Specialist value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Specialist() when $default != null:
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
    TResult Function(_Specialist value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Specialist():
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
    TResult? Function(_Specialist value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Specialist() when $default != null:
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
            String fullName,
            String specialty,
            double rating,
            int reviewCount,
            int consultationFeeKobo,
            String? photoUrl,
            String? bio,
            int yearsExperience,
            bool isAvailable)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Specialist() when $default != null:
        return $default(
            _that.id,
            _that.fullName,
            _that.specialty,
            _that.rating,
            _that.reviewCount,
            _that.consultationFeeKobo,
            _that.photoUrl,
            _that.bio,
            _that.yearsExperience,
            _that.isAvailable);
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
            String fullName,
            String specialty,
            double rating,
            int reviewCount,
            int consultationFeeKobo,
            String? photoUrl,
            String? bio,
            int yearsExperience,
            bool isAvailable)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Specialist():
        return $default(
            _that.id,
            _that.fullName,
            _that.specialty,
            _that.rating,
            _that.reviewCount,
            _that.consultationFeeKobo,
            _that.photoUrl,
            _that.bio,
            _that.yearsExperience,
            _that.isAvailable);
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
            String fullName,
            String specialty,
            double rating,
            int reviewCount,
            int consultationFeeKobo,
            String? photoUrl,
            String? bio,
            int yearsExperience,
            bool isAvailable)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Specialist() when $default != null:
        return $default(
            _that.id,
            _that.fullName,
            _that.specialty,
            _that.rating,
            _that.reviewCount,
            _that.consultationFeeKobo,
            _that.photoUrl,
            _that.bio,
            _that.yearsExperience,
            _that.isAvailable);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Specialist extends Specialist {
  const _Specialist(
      {required this.id,
      required this.fullName,
      required this.specialty,
      this.rating = 0.0,
      this.reviewCount = 0,
      required this.consultationFeeKobo,
      this.photoUrl,
      this.bio,
      this.yearsExperience = 0,
      this.isAvailable = true})
      : super._();
  factory _Specialist.fromJson(Map<String, dynamic> json) =>
      _$SpecialistFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String specialty;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int reviewCount;
  @override
  final int consultationFeeKobo;
  @override
  final String? photoUrl;
  @override
  final String? bio;
  @override
  @JsonKey()
  final int yearsExperience;
  @override
  @JsonKey()
  final bool isAvailable;

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SpecialistCopyWith<_Specialist> get copyWith =>
      __$SpecialistCopyWithImpl<_Specialist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SpecialistToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Specialist &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.consultationFeeKobo, consultationFeeKobo) ||
                other.consultationFeeKobo == consultationFeeKobo) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.yearsExperience, yearsExperience) ||
                other.yearsExperience == yearsExperience) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      specialty,
      rating,
      reviewCount,
      consultationFeeKobo,
      photoUrl,
      bio,
      yearsExperience,
      isAvailable);

  @override
  String toString() {
    return 'Specialist(id: $id, fullName: $fullName, specialty: $specialty, rating: $rating, reviewCount: $reviewCount, consultationFeeKobo: $consultationFeeKobo, photoUrl: $photoUrl, bio: $bio, yearsExperience: $yearsExperience, isAvailable: $isAvailable)';
  }
}

/// @nodoc
abstract mixin class _$SpecialistCopyWith<$Res>
    implements $SpecialistCopyWith<$Res> {
  factory _$SpecialistCopyWith(
          _Specialist value, $Res Function(_Specialist) _then) =
      __$SpecialistCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String fullName,
      String specialty,
      double rating,
      int reviewCount,
      int consultationFeeKobo,
      String? photoUrl,
      String? bio,
      int yearsExperience,
      bool isAvailable});
}

/// @nodoc
class __$SpecialistCopyWithImpl<$Res> implements _$SpecialistCopyWith<$Res> {
  __$SpecialistCopyWithImpl(this._self, this._then);

  final _Specialist _self;
  final $Res Function(_Specialist) _then;

  /// Create a copy of Specialist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? specialty = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? consultationFeeKobo = null,
    Object? photoUrl = freezed,
    Object? bio = freezed,
    Object? yearsExperience = null,
    Object? isAvailable = null,
  }) {
    return _then(_Specialist(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      specialty: null == specialty
          ? _self.specialty
          : specialty // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _self.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      consultationFeeKobo: null == consultationFeeKobo
          ? _self.consultationFeeKobo
          : consultationFeeKobo // ignore: cast_nullable_to_non_nullable
              as int,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      yearsExperience: null == yearsExperience
          ? _self.yearsExperience
          : yearsExperience // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _self.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
