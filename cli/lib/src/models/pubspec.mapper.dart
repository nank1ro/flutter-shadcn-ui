// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pubspec.dart';

class PubspecMapper extends ClassMapperBase<Pubspec> {
  PubspecMapper._();

  static PubspecMapper? _instance;
  static PubspecMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PubspecMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Pubspec';

  static String? _$name(Pubspec v) => v.name;
  static const Field<Pubspec, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$version(Pubspec v) => v.version;
  static const Field<Pubspec, String> _f$version =
      Field('version', _$version, opt: true);
  static String? _$description(Pubspec v) => v.description;
  static const Field<Pubspec, String> _f$description =
      Field('description', _$description, opt: true);
  static Map<String, dynamic>? _$dependencies(Pubspec v) => v.dependencies;
  static const Field<Pubspec, Map<String, dynamic>> _f$dependencies =
      Field('dependencies', _$dependencies, opt: true);
  static Map<String, dynamic>? _$devDependencies(Pubspec v) =>
      v.devDependencies;
  static const Field<Pubspec, Map<String, dynamic>> _f$devDependencies =
      Field('devDependencies', _$devDependencies, opt: true);
  static Map<String, dynamic>? _$environment(Pubspec v) => v.environment;
  static const Field<Pubspec, Map<String, dynamic>> _f$environment =
      Field('environment', _$environment, opt: true);

  @override
  final MappableFields<Pubspec> fields = const {
    #name: _f$name,
    #version: _f$version,
    #description: _f$description,
    #dependencies: _f$dependencies,
    #devDependencies: _f$devDependencies,
    #environment: _f$environment,
  };

  static Pubspec _instantiate(DecodingData data) {
    return Pubspec(
        name: data.dec(_f$name),
        version: data.dec(_f$version),
        description: data.dec(_f$description),
        dependencies: data.dec(_f$dependencies),
        devDependencies: data.dec(_f$devDependencies),
        environment: data.dec(_f$environment));
  }

  @override
  final Function instantiate = _instantiate;

  static Pubspec fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Pubspec>(map);
  }

  static Pubspec fromJson(String json) {
    return ensureInitialized().decodeJson<Pubspec>(json);
  }
}

mixin PubspecMappable {
  String toJson() {
    return PubspecMapper.ensureInitialized()
        .encodeJson<Pubspec>(this as Pubspec);
  }

  Map<String, dynamic> toMap() {
    return PubspecMapper.ensureInitialized()
        .encodeMap<Pubspec>(this as Pubspec);
  }

  PubspecCopyWith<Pubspec, Pubspec, Pubspec> get copyWith =>
      _PubspecCopyWithImpl<Pubspec, Pubspec>(
          this as Pubspec, $identity, $identity);
  @override
  String toString() {
    return PubspecMapper.ensureInitialized().stringifyValue(this as Pubspec);
  }

  @override
  bool operator ==(Object other) {
    return PubspecMapper.ensureInitialized()
        .equalsValue(this as Pubspec, other);
  }

  @override
  int get hashCode {
    return PubspecMapper.ensureInitialized().hashValue(this as Pubspec);
  }
}

extension PubspecValueCopy<$R, $Out> on ObjectCopyWith<$R, Pubspec, $Out> {
  PubspecCopyWith<$R, Pubspec, $Out> get $asPubspec =>
      $base.as((v, t, t2) => _PubspecCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PubspecCopyWith<$R, $In extends Pubspec, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get dependencies;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get devDependencies;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get environment;
  $R call(
      {String? name,
      String? version,
      String? description,
      Map<String, dynamic>? dependencies,
      Map<String, dynamic>? devDependencies,
      Map<String, dynamic>? environment});
  PubspecCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PubspecCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Pubspec, $Out>
    implements PubspecCopyWith<$R, Pubspec, $Out> {
  _PubspecCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Pubspec> $mapper =
      PubspecMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get dependencies => $value.dependencies != null
          ? MapCopyWith(
              $value.dependencies!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(dependencies: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get devDependencies => $value.devDependencies != null
          ? MapCopyWith(
              $value.devDependencies!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(devDependencies: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get environment => $value.environment != null
          ? MapCopyWith(
              $value.environment!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(environment: v))
          : null;
  @override
  $R call(
          {Object? name = $none,
          Object? version = $none,
          Object? description = $none,
          Object? dependencies = $none,
          Object? devDependencies = $none,
          Object? environment = $none}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (version != $none) #version: version,
        if (description != $none) #description: description,
        if (dependencies != $none) #dependencies: dependencies,
        if (devDependencies != $none) #devDependencies: devDependencies,
        if (environment != $none) #environment: environment
      }));
  @override
  Pubspec $make(CopyWithData data) => Pubspec(
      name: data.get(#name, or: $value.name),
      version: data.get(#version, or: $value.version),
      description: data.get(#description, or: $value.description),
      dependencies: data.get(#dependencies, or: $value.dependencies),
      devDependencies: data.get(#devDependencies, or: $value.devDependencies),
      environment: data.get(#environment, or: $value.environment));

  @override
  PubspecCopyWith<$R2, Pubspec, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PubspecCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
