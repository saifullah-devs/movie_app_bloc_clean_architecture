// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieListModel {

 int get total;// Total number of movies
 int get page;// Current page number
 int get pages;// Total number of pages
@JsonKey(name: 'tv_shows') List<TvShows> get tvShow;
/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieListModelCopyWith<MovieListModel> get copyWith => _$MovieListModelCopyWithImpl<MovieListModel>(this as MovieListModel, _$identity);

  /// Serializes this MovieListModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieListModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pages, pages) || other.pages == pages)&&const DeepCollectionEquality().equals(other.tvShow, tvShow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pages,const DeepCollectionEquality().hash(tvShow));

@override
String toString() {
  return 'MovieListModel(total: $total, page: $page, pages: $pages, tvShow: $tvShow)';
}


}

/// @nodoc
abstract mixin class $MovieListModelCopyWith<$Res>  {
  factory $MovieListModelCopyWith(MovieListModel value, $Res Function(MovieListModel) _then) = _$MovieListModelCopyWithImpl;
@useResult
$Res call({
 int total, int page, int pages,@JsonKey(name: 'tv_shows') List<TvShows> tvShow
});




}
/// @nodoc
class _$MovieListModelCopyWithImpl<$Res>
    implements $MovieListModelCopyWith<$Res> {
  _$MovieListModelCopyWithImpl(this._self, this._then);

  final MovieListModel _self;
  final $Res Function(MovieListModel) _then;

/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? pages = null,Object? tvShow = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,tvShow: null == tvShow ? _self.tvShow : tvShow // ignore: cast_nullable_to_non_nullable
as List<TvShows>,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieListModel].
extension MovieListModelPatterns on MovieListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieListModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieListModel value)  $default,){
final _that = this;
switch (_that) {
case _MovieListModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieListModel value)?  $default,){
final _that = this;
switch (_that) {
case _MovieListModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int pages, @JsonKey(name: 'tv_shows')  List<TvShows> tvShow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieListModel() when $default != null:
return $default(_that.total,_that.page,_that.pages,_that.tvShow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int pages, @JsonKey(name: 'tv_shows')  List<TvShows> tvShow)  $default,) {final _that = this;
switch (_that) {
case _MovieListModel():
return $default(_that.total,_that.page,_that.pages,_that.tvShow);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int pages, @JsonKey(name: 'tv_shows')  List<TvShows> tvShow)?  $default,) {final _that = this;
switch (_that) {
case _MovieListModel() when $default != null:
return $default(_that.total,_that.page,_that.pages,_that.tvShow);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieListModel implements MovieListModel {
   _MovieListModel({this.total = 0, this.page = 0, this.pages = 0, @JsonKey(name: 'tv_shows') final  List<TvShows> tvShow = const []}): _tvShow = tvShow;
  factory _MovieListModel.fromJson(Map<String, dynamic> json) => _$MovieListModelFromJson(json);

@override@JsonKey() final  int total;
// Total number of movies
@override@JsonKey() final  int page;
// Current page number
@override@JsonKey() final  int pages;
// Total number of pages
 final  List<TvShows> _tvShow;
// Total number of pages
@override@JsonKey(name: 'tv_shows') List<TvShows> get tvShow {
  if (_tvShow is EqualUnmodifiableListView) return _tvShow;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tvShow);
}


/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieListModelCopyWith<_MovieListModel> get copyWith => __$MovieListModelCopyWithImpl<_MovieListModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieListModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieListModel&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.pages, pages) || other.pages == pages)&&const DeepCollectionEquality().equals(other._tvShow, _tvShow));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,pages,const DeepCollectionEquality().hash(_tvShow));

@override
String toString() {
  return 'MovieListModel(total: $total, page: $page, pages: $pages, tvShow: $tvShow)';
}


}

/// @nodoc
abstract mixin class _$MovieListModelCopyWith<$Res> implements $MovieListModelCopyWith<$Res> {
  factory _$MovieListModelCopyWith(_MovieListModel value, $Res Function(_MovieListModel) _then) = __$MovieListModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int pages,@JsonKey(name: 'tv_shows') List<TvShows> tvShow
});




}
/// @nodoc
class __$MovieListModelCopyWithImpl<$Res>
    implements _$MovieListModelCopyWith<$Res> {
  __$MovieListModelCopyWithImpl(this._self, this._then);

  final _MovieListModel _self;
  final $Res Function(_MovieListModel) _then;

/// Create a copy of MovieListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? pages = null,Object? tvShow = null,}) {
  return _then(_MovieListModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,tvShow: null == tvShow ? _self._tvShow : tvShow // ignore: cast_nullable_to_non_nullable
as List<TvShows>,
  ));
}


}


/// @nodoc
mixin _$TvShows {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'permalink') String get permalink;// ✅ Made nullable (String?) because the API sometimes sends 'null'!
@JsonKey(name: 'start_date') String? get startDate;@JsonKey(name: 'end_date') String? get endDate;@JsonKey(name: 'country') String get country;@JsonKey(name: 'network') String? get network;// Sometimes network can be null too!
@JsonKey(name: 'status') String get status;// ✅ The Magic Fix! Freezed now knows exactly where to find the URL.
@JsonKey(name: 'image_thumbnail_path') String get imageThumbnailPath;
/// Create a copy of TvShows
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TvShowsCopyWith<TvShows> get copyWith => _$TvShowsCopyWithImpl<TvShows>(this as TvShows, _$identity);

  /// Serializes this TvShows to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TvShows&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.permalink, permalink) || other.permalink == permalink)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.country, country) || other.country == country)&&(identical(other.network, network) || other.network == network)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageThumbnailPath, imageThumbnailPath) || other.imageThumbnailPath == imageThumbnailPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,permalink,startDate,endDate,country,network,status,imageThumbnailPath);

@override
String toString() {
  return 'TvShows(id: $id, name: $name, permalink: $permalink, startDate: $startDate, endDate: $endDate, country: $country, network: $network, status: $status, imageThumbnailPath: $imageThumbnailPath)';
}


}

/// @nodoc
abstract mixin class $TvShowsCopyWith<$Res>  {
  factory $TvShowsCopyWith(TvShows value, $Res Function(TvShows) _then) = _$TvShowsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'permalink') String permalink,@JsonKey(name: 'start_date') String? startDate,@JsonKey(name: 'end_date') String? endDate,@JsonKey(name: 'country') String country,@JsonKey(name: 'network') String? network,@JsonKey(name: 'status') String status,@JsonKey(name: 'image_thumbnail_path') String imageThumbnailPath
});




}
/// @nodoc
class _$TvShowsCopyWithImpl<$Res>
    implements $TvShowsCopyWith<$Res> {
  _$TvShowsCopyWithImpl(this._self, this._then);

  final TvShows _self;
  final $Res Function(TvShows) _then;

/// Create a copy of TvShows
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? permalink = null,Object? startDate = freezed,Object? endDate = freezed,Object? country = null,Object? network = freezed,Object? status = null,Object? imageThumbnailPath = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,permalink: null == permalink ? _self.permalink : permalink // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageThumbnailPath: null == imageThumbnailPath ? _self.imageThumbnailPath : imageThumbnailPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TvShows].
extension TvShowsPatterns on TvShows {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TvShows value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TvShows() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TvShows value)  $default,){
final _that = this;
switch (_that) {
case _TvShows():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TvShows value)?  $default,){
final _that = this;
switch (_that) {
case _TvShows() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'permalink')  String permalink, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'country')  String country, @JsonKey(name: 'network')  String? network, @JsonKey(name: 'status')  String status, @JsonKey(name: 'image_thumbnail_path')  String imageThumbnailPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TvShows() when $default != null:
return $default(_that.id,_that.name,_that.permalink,_that.startDate,_that.endDate,_that.country,_that.network,_that.status,_that.imageThumbnailPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'permalink')  String permalink, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'country')  String country, @JsonKey(name: 'network')  String? network, @JsonKey(name: 'status')  String status, @JsonKey(name: 'image_thumbnail_path')  String imageThumbnailPath)  $default,) {final _that = this;
switch (_that) {
case _TvShows():
return $default(_that.id,_that.name,_that.permalink,_that.startDate,_that.endDate,_that.country,_that.network,_that.status,_that.imageThumbnailPath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'permalink')  String permalink, @JsonKey(name: 'start_date')  String? startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'country')  String country, @JsonKey(name: 'network')  String? network, @JsonKey(name: 'status')  String status, @JsonKey(name: 'image_thumbnail_path')  String imageThumbnailPath)?  $default,) {final _that = this;
switch (_that) {
case _TvShows() when $default != null:
return $default(_that.id,_that.name,_that.permalink,_that.startDate,_that.endDate,_that.country,_that.network,_that.status,_that.imageThumbnailPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TvShows implements TvShows {
   _TvShows({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'permalink') this.permalink = '', @JsonKey(name: 'start_date') this.startDate, @JsonKey(name: 'end_date') this.endDate, @JsonKey(name: 'country') this.country = '', @JsonKey(name: 'network') this.network, @JsonKey(name: 'status') this.status = '', @JsonKey(name: 'image_thumbnail_path') this.imageThumbnailPath = ''});
  factory _TvShows.fromJson(Map<String, dynamic> json) => _$TvShowsFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'permalink') final  String permalink;
// ✅ Made nullable (String?) because the API sometimes sends 'null'!
@override@JsonKey(name: 'start_date') final  String? startDate;
@override@JsonKey(name: 'end_date') final  String? endDate;
@override@JsonKey(name: 'country') final  String country;
@override@JsonKey(name: 'network') final  String? network;
// Sometimes network can be null too!
@override@JsonKey(name: 'status') final  String status;
// ✅ The Magic Fix! Freezed now knows exactly where to find the URL.
@override@JsonKey(name: 'image_thumbnail_path') final  String imageThumbnailPath;

/// Create a copy of TvShows
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TvShowsCopyWith<_TvShows> get copyWith => __$TvShowsCopyWithImpl<_TvShows>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TvShowsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TvShows&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.permalink, permalink) || other.permalink == permalink)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.country, country) || other.country == country)&&(identical(other.network, network) || other.network == network)&&(identical(other.status, status) || other.status == status)&&(identical(other.imageThumbnailPath, imageThumbnailPath) || other.imageThumbnailPath == imageThumbnailPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,permalink,startDate,endDate,country,network,status,imageThumbnailPath);

@override
String toString() {
  return 'TvShows(id: $id, name: $name, permalink: $permalink, startDate: $startDate, endDate: $endDate, country: $country, network: $network, status: $status, imageThumbnailPath: $imageThumbnailPath)';
}


}

/// @nodoc
abstract mixin class _$TvShowsCopyWith<$Res> implements $TvShowsCopyWith<$Res> {
  factory _$TvShowsCopyWith(_TvShows value, $Res Function(_TvShows) _then) = __$TvShowsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'permalink') String permalink,@JsonKey(name: 'start_date') String? startDate,@JsonKey(name: 'end_date') String? endDate,@JsonKey(name: 'country') String country,@JsonKey(name: 'network') String? network,@JsonKey(name: 'status') String status,@JsonKey(name: 'image_thumbnail_path') String imageThumbnailPath
});




}
/// @nodoc
class __$TvShowsCopyWithImpl<$Res>
    implements _$TvShowsCopyWith<$Res> {
  __$TvShowsCopyWithImpl(this._self, this._then);

  final _TvShows _self;
  final $Res Function(_TvShows) _then;

/// Create a copy of TvShows
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? permalink = null,Object? startDate = freezed,Object? endDate = freezed,Object? country = null,Object? network = freezed,Object? status = null,Object? imageThumbnailPath = null,}) {
  return _then(_TvShows(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,permalink: null == permalink ? _self.permalink : permalink // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,imageThumbnailPath: null == imageThumbnailPath ? _self.imageThumbnailPath : imageThumbnailPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
