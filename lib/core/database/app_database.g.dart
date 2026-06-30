// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FileAssetsTable extends FileAssets
    with TableInfo<$FileAssetsTable, FileAsset> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FileAssetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _relativePathMeta = const VerificationMeta(
    'relativePath',
  );
  @override
  late final GeneratedColumn<String> relativePath = GeneratedColumn<String>(
    'relative_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _originalNameMeta = const VerificationMeta(
    'originalName',
  );
  @override
  late final GeneratedColumn<String> originalName = GeneratedColumn<String>(
    'original_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mimeTypeMeta = const VerificationMeta(
    'mimeType',
  );
  @override
  late final GeneratedColumn<String> mimeType = GeneratedColumn<String>(
    'mime_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _byteSizeMeta = const VerificationMeta(
    'byteSize',
  );
  @override
  late final GeneratedColumn<int> byteSize = GeneratedColumn<int>(
    'byte_size',
    aliasedName,
    false,
    check: () => ComparableExpr(byteSize).isBiggerOrEqualValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sha256Meta = const VerificationMeta('sha256');
  @override
  late final GeneratedColumn<String> sha256 = GeneratedColumn<String>(
    'sha256',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    relativePath,
    originalName,
    mimeType,
    byteSize,
    sha256,
    category,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'file_assets';
  @override
  VerificationContext validateIntegrity(
    Insertable<FileAsset> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('relative_path')) {
      context.handle(
        _relativePathMeta,
        relativePath.isAcceptableOrUnknown(
          data['relative_path']!,
          _relativePathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_relativePathMeta);
    }
    if (data.containsKey('original_name')) {
      context.handle(
        _originalNameMeta,
        originalName.isAcceptableOrUnknown(
          data['original_name']!,
          _originalNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_originalNameMeta);
    }
    if (data.containsKey('mime_type')) {
      context.handle(
        _mimeTypeMeta,
        mimeType.isAcceptableOrUnknown(data['mime_type']!, _mimeTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mimeTypeMeta);
    }
    if (data.containsKey('byte_size')) {
      context.handle(
        _byteSizeMeta,
        byteSize.isAcceptableOrUnknown(data['byte_size']!, _byteSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_byteSizeMeta);
    }
    if (data.containsKey('sha256')) {
      context.handle(
        _sha256Meta,
        sha256.isAcceptableOrUnknown(data['sha256']!, _sha256Meta),
      );
    } else if (isInserting) {
      context.missing(_sha256Meta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FileAsset map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FileAsset(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      relativePath:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}relative_path'],
          )!,
      originalName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}original_name'],
          )!,
      mimeType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}mime_type'],
          )!,
      byteSize:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}byte_size'],
          )!,
      sha256:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sha256'],
          )!,
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
    );
  }

  @override
  $FileAssetsTable createAlias(String alias) {
    return $FileAssetsTable(attachedDatabase, alias);
  }
}

class FileAsset extends DataClass implements Insertable<FileAsset> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String relativePath;
  final String originalName;
  final String mimeType;
  final int byteSize;
  final String sha256;
  final String category;
  const FileAsset({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.relativePath,
    required this.originalName,
    required this.mimeType,
    required this.byteSize,
    required this.sha256,
    required this.category,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['relative_path'] = Variable<String>(relativePath);
    map['original_name'] = Variable<String>(originalName);
    map['mime_type'] = Variable<String>(mimeType);
    map['byte_size'] = Variable<int>(byteSize);
    map['sha256'] = Variable<String>(sha256);
    map['category'] = Variable<String>(category);
    return map;
  }

  FileAssetsCompanion toCompanion(bool nullToAbsent) {
    return FileAssetsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      relativePath: Value(relativePath),
      originalName: Value(originalName),
      mimeType: Value(mimeType),
      byteSize: Value(byteSize),
      sha256: Value(sha256),
      category: Value(category),
    );
  }

  factory FileAsset.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FileAsset(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      relativePath: serializer.fromJson<String>(json['relativePath']),
      originalName: serializer.fromJson<String>(json['originalName']),
      mimeType: serializer.fromJson<String>(json['mimeType']),
      byteSize: serializer.fromJson<int>(json['byteSize']),
      sha256: serializer.fromJson<String>(json['sha256']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'relativePath': serializer.toJson<String>(relativePath),
      'originalName': serializer.toJson<String>(originalName),
      'mimeType': serializer.toJson<String>(mimeType),
      'byteSize': serializer.toJson<int>(byteSize),
      'sha256': serializer.toJson<String>(sha256),
      'category': serializer.toJson<String>(category),
    };
  }

  FileAsset copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? relativePath,
    String? originalName,
    String? mimeType,
    int? byteSize,
    String? sha256,
    String? category,
  }) => FileAsset(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    relativePath: relativePath ?? this.relativePath,
    originalName: originalName ?? this.originalName,
    mimeType: mimeType ?? this.mimeType,
    byteSize: byteSize ?? this.byteSize,
    sha256: sha256 ?? this.sha256,
    category: category ?? this.category,
  );
  FileAsset copyWithCompanion(FileAssetsCompanion data) {
    return FileAsset(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      relativePath:
          data.relativePath.present
              ? data.relativePath.value
              : this.relativePath,
      originalName:
          data.originalName.present
              ? data.originalName.value
              : this.originalName,
      mimeType: data.mimeType.present ? data.mimeType.value : this.mimeType,
      byteSize: data.byteSize.present ? data.byteSize.value : this.byteSize,
      sha256: data.sha256.present ? data.sha256.value : this.sha256,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FileAsset(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('relativePath: $relativePath, ')
          ..write('originalName: $originalName, ')
          ..write('mimeType: $mimeType, ')
          ..write('byteSize: $byteSize, ')
          ..write('sha256: $sha256, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    relativePath,
    originalName,
    mimeType,
    byteSize,
    sha256,
    category,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FileAsset &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.relativePath == this.relativePath &&
          other.originalName == this.originalName &&
          other.mimeType == this.mimeType &&
          other.byteSize == this.byteSize &&
          other.sha256 == this.sha256 &&
          other.category == this.category);
}

class FileAssetsCompanion extends UpdateCompanion<FileAsset> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> relativePath;
  final Value<String> originalName;
  final Value<String> mimeType;
  final Value<int> byteSize;
  final Value<String> sha256;
  final Value<String> category;
  final Value<int> rowid;
  const FileAssetsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.relativePath = const Value.absent(),
    this.originalName = const Value.absent(),
    this.mimeType = const Value.absent(),
    this.byteSize = const Value.absent(),
    this.sha256 = const Value.absent(),
    this.category = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FileAssetsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String relativePath,
    required String originalName,
    required String mimeType,
    required int byteSize,
    required String sha256,
    required String category,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       relativePath = Value(relativePath),
       originalName = Value(originalName),
       mimeType = Value(mimeType),
       byteSize = Value(byteSize),
       sha256 = Value(sha256),
       category = Value(category);
  static Insertable<FileAsset> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? relativePath,
    Expression<String>? originalName,
    Expression<String>? mimeType,
    Expression<int>? byteSize,
    Expression<String>? sha256,
    Expression<String>? category,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (relativePath != null) 'relative_path': relativePath,
      if (originalName != null) 'original_name': originalName,
      if (mimeType != null) 'mime_type': mimeType,
      if (byteSize != null) 'byte_size': byteSize,
      if (sha256 != null) 'sha256': sha256,
      if (category != null) 'category': category,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FileAssetsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? relativePath,
    Value<String>? originalName,
    Value<String>? mimeType,
    Value<int>? byteSize,
    Value<String>? sha256,
    Value<String>? category,
    Value<int>? rowid,
  }) {
    return FileAssetsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      relativePath: relativePath ?? this.relativePath,
      originalName: originalName ?? this.originalName,
      mimeType: mimeType ?? this.mimeType,
      byteSize: byteSize ?? this.byteSize,
      sha256: sha256 ?? this.sha256,
      category: category ?? this.category,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (relativePath.present) {
      map['relative_path'] = Variable<String>(relativePath.value);
    }
    if (originalName.present) {
      map['original_name'] = Variable<String>(originalName.value);
    }
    if (mimeType.present) {
      map['mime_type'] = Variable<String>(mimeType.value);
    }
    if (byteSize.present) {
      map['byte_size'] = Variable<int>(byteSize.value);
    }
    if (sha256.present) {
      map['sha256'] = Variable<String>(sha256.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FileAssetsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('relativePath: $relativePath, ')
          ..write('originalName: $originalName, ')
          ..write('mimeType: $mimeType, ')
          ..write('byteSize: $byteSize, ')
          ..write('sha256: $sha256, ')
          ..write('category: $category, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OwnerProfilesTable extends OwnerProfiles
    with TableInfo<$OwnerProfilesTable, OwnerProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OwnerProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emergencyContactNameMeta =
      const VerificationMeta('emergencyContactName');
  @override
  late final GeneratedColumn<String> emergencyContactName =
      GeneratedColumn<String>(
        'emergency_contact_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _emergencyContactPhoneMeta =
      const VerificationMeta('emergencyContactPhone');
  @override
  late final GeneratedColumn<String> emergencyContactPhone =
      GeneratedColumn<String>(
        'emergency_contact_phone',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _photoFileIdMeta = const VerificationMeta(
    'photoFileId',
  );
  @override
  late final GeneratedColumn<String> photoFileId = GeneratedColumn<String>(
    'photo_file_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    displayName,
    email,
    phone,
    address,
    emergencyContactName,
    emergencyContactPhone,
    photoFileId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'owner_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<OwnerProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('emergency_contact_name')) {
      context.handle(
        _emergencyContactNameMeta,
        emergencyContactName.isAcceptableOrUnknown(
          data['emergency_contact_name']!,
          _emergencyContactNameMeta,
        ),
      );
    }
    if (data.containsKey('emergency_contact_phone')) {
      context.handle(
        _emergencyContactPhoneMeta,
        emergencyContactPhone.isAcceptableOrUnknown(
          data['emergency_contact_phone']!,
          _emergencyContactPhoneMeta,
        ),
      );
    }
    if (data.containsKey('photo_file_id')) {
      context.handle(
        _photoFileIdMeta,
        photoFileId.isAcceptableOrUnknown(
          data['photo_file_id']!,
          _photoFileIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OwnerProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OwnerProfile(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      displayName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}display_name'],
          )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      emergencyContactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_name'],
      ),
      emergencyContactPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_phone'],
      ),
      photoFileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_file_id'],
      ),
    );
  }

  @override
  $OwnerProfilesTable createAlias(String alias) {
    return $OwnerProfilesTable(attachedDatabase, alias);
  }
}

class OwnerProfile extends DataClass implements Insertable<OwnerProfile> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String displayName;
  final String? email;
  final String? phone;
  final String? address;
  final String? emergencyContactName;
  final String? emergencyContactPhone;
  final String? photoFileId;
  const OwnerProfile({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.displayName,
    this.email,
    this.phone,
    this.address,
    this.emergencyContactName,
    this.emergencyContactPhone,
    this.photoFileId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || emergencyContactName != null) {
      map['emergency_contact_name'] = Variable<String>(emergencyContactName);
    }
    if (!nullToAbsent || emergencyContactPhone != null) {
      map['emergency_contact_phone'] = Variable<String>(emergencyContactPhone);
    }
    if (!nullToAbsent || photoFileId != null) {
      map['photo_file_id'] = Variable<String>(photoFileId);
    }
    return map;
  }

  OwnerProfilesCompanion toCompanion(bool nullToAbsent) {
    return OwnerProfilesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      displayName: Value(displayName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      address:
          address == null && nullToAbsent
              ? const Value.absent()
              : Value(address),
      emergencyContactName:
          emergencyContactName == null && nullToAbsent
              ? const Value.absent()
              : Value(emergencyContactName),
      emergencyContactPhone:
          emergencyContactPhone == null && nullToAbsent
              ? const Value.absent()
              : Value(emergencyContactPhone),
      photoFileId:
          photoFileId == null && nullToAbsent
              ? const Value.absent()
              : Value(photoFileId),
    );
  }

  factory OwnerProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OwnerProfile(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      emergencyContactName: serializer.fromJson<String?>(
        json['emergencyContactName'],
      ),
      emergencyContactPhone: serializer.fromJson<String?>(
        json['emergencyContactPhone'],
      ),
      photoFileId: serializer.fromJson<String?>(json['photoFileId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'emergencyContactName': serializer.toJson<String?>(emergencyContactName),
      'emergencyContactPhone': serializer.toJson<String?>(
        emergencyContactPhone,
      ),
      'photoFileId': serializer.toJson<String?>(photoFileId),
    };
  }

  OwnerProfile copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? displayName,
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> emergencyContactName = const Value.absent(),
    Value<String?> emergencyContactPhone = const Value.absent(),
    Value<String?> photoFileId = const Value.absent(),
  }) => OwnerProfile(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    address: address.present ? address.value : this.address,
    emergencyContactName:
        emergencyContactName.present
            ? emergencyContactName.value
            : this.emergencyContactName,
    emergencyContactPhone:
        emergencyContactPhone.present
            ? emergencyContactPhone.value
            : this.emergencyContactPhone,
    photoFileId: photoFileId.present ? photoFileId.value : this.photoFileId,
  );
  OwnerProfile copyWithCompanion(OwnerProfilesCompanion data) {
    return OwnerProfile(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      emergencyContactName:
          data.emergencyContactName.present
              ? data.emergencyContactName.value
              : this.emergencyContactName,
      emergencyContactPhone:
          data.emergencyContactPhone.present
              ? data.emergencyContactPhone.value
              : this.emergencyContactPhone,
      photoFileId:
          data.photoFileId.present ? data.photoFileId.value : this.photoFileId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OwnerProfile(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactPhone: $emergencyContactPhone, ')
          ..write('photoFileId: $photoFileId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    displayName,
    email,
    phone,
    address,
    emergencyContactName,
    emergencyContactPhone,
    photoFileId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OwnerProfile &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.emergencyContactName == this.emergencyContactName &&
          other.emergencyContactPhone == this.emergencyContactPhone &&
          other.photoFileId == this.photoFileId);
}

class OwnerProfilesCompanion extends UpdateCompanion<OwnerProfile> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> displayName;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<String?> emergencyContactName;
  final Value<String?> emergencyContactPhone;
  final Value<String?> photoFileId;
  final Value<int> rowid;
  const OwnerProfilesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactPhone = const Value.absent(),
    this.photoFileId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OwnerProfilesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String displayName,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactPhone = const Value.absent(),
    this.photoFileId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       displayName = Value(displayName);
  static Insertable<OwnerProfile> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? emergencyContactName,
    Expression<String>? emergencyContactPhone,
    Expression<String>? photoFileId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (emergencyContactName != null)
        'emergency_contact_name': emergencyContactName,
      if (emergencyContactPhone != null)
        'emergency_contact_phone': emergencyContactPhone,
      if (photoFileId != null) 'photo_file_id': photoFileId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OwnerProfilesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? displayName,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? address,
    Value<String?>? emergencyContactName,
    Value<String?>? emergencyContactPhone,
    Value<String?>? photoFileId,
    Value<int>? rowid,
  }) {
    return OwnerProfilesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactPhone:
          emergencyContactPhone ?? this.emergencyContactPhone,
      photoFileId: photoFileId ?? this.photoFileId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (emergencyContactName.present) {
      map['emergency_contact_name'] = Variable<String>(
        emergencyContactName.value,
      );
    }
    if (emergencyContactPhone.present) {
      map['emergency_contact_phone'] = Variable<String>(
        emergencyContactPhone.value,
      );
    }
    if (photoFileId.present) {
      map['photo_file_id'] = Variable<String>(photoFileId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OwnerProfilesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactPhone: $emergencyContactPhone, ')
          ..write('photoFileId: $photoFileId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PetsTable extends Pets with TableInfo<$PetsTable, Pet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _adoptionDateMeta = const VerificationMeta(
    'adoptionDate',
  );
  @override
  late final GeneratedColumn<DateTime> adoptionDate = GeneratedColumn<DateTime>(
    'adoption_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _microchipNumberMeta = const VerificationMeta(
    'microchipNumber',
  );
  @override
  late final GeneratedColumn<String> microchipNumber = GeneratedColumn<String>(
    'microchip_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bloodTypeMeta = const VerificationMeta(
    'bloodType',
  );
  @override
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
    'blood_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neuteredMeta = const VerificationMeta(
    'neutered',
  );
  @override
  late final GeneratedColumn<bool> neutered = GeneratedColumn<bool>(
    'neutered',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("neutered" IN (0, 1))',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profileFileIdMeta = const VerificationMeta(
    'profileFileId',
  );
  @override
  late final GeneratedColumn<String> profileFileId = GeneratedColumn<String>(
    'profile_file_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> archivedAt = GeneratedColumn<DateTime>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    ownerId,
    name,
    species,
    breed,
    sex,
    birthDate,
    adoptionDate,
    color,
    microchipNumber,
    bloodType,
    neutered,
    notes,
    profileFileId,
    status,
    archivedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pets';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pet> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    }
    if (data.containsKey('adoption_date')) {
      context.handle(
        _adoptionDateMeta,
        adoptionDate.isAcceptableOrUnknown(
          data['adoption_date']!,
          _adoptionDateMeta,
        ),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('microchip_number')) {
      context.handle(
        _microchipNumberMeta,
        microchipNumber.isAcceptableOrUnknown(
          data['microchip_number']!,
          _microchipNumberMeta,
        ),
      );
    }
    if (data.containsKey('blood_type')) {
      context.handle(
        _bloodTypeMeta,
        bloodType.isAcceptableOrUnknown(data['blood_type']!, _bloodTypeMeta),
      );
    }
    if (data.containsKey('neutered')) {
      context.handle(
        _neuteredMeta,
        neutered.isAcceptableOrUnknown(data['neutered']!, _neuteredMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('profile_file_id')) {
      context.handle(
        _profileFileIdMeta,
        profileFileId.isAcceptableOrUnknown(
          data['profile_file_id']!,
          _profileFileIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pet(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      ownerId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}owner_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      species:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}species'],
          )!,
      breed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breed'],
      ),
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      ),
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      ),
      adoptionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}adoption_date'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      microchipNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}microchip_number'],
      ),
      bloodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blood_type'],
      ),
      neutered: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}neutered'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      profileFileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_file_id'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}archived_at'],
      ),
    );
  }

  @override
  $PetsTable createAlias(String alias) {
    return $PetsTable(attachedDatabase, alias);
  }
}

class Pet extends DataClass implements Insertable<Pet> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String ownerId;
  final String name;
  final String species;
  final String? breed;
  final String? sex;
  final DateTime? birthDate;
  final DateTime? adoptionDate;
  final String? color;
  final String? microchipNumber;
  final String? bloodType;
  final bool? neutered;
  final String? notes;
  final String? profileFileId;
  final String status;
  final DateTime? archivedAt;
  const Pet({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.ownerId,
    required this.name,
    required this.species,
    this.breed,
    this.sex,
    this.birthDate,
    this.adoptionDate,
    this.color,
    this.microchipNumber,
    this.bloodType,
    this.neutered,
    this.notes,
    this.profileFileId,
    required this.status,
    this.archivedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['owner_id'] = Variable<String>(ownerId);
    map['name'] = Variable<String>(name);
    map['species'] = Variable<String>(species);
    if (!nullToAbsent || breed != null) {
      map['breed'] = Variable<String>(breed);
    }
    if (!nullToAbsent || sex != null) {
      map['sex'] = Variable<String>(sex);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    if (!nullToAbsent || adoptionDate != null) {
      map['adoption_date'] = Variable<DateTime>(adoptionDate);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    if (!nullToAbsent || microchipNumber != null) {
      map['microchip_number'] = Variable<String>(microchipNumber);
    }
    if (!nullToAbsent || bloodType != null) {
      map['blood_type'] = Variable<String>(bloodType);
    }
    if (!nullToAbsent || neutered != null) {
      map['neutered'] = Variable<bool>(neutered);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || profileFileId != null) {
      map['profile_file_id'] = Variable<String>(profileFileId);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<DateTime>(archivedAt);
    }
    return map;
  }

  PetsCompanion toCompanion(bool nullToAbsent) {
    return PetsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      ownerId: Value(ownerId),
      name: Value(name),
      species: Value(species),
      breed:
          breed == null && nullToAbsent ? const Value.absent() : Value(breed),
      sex: sex == null && nullToAbsent ? const Value.absent() : Value(sex),
      birthDate:
          birthDate == null && nullToAbsent
              ? const Value.absent()
              : Value(birthDate),
      adoptionDate:
          adoptionDate == null && nullToAbsent
              ? const Value.absent()
              : Value(adoptionDate),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      microchipNumber:
          microchipNumber == null && nullToAbsent
              ? const Value.absent()
              : Value(microchipNumber),
      bloodType:
          bloodType == null && nullToAbsent
              ? const Value.absent()
              : Value(bloodType),
      neutered:
          neutered == null && nullToAbsent
              ? const Value.absent()
              : Value(neutered),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      profileFileId:
          profileFileId == null && nullToAbsent
              ? const Value.absent()
              : Value(profileFileId),
      status: Value(status),
      archivedAt:
          archivedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(archivedAt),
    );
  }

  factory Pet.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pet(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      name: serializer.fromJson<String>(json['name']),
      species: serializer.fromJson<String>(json['species']),
      breed: serializer.fromJson<String?>(json['breed']),
      sex: serializer.fromJson<String?>(json['sex']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      adoptionDate: serializer.fromJson<DateTime?>(json['adoptionDate']),
      color: serializer.fromJson<String?>(json['color']),
      microchipNumber: serializer.fromJson<String?>(json['microchipNumber']),
      bloodType: serializer.fromJson<String?>(json['bloodType']),
      neutered: serializer.fromJson<bool?>(json['neutered']),
      notes: serializer.fromJson<String?>(json['notes']),
      profileFileId: serializer.fromJson<String?>(json['profileFileId']),
      status: serializer.fromJson<String>(json['status']),
      archivedAt: serializer.fromJson<DateTime?>(json['archivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'ownerId': serializer.toJson<String>(ownerId),
      'name': serializer.toJson<String>(name),
      'species': serializer.toJson<String>(species),
      'breed': serializer.toJson<String?>(breed),
      'sex': serializer.toJson<String?>(sex),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'adoptionDate': serializer.toJson<DateTime?>(adoptionDate),
      'color': serializer.toJson<String?>(color),
      'microchipNumber': serializer.toJson<String?>(microchipNumber),
      'bloodType': serializer.toJson<String?>(bloodType),
      'neutered': serializer.toJson<bool?>(neutered),
      'notes': serializer.toJson<String?>(notes),
      'profileFileId': serializer.toJson<String?>(profileFileId),
      'status': serializer.toJson<String>(status),
      'archivedAt': serializer.toJson<DateTime?>(archivedAt),
    };
  }

  Pet copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? ownerId,
    String? name,
    String? species,
    Value<String?> breed = const Value.absent(),
    Value<String?> sex = const Value.absent(),
    Value<DateTime?> birthDate = const Value.absent(),
    Value<DateTime?> adoptionDate = const Value.absent(),
    Value<String?> color = const Value.absent(),
    Value<String?> microchipNumber = const Value.absent(),
    Value<String?> bloodType = const Value.absent(),
    Value<bool?> neutered = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> profileFileId = const Value.absent(),
    String? status,
    Value<DateTime?> archivedAt = const Value.absent(),
  }) => Pet(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    ownerId: ownerId ?? this.ownerId,
    name: name ?? this.name,
    species: species ?? this.species,
    breed: breed.present ? breed.value : this.breed,
    sex: sex.present ? sex.value : this.sex,
    birthDate: birthDate.present ? birthDate.value : this.birthDate,
    adoptionDate: adoptionDate.present ? adoptionDate.value : this.adoptionDate,
    color: color.present ? color.value : this.color,
    microchipNumber:
        microchipNumber.present ? microchipNumber.value : this.microchipNumber,
    bloodType: bloodType.present ? bloodType.value : this.bloodType,
    neutered: neutered.present ? neutered.value : this.neutered,
    notes: notes.present ? notes.value : this.notes,
    profileFileId:
        profileFileId.present ? profileFileId.value : this.profileFileId,
    status: status ?? this.status,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
  );
  Pet copyWithCompanion(PetsCompanion data) {
    return Pet(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      name: data.name.present ? data.name.value : this.name,
      species: data.species.present ? data.species.value : this.species,
      breed: data.breed.present ? data.breed.value : this.breed,
      sex: data.sex.present ? data.sex.value : this.sex,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      adoptionDate:
          data.adoptionDate.present
              ? data.adoptionDate.value
              : this.adoptionDate,
      color: data.color.present ? data.color.value : this.color,
      microchipNumber:
          data.microchipNumber.present
              ? data.microchipNumber.value
              : this.microchipNumber,
      bloodType: data.bloodType.present ? data.bloodType.value : this.bloodType,
      neutered: data.neutered.present ? data.neutered.value : this.neutered,
      notes: data.notes.present ? data.notes.value : this.notes,
      profileFileId:
          data.profileFileId.present
              ? data.profileFileId.value
              : this.profileFileId,
      status: data.status.present ? data.status.value : this.status,
      archivedAt:
          data.archivedAt.present ? data.archivedAt.value : this.archivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pet(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('sex: $sex, ')
          ..write('birthDate: $birthDate, ')
          ..write('adoptionDate: $adoptionDate, ')
          ..write('color: $color, ')
          ..write('microchipNumber: $microchipNumber, ')
          ..write('bloodType: $bloodType, ')
          ..write('neutered: $neutered, ')
          ..write('notes: $notes, ')
          ..write('profileFileId: $profileFileId, ')
          ..write('status: $status, ')
          ..write('archivedAt: $archivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    ownerId,
    name,
    species,
    breed,
    sex,
    birthDate,
    adoptionDate,
    color,
    microchipNumber,
    bloodType,
    neutered,
    notes,
    profileFileId,
    status,
    archivedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pet &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.ownerId == this.ownerId &&
          other.name == this.name &&
          other.species == this.species &&
          other.breed == this.breed &&
          other.sex == this.sex &&
          other.birthDate == this.birthDate &&
          other.adoptionDate == this.adoptionDate &&
          other.color == this.color &&
          other.microchipNumber == this.microchipNumber &&
          other.bloodType == this.bloodType &&
          other.neutered == this.neutered &&
          other.notes == this.notes &&
          other.profileFileId == this.profileFileId &&
          other.status == this.status &&
          other.archivedAt == this.archivedAt);
}

class PetsCompanion extends UpdateCompanion<Pet> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> ownerId;
  final Value<String> name;
  final Value<String> species;
  final Value<String?> breed;
  final Value<String?> sex;
  final Value<DateTime?> birthDate;
  final Value<DateTime?> adoptionDate;
  final Value<String?> color;
  final Value<String?> microchipNumber;
  final Value<String?> bloodType;
  final Value<bool?> neutered;
  final Value<String?> notes;
  final Value<String?> profileFileId;
  final Value<String> status;
  final Value<DateTime?> archivedAt;
  final Value<int> rowid;
  const PetsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.name = const Value.absent(),
    this.species = const Value.absent(),
    this.breed = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.adoptionDate = const Value.absent(),
    this.color = const Value.absent(),
    this.microchipNumber = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.neutered = const Value.absent(),
    this.notes = const Value.absent(),
    this.profileFileId = const Value.absent(),
    this.status = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String ownerId,
    required String name,
    required String species,
    this.breed = const Value.absent(),
    this.sex = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.adoptionDate = const Value.absent(),
    this.color = const Value.absent(),
    this.microchipNumber = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.neutered = const Value.absent(),
    this.notes = const Value.absent(),
    this.profileFileId = const Value.absent(),
    this.status = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerId = Value(ownerId),
       name = Value(name),
       species = Value(species);
  static Insertable<Pet> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? ownerId,
    Expression<String>? name,
    Expression<String>? species,
    Expression<String>? breed,
    Expression<String>? sex,
    Expression<DateTime>? birthDate,
    Expression<DateTime>? adoptionDate,
    Expression<String>? color,
    Expression<String>? microchipNumber,
    Expression<String>? bloodType,
    Expression<bool>? neutered,
    Expression<String>? notes,
    Expression<String>? profileFileId,
    Expression<String>? status,
    Expression<DateTime>? archivedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (ownerId != null) 'owner_id': ownerId,
      if (name != null) 'name': name,
      if (species != null) 'species': species,
      if (breed != null) 'breed': breed,
      if (sex != null) 'sex': sex,
      if (birthDate != null) 'birth_date': birthDate,
      if (adoptionDate != null) 'adoption_date': adoptionDate,
      if (color != null) 'color': color,
      if (microchipNumber != null) 'microchip_number': microchipNumber,
      if (bloodType != null) 'blood_type': bloodType,
      if (neutered != null) 'neutered': neutered,
      if (notes != null) 'notes': notes,
      if (profileFileId != null) 'profile_file_id': profileFileId,
      if (status != null) 'status': status,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? ownerId,
    Value<String>? name,
    Value<String>? species,
    Value<String?>? breed,
    Value<String?>? sex,
    Value<DateTime?>? birthDate,
    Value<DateTime?>? adoptionDate,
    Value<String?>? color,
    Value<String?>? microchipNumber,
    Value<String?>? bloodType,
    Value<bool?>? neutered,
    Value<String?>? notes,
    Value<String?>? profileFileId,
    Value<String>? status,
    Value<DateTime?>? archivedAt,
    Value<int>? rowid,
  }) {
    return PetsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      sex: sex ?? this.sex,
      birthDate: birthDate ?? this.birthDate,
      adoptionDate: adoptionDate ?? this.adoptionDate,
      color: color ?? this.color,
      microchipNumber: microchipNumber ?? this.microchipNumber,
      bloodType: bloodType ?? this.bloodType,
      neutered: neutered ?? this.neutered,
      notes: notes ?? this.notes,
      profileFileId: profileFileId ?? this.profileFileId,
      status: status ?? this.status,
      archivedAt: archivedAt ?? this.archivedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (adoptionDate.present) {
      map['adoption_date'] = Variable<DateTime>(adoptionDate.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (microchipNumber.present) {
      map['microchip_number'] = Variable<String>(microchipNumber.value);
    }
    if (bloodType.present) {
      map['blood_type'] = Variable<String>(bloodType.value);
    }
    if (neutered.present) {
      map['neutered'] = Variable<bool>(neutered.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (profileFileId.present) {
      map['profile_file_id'] = Variable<String>(profileFileId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<DateTime>(archivedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('name: $name, ')
          ..write('species: $species, ')
          ..write('breed: $breed, ')
          ..write('sex: $sex, ')
          ..write('birthDate: $birthDate, ')
          ..write('adoptionDate: $adoptionDate, ')
          ..write('color: $color, ')
          ..write('microchipNumber: $microchipNumber, ')
          ..write('bloodType: $bloodType, ')
          ..write('neutered: $neutered, ')
          ..write('notes: $notes, ')
          ..write('profileFileId: $profileFileId, ')
          ..write('status: $status, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VaccinationsTable extends Vaccinations
    with TableInfo<$VaccinationsTable, Vaccination> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VaccinationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vaccineNameMeta = const VerificationMeta(
    'vaccineName',
  );
  @override
  late final GeneratedColumn<String> vaccineName = GeneratedColumn<String>(
    'vaccine_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diseaseMeta = const VerificationMeta(
    'disease',
  );
  @override
  late final GeneratedColumn<String> disease = GeneratedColumn<String>(
    'disease',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _manufacturerMeta = const VerificationMeta(
    'manufacturer',
  );
  @override
  late final GeneratedColumn<String> manufacturer = GeneratedColumn<String>(
    'manufacturer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _batchNumberMeta = const VerificationMeta(
    'batchNumber',
  );
  @override
  late final GeneratedColumn<String> batchNumber = GeneratedColumn<String>(
    'batch_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _doseNumberMeta = const VerificationMeta(
    'doseNumber',
  );
  @override
  late final GeneratedColumn<int> doseNumber = GeneratedColumn<int>(
    'dose_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _administeredOnMeta = const VerificationMeta(
    'administeredOn',
  );
  @override
  late final GeneratedColumn<DateTime> administeredOn =
      GeneratedColumn<DateTime>(
        'administered_on',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _nextDueOnMeta = const VerificationMeta(
    'nextDueOn',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueOn = GeneratedColumn<DateTime>(
    'next_due_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _veterinarianMeta = const VerificationMeta(
    'veterinarian',
  );
  @override
  late final GeneratedColumn<String> veterinarian = GeneratedColumn<String>(
    'veterinarian',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clinicMeta = const VerificationMeta('clinic');
  @override
  late final GeneratedColumn<String> clinic = GeneratedColumn<String>(
    'clinic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('completed'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    vaccineName,
    disease,
    manufacturer,
    batchNumber,
    doseNumber,
    administeredOn,
    nextDueOn,
    veterinarian,
    clinic,
    notes,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vaccinations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Vaccination> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('vaccine_name')) {
      context.handle(
        _vaccineNameMeta,
        vaccineName.isAcceptableOrUnknown(
          data['vaccine_name']!,
          _vaccineNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_vaccineNameMeta);
    }
    if (data.containsKey('disease')) {
      context.handle(
        _diseaseMeta,
        disease.isAcceptableOrUnknown(data['disease']!, _diseaseMeta),
      );
    }
    if (data.containsKey('manufacturer')) {
      context.handle(
        _manufacturerMeta,
        manufacturer.isAcceptableOrUnknown(
          data['manufacturer']!,
          _manufacturerMeta,
        ),
      );
    }
    if (data.containsKey('batch_number')) {
      context.handle(
        _batchNumberMeta,
        batchNumber.isAcceptableOrUnknown(
          data['batch_number']!,
          _batchNumberMeta,
        ),
      );
    }
    if (data.containsKey('dose_number')) {
      context.handle(
        _doseNumberMeta,
        doseNumber.isAcceptableOrUnknown(data['dose_number']!, _doseNumberMeta),
      );
    }
    if (data.containsKey('administered_on')) {
      context.handle(
        _administeredOnMeta,
        administeredOn.isAcceptableOrUnknown(
          data['administered_on']!,
          _administeredOnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_administeredOnMeta);
    }
    if (data.containsKey('next_due_on')) {
      context.handle(
        _nextDueOnMeta,
        nextDueOn.isAcceptableOrUnknown(data['next_due_on']!, _nextDueOnMeta),
      );
    }
    if (data.containsKey('veterinarian')) {
      context.handle(
        _veterinarianMeta,
        veterinarian.isAcceptableOrUnknown(
          data['veterinarian']!,
          _veterinarianMeta,
        ),
      );
    }
    if (data.containsKey('clinic')) {
      context.handle(
        _clinicMeta,
        clinic.isAcceptableOrUnknown(data['clinic']!, _clinicMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vaccination map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vaccination(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_id'],
          )!,
      vaccineName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}vaccine_name'],
          )!,
      disease: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}disease'],
      ),
      manufacturer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manufacturer'],
      ),
      batchNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}batch_number'],
      ),
      doseNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}dose_number'],
      ),
      administeredOn:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}administered_on'],
          )!,
      nextDueOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_on'],
      ),
      veterinarian: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}veterinarian'],
      ),
      clinic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}clinic'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $VaccinationsTable createAlias(String alias) {
    return $VaccinationsTable(attachedDatabase, alias);
  }
}

class Vaccination extends DataClass implements Insertable<Vaccination> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petId;
  final String vaccineName;
  final String? disease;
  final String? manufacturer;
  final String? batchNumber;
  final int? doseNumber;
  final DateTime administeredOn;
  final DateTime? nextDueOn;
  final String? veterinarian;
  final String? clinic;
  final String? notes;
  final String status;
  const Vaccination({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petId,
    required this.vaccineName,
    this.disease,
    this.manufacturer,
    this.batchNumber,
    this.doseNumber,
    required this.administeredOn,
    this.nextDueOn,
    this.veterinarian,
    this.clinic,
    this.notes,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['vaccine_name'] = Variable<String>(vaccineName);
    if (!nullToAbsent || disease != null) {
      map['disease'] = Variable<String>(disease);
    }
    if (!nullToAbsent || manufacturer != null) {
      map['manufacturer'] = Variable<String>(manufacturer);
    }
    if (!nullToAbsent || batchNumber != null) {
      map['batch_number'] = Variable<String>(batchNumber);
    }
    if (!nullToAbsent || doseNumber != null) {
      map['dose_number'] = Variable<int>(doseNumber);
    }
    map['administered_on'] = Variable<DateTime>(administeredOn);
    if (!nullToAbsent || nextDueOn != null) {
      map['next_due_on'] = Variable<DateTime>(nextDueOn);
    }
    if (!nullToAbsent || veterinarian != null) {
      map['veterinarian'] = Variable<String>(veterinarian);
    }
    if (!nullToAbsent || clinic != null) {
      map['clinic'] = Variable<String>(clinic);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  VaccinationsCompanion toCompanion(bool nullToAbsent) {
    return VaccinationsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId: Value(petId),
      vaccineName: Value(vaccineName),
      disease:
          disease == null && nullToAbsent
              ? const Value.absent()
              : Value(disease),
      manufacturer:
          manufacturer == null && nullToAbsent
              ? const Value.absent()
              : Value(manufacturer),
      batchNumber:
          batchNumber == null && nullToAbsent
              ? const Value.absent()
              : Value(batchNumber),
      doseNumber:
          doseNumber == null && nullToAbsent
              ? const Value.absent()
              : Value(doseNumber),
      administeredOn: Value(administeredOn),
      nextDueOn:
          nextDueOn == null && nullToAbsent
              ? const Value.absent()
              : Value(nextDueOn),
      veterinarian:
          veterinarian == null && nullToAbsent
              ? const Value.absent()
              : Value(veterinarian),
      clinic:
          clinic == null && nullToAbsent ? const Value.absent() : Value(clinic),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      status: Value(status),
    );
  }

  factory Vaccination.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vaccination(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      vaccineName: serializer.fromJson<String>(json['vaccineName']),
      disease: serializer.fromJson<String?>(json['disease']),
      manufacturer: serializer.fromJson<String?>(json['manufacturer']),
      batchNumber: serializer.fromJson<String?>(json['batchNumber']),
      doseNumber: serializer.fromJson<int?>(json['doseNumber']),
      administeredOn: serializer.fromJson<DateTime>(json['administeredOn']),
      nextDueOn: serializer.fromJson<DateTime?>(json['nextDueOn']),
      veterinarian: serializer.fromJson<String?>(json['veterinarian']),
      clinic: serializer.fromJson<String?>(json['clinic']),
      notes: serializer.fromJson<String?>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'vaccineName': serializer.toJson<String>(vaccineName),
      'disease': serializer.toJson<String?>(disease),
      'manufacturer': serializer.toJson<String?>(manufacturer),
      'batchNumber': serializer.toJson<String?>(batchNumber),
      'doseNumber': serializer.toJson<int?>(doseNumber),
      'administeredOn': serializer.toJson<DateTime>(administeredOn),
      'nextDueOn': serializer.toJson<DateTime?>(nextDueOn),
      'veterinarian': serializer.toJson<String?>(veterinarian),
      'clinic': serializer.toJson<String?>(clinic),
      'notes': serializer.toJson<String?>(notes),
      'status': serializer.toJson<String>(status),
    };
  }

  Vaccination copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petId,
    String? vaccineName,
    Value<String?> disease = const Value.absent(),
    Value<String?> manufacturer = const Value.absent(),
    Value<String?> batchNumber = const Value.absent(),
    Value<int?> doseNumber = const Value.absent(),
    DateTime? administeredOn,
    Value<DateTime?> nextDueOn = const Value.absent(),
    Value<String?> veterinarian = const Value.absent(),
    Value<String?> clinic = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? status,
  }) => Vaccination(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId ?? this.petId,
    vaccineName: vaccineName ?? this.vaccineName,
    disease: disease.present ? disease.value : this.disease,
    manufacturer: manufacturer.present ? manufacturer.value : this.manufacturer,
    batchNumber: batchNumber.present ? batchNumber.value : this.batchNumber,
    doseNumber: doseNumber.present ? doseNumber.value : this.doseNumber,
    administeredOn: administeredOn ?? this.administeredOn,
    nextDueOn: nextDueOn.present ? nextDueOn.value : this.nextDueOn,
    veterinarian: veterinarian.present ? veterinarian.value : this.veterinarian,
    clinic: clinic.present ? clinic.value : this.clinic,
    notes: notes.present ? notes.value : this.notes,
    status: status ?? this.status,
  );
  Vaccination copyWithCompanion(VaccinationsCompanion data) {
    return Vaccination(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      vaccineName:
          data.vaccineName.present ? data.vaccineName.value : this.vaccineName,
      disease: data.disease.present ? data.disease.value : this.disease,
      manufacturer:
          data.manufacturer.present
              ? data.manufacturer.value
              : this.manufacturer,
      batchNumber:
          data.batchNumber.present ? data.batchNumber.value : this.batchNumber,
      doseNumber:
          data.doseNumber.present ? data.doseNumber.value : this.doseNumber,
      administeredOn:
          data.administeredOn.present
              ? data.administeredOn.value
              : this.administeredOn,
      nextDueOn: data.nextDueOn.present ? data.nextDueOn.value : this.nextDueOn,
      veterinarian:
          data.veterinarian.present
              ? data.veterinarian.value
              : this.veterinarian,
      clinic: data.clinic.present ? data.clinic.value : this.clinic,
      notes: data.notes.present ? data.notes.value : this.notes,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vaccination(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('disease: $disease, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('doseNumber: $doseNumber, ')
          ..write('administeredOn: $administeredOn, ')
          ..write('nextDueOn: $nextDueOn, ')
          ..write('veterinarian: $veterinarian, ')
          ..write('clinic: $clinic, ')
          ..write('notes: $notes, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    vaccineName,
    disease,
    manufacturer,
    batchNumber,
    doseNumber,
    administeredOn,
    nextDueOn,
    veterinarian,
    clinic,
    notes,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vaccination &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.vaccineName == this.vaccineName &&
          other.disease == this.disease &&
          other.manufacturer == this.manufacturer &&
          other.batchNumber == this.batchNumber &&
          other.doseNumber == this.doseNumber &&
          other.administeredOn == this.administeredOn &&
          other.nextDueOn == this.nextDueOn &&
          other.veterinarian == this.veterinarian &&
          other.clinic == this.clinic &&
          other.notes == this.notes &&
          other.status == this.status);
}

class VaccinationsCompanion extends UpdateCompanion<Vaccination> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petId;
  final Value<String> vaccineName;
  final Value<String?> disease;
  final Value<String?> manufacturer;
  final Value<String?> batchNumber;
  final Value<int?> doseNumber;
  final Value<DateTime> administeredOn;
  final Value<DateTime?> nextDueOn;
  final Value<String?> veterinarian;
  final Value<String?> clinic;
  final Value<String?> notes;
  final Value<String> status;
  final Value<int> rowid;
  const VaccinationsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.vaccineName = const Value.absent(),
    this.disease = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.batchNumber = const Value.absent(),
    this.doseNumber = const Value.absent(),
    this.administeredOn = const Value.absent(),
    this.nextDueOn = const Value.absent(),
    this.veterinarian = const Value.absent(),
    this.clinic = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VaccinationsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petId,
    required String vaccineName,
    this.disease = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.batchNumber = const Value.absent(),
    this.doseNumber = const Value.absent(),
    required DateTime administeredOn,
    this.nextDueOn = const Value.absent(),
    this.veterinarian = const Value.absent(),
    this.clinic = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       vaccineName = Value(vaccineName),
       administeredOn = Value(administeredOn);
  static Insertable<Vaccination> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? vaccineName,
    Expression<String>? disease,
    Expression<String>? manufacturer,
    Expression<String>? batchNumber,
    Expression<int>? doseNumber,
    Expression<DateTime>? administeredOn,
    Expression<DateTime>? nextDueOn,
    Expression<String>? veterinarian,
    Expression<String>? clinic,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (vaccineName != null) 'vaccine_name': vaccineName,
      if (disease != null) 'disease': disease,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (batchNumber != null) 'batch_number': batchNumber,
      if (doseNumber != null) 'dose_number': doseNumber,
      if (administeredOn != null) 'administered_on': administeredOn,
      if (nextDueOn != null) 'next_due_on': nextDueOn,
      if (veterinarian != null) 'veterinarian': veterinarian,
      if (clinic != null) 'clinic': clinic,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VaccinationsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petId,
    Value<String>? vaccineName,
    Value<String?>? disease,
    Value<String?>? manufacturer,
    Value<String?>? batchNumber,
    Value<int?>? doseNumber,
    Value<DateTime>? administeredOn,
    Value<DateTime?>? nextDueOn,
    Value<String?>? veterinarian,
    Value<String?>? clinic,
    Value<String?>? notes,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return VaccinationsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      vaccineName: vaccineName ?? this.vaccineName,
      disease: disease ?? this.disease,
      manufacturer: manufacturer ?? this.manufacturer,
      batchNumber: batchNumber ?? this.batchNumber,
      doseNumber: doseNumber ?? this.doseNumber,
      administeredOn: administeredOn ?? this.administeredOn,
      nextDueOn: nextDueOn ?? this.nextDueOn,
      veterinarian: veterinarian ?? this.veterinarian,
      clinic: clinic ?? this.clinic,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (vaccineName.present) {
      map['vaccine_name'] = Variable<String>(vaccineName.value);
    }
    if (disease.present) {
      map['disease'] = Variable<String>(disease.value);
    }
    if (manufacturer.present) {
      map['manufacturer'] = Variable<String>(manufacturer.value);
    }
    if (batchNumber.present) {
      map['batch_number'] = Variable<String>(batchNumber.value);
    }
    if (doseNumber.present) {
      map['dose_number'] = Variable<int>(doseNumber.value);
    }
    if (administeredOn.present) {
      map['administered_on'] = Variable<DateTime>(administeredOn.value);
    }
    if (nextDueOn.present) {
      map['next_due_on'] = Variable<DateTime>(nextDueOn.value);
    }
    if (veterinarian.present) {
      map['veterinarian'] = Variable<String>(veterinarian.value);
    }
    if (clinic.present) {
      map['clinic'] = Variable<String>(clinic.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VaccinationsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('disease: $disease, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('doseNumber: $doseNumber, ')
          ..write('administeredOn: $administeredOn, ')
          ..write('nextDueOn: $nextDueOn, ')
          ..write('veterinarian: $veterinarian, ')
          ..write('clinic: $clinic, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicalRecordsTable extends MedicalRecords
    with TableInfo<$MedicalRecordsTable, MedicalRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicalRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordTypeMeta = const VerificationMeta(
    'recordType',
  );
  @override
  late final GeneratedColumn<String> recordType = GeneratedColumn<String>(
    'record_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredOnMeta = const VerificationMeta(
    'occurredOn',
  );
  @override
  late final GeneratedColumn<DateTime> occurredOn = GeneratedColumn<DateTime>(
    'occurred_on',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _symptomsMeta = const VerificationMeta(
    'symptoms',
  );
  @override
  late final GeneratedColumn<String> symptoms = GeneratedColumn<String>(
    'symptoms',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diagnosisMeta = const VerificationMeta(
    'diagnosis',
  );
  @override
  late final GeneratedColumn<String> diagnosis = GeneratedColumn<String>(
    'diagnosis',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _treatmentMeta = const VerificationMeta(
    'treatment',
  );
  @override
  late final GeneratedColumn<String> treatment = GeneratedColumn<String>(
    'treatment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _veterinarianMeta = const VerificationMeta(
    'veterinarian',
  );
  @override
  late final GeneratedColumn<String> veterinarian = GeneratedColumn<String>(
    'veterinarian',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clinicMeta = const VerificationMeta('clinic');
  @override
  late final GeneratedColumn<String> clinic = GeneratedColumn<String>(
    'clinic',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _followUpOnMeta = const VerificationMeta(
    'followUpOn',
  );
  @override
  late final GeneratedColumn<DateTime> followUpOn = GeneratedColumn<DateTime>(
    'follow_up_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    recordType,
    occurredOn,
    title,
    symptoms,
    diagnosis,
    treatment,
    veterinarian,
    clinic,
    followUpOn,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medical_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicalRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('record_type')) {
      context.handle(
        _recordTypeMeta,
        recordType.isAcceptableOrUnknown(data['record_type']!, _recordTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_recordTypeMeta);
    }
    if (data.containsKey('occurred_on')) {
      context.handle(
        _occurredOnMeta,
        occurredOn.isAcceptableOrUnknown(data['occurred_on']!, _occurredOnMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredOnMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('symptoms')) {
      context.handle(
        _symptomsMeta,
        symptoms.isAcceptableOrUnknown(data['symptoms']!, _symptomsMeta),
      );
    }
    if (data.containsKey('diagnosis')) {
      context.handle(
        _diagnosisMeta,
        diagnosis.isAcceptableOrUnknown(data['diagnosis']!, _diagnosisMeta),
      );
    }
    if (data.containsKey('treatment')) {
      context.handle(
        _treatmentMeta,
        treatment.isAcceptableOrUnknown(data['treatment']!, _treatmentMeta),
      );
    }
    if (data.containsKey('veterinarian')) {
      context.handle(
        _veterinarianMeta,
        veterinarian.isAcceptableOrUnknown(
          data['veterinarian']!,
          _veterinarianMeta,
        ),
      );
    }
    if (data.containsKey('clinic')) {
      context.handle(
        _clinicMeta,
        clinic.isAcceptableOrUnknown(data['clinic']!, _clinicMeta),
      );
    }
    if (data.containsKey('follow_up_on')) {
      context.handle(
        _followUpOnMeta,
        followUpOn.isAcceptableOrUnknown(
          data['follow_up_on']!,
          _followUpOnMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicalRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicalRecord(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_id'],
          )!,
      recordType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}record_type'],
          )!,
      occurredOn:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}occurred_on'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      symptoms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symptoms'],
      ),
      diagnosis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diagnosis'],
      ),
      treatment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}treatment'],
      ),
      veterinarian: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}veterinarian'],
      ),
      clinic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}clinic'],
      ),
      followUpOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}follow_up_on'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $MedicalRecordsTable createAlias(String alias) {
    return $MedicalRecordsTable(attachedDatabase, alias);
  }
}

class MedicalRecord extends DataClass implements Insertable<MedicalRecord> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petId;
  final String recordType;
  final DateTime occurredOn;
  final String title;
  final String? symptoms;
  final String? diagnosis;
  final String? treatment;
  final String? veterinarian;
  final String? clinic;
  final DateTime? followUpOn;
  final String? notes;
  const MedicalRecord({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petId,
    required this.recordType,
    required this.occurredOn,
    required this.title,
    this.symptoms,
    this.diagnosis,
    this.treatment,
    this.veterinarian,
    this.clinic,
    this.followUpOn,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['record_type'] = Variable<String>(recordType);
    map['occurred_on'] = Variable<DateTime>(occurredOn);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || symptoms != null) {
      map['symptoms'] = Variable<String>(symptoms);
    }
    if (!nullToAbsent || diagnosis != null) {
      map['diagnosis'] = Variable<String>(diagnosis);
    }
    if (!nullToAbsent || treatment != null) {
      map['treatment'] = Variable<String>(treatment);
    }
    if (!nullToAbsent || veterinarian != null) {
      map['veterinarian'] = Variable<String>(veterinarian);
    }
    if (!nullToAbsent || clinic != null) {
      map['clinic'] = Variable<String>(clinic);
    }
    if (!nullToAbsent || followUpOn != null) {
      map['follow_up_on'] = Variable<DateTime>(followUpOn);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MedicalRecordsCompanion toCompanion(bool nullToAbsent) {
    return MedicalRecordsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId: Value(petId),
      recordType: Value(recordType),
      occurredOn: Value(occurredOn),
      title: Value(title),
      symptoms:
          symptoms == null && nullToAbsent
              ? const Value.absent()
              : Value(symptoms),
      diagnosis:
          diagnosis == null && nullToAbsent
              ? const Value.absent()
              : Value(diagnosis),
      treatment:
          treatment == null && nullToAbsent
              ? const Value.absent()
              : Value(treatment),
      veterinarian:
          veterinarian == null && nullToAbsent
              ? const Value.absent()
              : Value(veterinarian),
      clinic:
          clinic == null && nullToAbsent ? const Value.absent() : Value(clinic),
      followUpOn:
          followUpOn == null && nullToAbsent
              ? const Value.absent()
              : Value(followUpOn),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory MedicalRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicalRecord(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      recordType: serializer.fromJson<String>(json['recordType']),
      occurredOn: serializer.fromJson<DateTime>(json['occurredOn']),
      title: serializer.fromJson<String>(json['title']),
      symptoms: serializer.fromJson<String?>(json['symptoms']),
      diagnosis: serializer.fromJson<String?>(json['diagnosis']),
      treatment: serializer.fromJson<String?>(json['treatment']),
      veterinarian: serializer.fromJson<String?>(json['veterinarian']),
      clinic: serializer.fromJson<String?>(json['clinic']),
      followUpOn: serializer.fromJson<DateTime?>(json['followUpOn']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'recordType': serializer.toJson<String>(recordType),
      'occurredOn': serializer.toJson<DateTime>(occurredOn),
      'title': serializer.toJson<String>(title),
      'symptoms': serializer.toJson<String?>(symptoms),
      'diagnosis': serializer.toJson<String?>(diagnosis),
      'treatment': serializer.toJson<String?>(treatment),
      'veterinarian': serializer.toJson<String?>(veterinarian),
      'clinic': serializer.toJson<String?>(clinic),
      'followUpOn': serializer.toJson<DateTime?>(followUpOn),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  MedicalRecord copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petId,
    String? recordType,
    DateTime? occurredOn,
    String? title,
    Value<String?> symptoms = const Value.absent(),
    Value<String?> diagnosis = const Value.absent(),
    Value<String?> treatment = const Value.absent(),
    Value<String?> veterinarian = const Value.absent(),
    Value<String?> clinic = const Value.absent(),
    Value<DateTime?> followUpOn = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => MedicalRecord(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId ?? this.petId,
    recordType: recordType ?? this.recordType,
    occurredOn: occurredOn ?? this.occurredOn,
    title: title ?? this.title,
    symptoms: symptoms.present ? symptoms.value : this.symptoms,
    diagnosis: diagnosis.present ? diagnosis.value : this.diagnosis,
    treatment: treatment.present ? treatment.value : this.treatment,
    veterinarian: veterinarian.present ? veterinarian.value : this.veterinarian,
    clinic: clinic.present ? clinic.value : this.clinic,
    followUpOn: followUpOn.present ? followUpOn.value : this.followUpOn,
    notes: notes.present ? notes.value : this.notes,
  );
  MedicalRecord copyWithCompanion(MedicalRecordsCompanion data) {
    return MedicalRecord(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      recordType:
          data.recordType.present ? data.recordType.value : this.recordType,
      occurredOn:
          data.occurredOn.present ? data.occurredOn.value : this.occurredOn,
      title: data.title.present ? data.title.value : this.title,
      symptoms: data.symptoms.present ? data.symptoms.value : this.symptoms,
      diagnosis: data.diagnosis.present ? data.diagnosis.value : this.diagnosis,
      treatment: data.treatment.present ? data.treatment.value : this.treatment,
      veterinarian:
          data.veterinarian.present
              ? data.veterinarian.value
              : this.veterinarian,
      clinic: data.clinic.present ? data.clinic.value : this.clinic,
      followUpOn:
          data.followUpOn.present ? data.followUpOn.value : this.followUpOn,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicalRecord(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('recordType: $recordType, ')
          ..write('occurredOn: $occurredOn, ')
          ..write('title: $title, ')
          ..write('symptoms: $symptoms, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('treatment: $treatment, ')
          ..write('veterinarian: $veterinarian, ')
          ..write('clinic: $clinic, ')
          ..write('followUpOn: $followUpOn, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    recordType,
    occurredOn,
    title,
    symptoms,
    diagnosis,
    treatment,
    veterinarian,
    clinic,
    followUpOn,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicalRecord &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.recordType == this.recordType &&
          other.occurredOn == this.occurredOn &&
          other.title == this.title &&
          other.symptoms == this.symptoms &&
          other.diagnosis == this.diagnosis &&
          other.treatment == this.treatment &&
          other.veterinarian == this.veterinarian &&
          other.clinic == this.clinic &&
          other.followUpOn == this.followUpOn &&
          other.notes == this.notes);
}

class MedicalRecordsCompanion extends UpdateCompanion<MedicalRecord> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petId;
  final Value<String> recordType;
  final Value<DateTime> occurredOn;
  final Value<String> title;
  final Value<String?> symptoms;
  final Value<String?> diagnosis;
  final Value<String?> treatment;
  final Value<String?> veterinarian;
  final Value<String?> clinic;
  final Value<DateTime?> followUpOn;
  final Value<String?> notes;
  final Value<int> rowid;
  const MedicalRecordsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.recordType = const Value.absent(),
    this.occurredOn = const Value.absent(),
    this.title = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.treatment = const Value.absent(),
    this.veterinarian = const Value.absent(),
    this.clinic = const Value.absent(),
    this.followUpOn = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicalRecordsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petId,
    required String recordType,
    required DateTime occurredOn,
    required String title,
    this.symptoms = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.treatment = const Value.absent(),
    this.veterinarian = const Value.absent(),
    this.clinic = const Value.absent(),
    this.followUpOn = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       recordType = Value(recordType),
       occurredOn = Value(occurredOn),
       title = Value(title);
  static Insertable<MedicalRecord> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? recordType,
    Expression<DateTime>? occurredOn,
    Expression<String>? title,
    Expression<String>? symptoms,
    Expression<String>? diagnosis,
    Expression<String>? treatment,
    Expression<String>? veterinarian,
    Expression<String>? clinic,
    Expression<DateTime>? followUpOn,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (recordType != null) 'record_type': recordType,
      if (occurredOn != null) 'occurred_on': occurredOn,
      if (title != null) 'title': title,
      if (symptoms != null) 'symptoms': symptoms,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (treatment != null) 'treatment': treatment,
      if (veterinarian != null) 'veterinarian': veterinarian,
      if (clinic != null) 'clinic': clinic,
      if (followUpOn != null) 'follow_up_on': followUpOn,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicalRecordsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petId,
    Value<String>? recordType,
    Value<DateTime>? occurredOn,
    Value<String>? title,
    Value<String?>? symptoms,
    Value<String?>? diagnosis,
    Value<String?>? treatment,
    Value<String?>? veterinarian,
    Value<String?>? clinic,
    Value<DateTime?>? followUpOn,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return MedicalRecordsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      recordType: recordType ?? this.recordType,
      occurredOn: occurredOn ?? this.occurredOn,
      title: title ?? this.title,
      symptoms: symptoms ?? this.symptoms,
      diagnosis: diagnosis ?? this.diagnosis,
      treatment: treatment ?? this.treatment,
      veterinarian: veterinarian ?? this.veterinarian,
      clinic: clinic ?? this.clinic,
      followUpOn: followUpOn ?? this.followUpOn,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (recordType.present) {
      map['record_type'] = Variable<String>(recordType.value);
    }
    if (occurredOn.present) {
      map['occurred_on'] = Variable<DateTime>(occurredOn.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (symptoms.present) {
      map['symptoms'] = Variable<String>(symptoms.value);
    }
    if (diagnosis.present) {
      map['diagnosis'] = Variable<String>(diagnosis.value);
    }
    if (treatment.present) {
      map['treatment'] = Variable<String>(treatment.value);
    }
    if (veterinarian.present) {
      map['veterinarian'] = Variable<String>(veterinarian.value);
    }
    if (clinic.present) {
      map['clinic'] = Variable<String>(clinic.value);
    }
    if (followUpOn.present) {
      map['follow_up_on'] = Variable<DateTime>(followUpOn.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicalRecordsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('recordType: $recordType, ')
          ..write('occurredOn: $occurredOn, ')
          ..write('title: $title, ')
          ..write('symptoms: $symptoms, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('treatment: $treatment, ')
          ..write('veterinarian: $veterinarian, ')
          ..write('clinic: $clinic, ')
          ..write('followUpOn: $followUpOn, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicinesTable extends Medicines
    with TableInfo<$MedicinesTable, Medicine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formMeta = const VerificationMeta('form');
  @override
  late final GeneratedColumn<String> form = GeneratedColumn<String>(
    'form',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _strengthMeta = const VerificationMeta(
    'strength',
  );
  @override
  late final GeneratedColumn<String> strength = GeneratedColumn<String>(
    'strength',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _manufacturerMeta = const VerificationMeta(
    'manufacturer',
  );
  @override
  late final GeneratedColumn<String> manufacturer = GeneratedColumn<String>(
    'manufacturer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    name,
    form,
    strength,
    manufacturer,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicines';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medicine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('form')) {
      context.handle(
        _formMeta,
        form.isAcceptableOrUnknown(data['form']!, _formMeta),
      );
    }
    if (data.containsKey('strength')) {
      context.handle(
        _strengthMeta,
        strength.isAcceptableOrUnknown(data['strength']!, _strengthMeta),
      );
    }
    if (data.containsKey('manufacturer')) {
      context.handle(
        _manufacturerMeta,
        manufacturer.isAcceptableOrUnknown(
          data['manufacturer']!,
          _manufacturerMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medicine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medicine(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      form: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}form'],
      ),
      strength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}strength'],
      ),
      manufacturer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manufacturer'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $MedicinesTable createAlias(String alias) {
    return $MedicinesTable(attachedDatabase, alias);
  }
}

class Medicine extends DataClass implements Insertable<Medicine> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String name;
  final String? form;
  final String? strength;
  final String? manufacturer;
  final String? notes;
  const Medicine({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.name,
    this.form,
    this.strength,
    this.manufacturer,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || form != null) {
      map['form'] = Variable<String>(form);
    }
    if (!nullToAbsent || strength != null) {
      map['strength'] = Variable<String>(strength);
    }
    if (!nullToAbsent || manufacturer != null) {
      map['manufacturer'] = Variable<String>(manufacturer);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MedicinesCompanion toCompanion(bool nullToAbsent) {
    return MedicinesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      name: Value(name),
      form: form == null && nullToAbsent ? const Value.absent() : Value(form),
      strength:
          strength == null && nullToAbsent
              ? const Value.absent()
              : Value(strength),
      manufacturer:
          manufacturer == null && nullToAbsent
              ? const Value.absent()
              : Value(manufacturer),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Medicine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medicine(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      form: serializer.fromJson<String?>(json['form']),
      strength: serializer.fromJson<String?>(json['strength']),
      manufacturer: serializer.fromJson<String?>(json['manufacturer']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'form': serializer.toJson<String?>(form),
      'strength': serializer.toJson<String?>(strength),
      'manufacturer': serializer.toJson<String?>(manufacturer),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Medicine copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? name,
    Value<String?> form = const Value.absent(),
    Value<String?> strength = const Value.absent(),
    Value<String?> manufacturer = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Medicine(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    name: name ?? this.name,
    form: form.present ? form.value : this.form,
    strength: strength.present ? strength.value : this.strength,
    manufacturer: manufacturer.present ? manufacturer.value : this.manufacturer,
    notes: notes.present ? notes.value : this.notes,
  );
  Medicine copyWithCompanion(MedicinesCompanion data) {
    return Medicine(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      form: data.form.present ? data.form.value : this.form,
      strength: data.strength.present ? data.strength.value : this.strength,
      manufacturer:
          data.manufacturer.present
              ? data.manufacturer.value
              : this.manufacturer,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medicine(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('form: $form, ')
          ..write('strength: $strength, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    name,
    form,
    strength,
    manufacturer,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medicine &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.name == this.name &&
          other.form == this.form &&
          other.strength == this.strength &&
          other.manufacturer == this.manufacturer &&
          other.notes == this.notes);
}

class MedicinesCompanion extends UpdateCompanion<Medicine> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> name;
  final Value<String?> form;
  final Value<String?> strength;
  final Value<String?> manufacturer;
  final Value<String?> notes;
  final Value<int> rowid;
  const MedicinesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.form = const Value.absent(),
    this.strength = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicinesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String name,
    this.form = const Value.absent(),
    this.strength = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Medicine> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? form,
    Expression<String>? strength,
    Expression<String>? manufacturer,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (form != null) 'form': form,
      if (strength != null) 'strength': strength,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicinesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? name,
    Value<String?>? form,
    Value<String?>? strength,
    Value<String?>? manufacturer,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return MedicinesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      form: form ?? this.form,
      strength: strength ?? this.strength,
      manufacturer: manufacturer ?? this.manufacturer,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (form.present) {
      map['form'] = Variable<String>(form.value);
    }
    if (strength.present) {
      map['strength'] = Variable<String>(strength.value);
    }
    if (manufacturer.present) {
      map['manufacturer'] = Variable<String>(manufacturer.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicinesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('form: $form, ')
          ..write('strength: $strength, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PetMedicationsTable extends PetMedications
    with TableInfo<$PetMedicationsTable, PetMedication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetMedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<String> medicineId = GeneratedColumn<String>(
    'medicine_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
    'dosage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
    'route',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _instructionsMeta = const VerificationMeta(
    'instructions',
  );
  @override
  late final GeneratedColumn<String> instructions = GeneratedColumn<String>(
    'instructions',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescribedByMeta = const VerificationMeta(
    'prescribedBy',
  );
  @override
  late final GeneratedColumn<String> prescribedBy = GeneratedColumn<String>(
    'prescribed_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _asNeededMeta = const VerificationMeta(
    'asNeeded',
  );
  @override
  late final GeneratedColumn<bool> asNeeded = GeneratedColumn<bool>(
    'as_needed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("as_needed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    medicineId,
    dosage,
    route,
    instructions,
    prescribedBy,
    startDate,
    endDate,
    asNeeded,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pet_medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<PetMedication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(
        _dosageMeta,
        dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta),
      );
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('route')) {
      context.handle(
        _routeMeta,
        route.isAcceptableOrUnknown(data['route']!, _routeMeta),
      );
    }
    if (data.containsKey('instructions')) {
      context.handle(
        _instructionsMeta,
        instructions.isAcceptableOrUnknown(
          data['instructions']!,
          _instructionsMeta,
        ),
      );
    }
    if (data.containsKey('prescribed_by')) {
      context.handle(
        _prescribedByMeta,
        prescribedBy.isAcceptableOrUnknown(
          data['prescribed_by']!,
          _prescribedByMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('as_needed')) {
      context.handle(
        _asNeededMeta,
        asNeeded.isAcceptableOrUnknown(data['as_needed']!, _asNeededMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PetMedication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PetMedication(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_id'],
          )!,
      medicineId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}medicine_id'],
          )!,
      dosage:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}dosage'],
          )!,
      route: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route'],
      ),
      instructions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}instructions'],
      ),
      prescribedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescribed_by'],
      ),
      startDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}start_date'],
          )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      asNeeded:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}as_needed'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $PetMedicationsTable createAlias(String alias) {
    return $PetMedicationsTable(attachedDatabase, alias);
  }
}

class PetMedication extends DataClass implements Insertable<PetMedication> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petId;
  final String medicineId;
  final String dosage;
  final String? route;
  final String? instructions;
  final String? prescribedBy;
  final DateTime startDate;
  final DateTime? endDate;
  final bool asNeeded;
  final String status;
  const PetMedication({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petId,
    required this.medicineId,
    required this.dosage,
    this.route,
    this.instructions,
    this.prescribedBy,
    required this.startDate,
    this.endDate,
    required this.asNeeded,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['medicine_id'] = Variable<String>(medicineId);
    map['dosage'] = Variable<String>(dosage);
    if (!nullToAbsent || route != null) {
      map['route'] = Variable<String>(route);
    }
    if (!nullToAbsent || instructions != null) {
      map['instructions'] = Variable<String>(instructions);
    }
    if (!nullToAbsent || prescribedBy != null) {
      map['prescribed_by'] = Variable<String>(prescribedBy);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['as_needed'] = Variable<bool>(asNeeded);
    map['status'] = Variable<String>(status);
    return map;
  }

  PetMedicationsCompanion toCompanion(bool nullToAbsent) {
    return PetMedicationsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId: Value(petId),
      medicineId: Value(medicineId),
      dosage: Value(dosage),
      route:
          route == null && nullToAbsent ? const Value.absent() : Value(route),
      instructions:
          instructions == null && nullToAbsent
              ? const Value.absent()
              : Value(instructions),
      prescribedBy:
          prescribedBy == null && nullToAbsent
              ? const Value.absent()
              : Value(prescribedBy),
      startDate: Value(startDate),
      endDate:
          endDate == null && nullToAbsent
              ? const Value.absent()
              : Value(endDate),
      asNeeded: Value(asNeeded),
      status: Value(status),
    );
  }

  factory PetMedication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PetMedication(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      medicineId: serializer.fromJson<String>(json['medicineId']),
      dosage: serializer.fromJson<String>(json['dosage']),
      route: serializer.fromJson<String?>(json['route']),
      instructions: serializer.fromJson<String?>(json['instructions']),
      prescribedBy: serializer.fromJson<String?>(json['prescribedBy']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      asNeeded: serializer.fromJson<bool>(json['asNeeded']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'medicineId': serializer.toJson<String>(medicineId),
      'dosage': serializer.toJson<String>(dosage),
      'route': serializer.toJson<String?>(route),
      'instructions': serializer.toJson<String?>(instructions),
      'prescribedBy': serializer.toJson<String?>(prescribedBy),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'asNeeded': serializer.toJson<bool>(asNeeded),
      'status': serializer.toJson<String>(status),
    };
  }

  PetMedication copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petId,
    String? medicineId,
    String? dosage,
    Value<String?> route = const Value.absent(),
    Value<String?> instructions = const Value.absent(),
    Value<String?> prescribedBy = const Value.absent(),
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    bool? asNeeded,
    String? status,
  }) => PetMedication(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId ?? this.petId,
    medicineId: medicineId ?? this.medicineId,
    dosage: dosage ?? this.dosage,
    route: route.present ? route.value : this.route,
    instructions: instructions.present ? instructions.value : this.instructions,
    prescribedBy: prescribedBy.present ? prescribedBy.value : this.prescribedBy,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    asNeeded: asNeeded ?? this.asNeeded,
    status: status ?? this.status,
  );
  PetMedication copyWithCompanion(PetMedicationsCompanion data) {
    return PetMedication(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      medicineId:
          data.medicineId.present ? data.medicineId.value : this.medicineId,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      route: data.route.present ? data.route.value : this.route,
      instructions:
          data.instructions.present
              ? data.instructions.value
              : this.instructions,
      prescribedBy:
          data.prescribedBy.present
              ? data.prescribedBy.value
              : this.prescribedBy,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      asNeeded: data.asNeeded.present ? data.asNeeded.value : this.asNeeded,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PetMedication(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('medicineId: $medicineId, ')
          ..write('dosage: $dosage, ')
          ..write('route: $route, ')
          ..write('instructions: $instructions, ')
          ..write('prescribedBy: $prescribedBy, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('asNeeded: $asNeeded, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    medicineId,
    dosage,
    route,
    instructions,
    prescribedBy,
    startDate,
    endDate,
    asNeeded,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PetMedication &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.medicineId == this.medicineId &&
          other.dosage == this.dosage &&
          other.route == this.route &&
          other.instructions == this.instructions &&
          other.prescribedBy == this.prescribedBy &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.asNeeded == this.asNeeded &&
          other.status == this.status);
}

class PetMedicationsCompanion extends UpdateCompanion<PetMedication> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petId;
  final Value<String> medicineId;
  final Value<String> dosage;
  final Value<String?> route;
  final Value<String?> instructions;
  final Value<String?> prescribedBy;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<bool> asNeeded;
  final Value<String> status;
  final Value<int> rowid;
  const PetMedicationsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.dosage = const Value.absent(),
    this.route = const Value.absent(),
    this.instructions = const Value.absent(),
    this.prescribedBy = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.asNeeded = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PetMedicationsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petId,
    required String medicineId,
    required String dosage,
    this.route = const Value.absent(),
    this.instructions = const Value.absent(),
    this.prescribedBy = const Value.absent(),
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.asNeeded = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       medicineId = Value(medicineId),
       dosage = Value(dosage),
       startDate = Value(startDate);
  static Insertable<PetMedication> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? medicineId,
    Expression<String>? dosage,
    Expression<String>? route,
    Expression<String>? instructions,
    Expression<String>? prescribedBy,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? asNeeded,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (medicineId != null) 'medicine_id': medicineId,
      if (dosage != null) 'dosage': dosage,
      if (route != null) 'route': route,
      if (instructions != null) 'instructions': instructions,
      if (prescribedBy != null) 'prescribed_by': prescribedBy,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (asNeeded != null) 'as_needed': asNeeded,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PetMedicationsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petId,
    Value<String>? medicineId,
    Value<String>? dosage,
    Value<String?>? route,
    Value<String?>? instructions,
    Value<String?>? prescribedBy,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<bool>? asNeeded,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return PetMedicationsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      medicineId: medicineId ?? this.medicineId,
      dosage: dosage ?? this.dosage,
      route: route ?? this.route,
      instructions: instructions ?? this.instructions,
      prescribedBy: prescribedBy ?? this.prescribedBy,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      asNeeded: asNeeded ?? this.asNeeded,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<String>(medicineId.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (instructions.present) {
      map['instructions'] = Variable<String>(instructions.value);
    }
    if (prescribedBy.present) {
      map['prescribed_by'] = Variable<String>(prescribedBy.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (asNeeded.present) {
      map['as_needed'] = Variable<bool>(asNeeded.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetMedicationsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('medicineId: $medicineId, ')
          ..write('dosage: $dosage, ')
          ..write('route: $route, ')
          ..write('instructions: $instructions, ')
          ..write('prescribedBy: $prescribedBy, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('asNeeded: $asNeeded, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationSchedulesTable extends MedicationSchedules
    with TableInfo<$MedicationSchedulesTable, MedicationSchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petMedicationIdMeta = const VerificationMeta(
    'petMedicationId',
  );
  @override
  late final GeneratedColumn<String> petMedicationId = GeneratedColumn<String>(
    'pet_medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localTimeMeta = const VerificationMeta(
    'localTime',
  );
  @override
  late final GeneratedColumn<String> localTime = GeneratedColumn<String>(
    'local_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneIdMeta = const VerificationMeta(
    'timezoneId',
  );
  @override
  late final GeneratedColumn<String> timezoneId = GeneratedColumn<String>(
    'timezone_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recurrenceRuleMeta = const VerificationMeta(
    'recurrenceRule',
  );
  @override
  late final GeneratedColumn<String> recurrenceRule = GeneratedColumn<String>(
    'recurrence_rule',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petMedicationId,
    localTime,
    timezoneId,
    recurrenceRule,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_schedules';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicationSchedule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_medication_id')) {
      context.handle(
        _petMedicationIdMeta,
        petMedicationId.isAcceptableOrUnknown(
          data['pet_medication_id']!,
          _petMedicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_petMedicationIdMeta);
    }
    if (data.containsKey('local_time')) {
      context.handle(
        _localTimeMeta,
        localTime.isAcceptableOrUnknown(data['local_time']!, _localTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_localTimeMeta);
    }
    if (data.containsKey('timezone_id')) {
      context.handle(
        _timezoneIdMeta,
        timezoneId.isAcceptableOrUnknown(data['timezone_id']!, _timezoneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneIdMeta);
    }
    if (data.containsKey('recurrence_rule')) {
      context.handle(
        _recurrenceRuleMeta,
        recurrenceRule.isAcceptableOrUnknown(
          data['recurrence_rule']!,
          _recurrenceRuleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recurrenceRuleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationSchedule(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petMedicationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_medication_id'],
          )!,
      localTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}local_time'],
          )!,
      timezoneId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}timezone_id'],
          )!,
      recurrenceRule:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}recurrence_rule'],
          )!,
    );
  }

  @override
  $MedicationSchedulesTable createAlias(String alias) {
    return $MedicationSchedulesTable(attachedDatabase, alias);
  }
}

class MedicationSchedule extends DataClass
    implements Insertable<MedicationSchedule> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petMedicationId;
  final String localTime;
  final String timezoneId;
  final String recurrenceRule;
  const MedicationSchedule({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petMedicationId,
    required this.localTime,
    required this.timezoneId,
    required this.recurrenceRule,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_medication_id'] = Variable<String>(petMedicationId);
    map['local_time'] = Variable<String>(localTime);
    map['timezone_id'] = Variable<String>(timezoneId);
    map['recurrence_rule'] = Variable<String>(recurrenceRule);
    return map;
  }

  MedicationSchedulesCompanion toCompanion(bool nullToAbsent) {
    return MedicationSchedulesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petMedicationId: Value(petMedicationId),
      localTime: Value(localTime),
      timezoneId: Value(timezoneId),
      recurrenceRule: Value(recurrenceRule),
    );
  }

  factory MedicationSchedule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationSchedule(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petMedicationId: serializer.fromJson<String>(json['petMedicationId']),
      localTime: serializer.fromJson<String>(json['localTime']),
      timezoneId: serializer.fromJson<String>(json['timezoneId']),
      recurrenceRule: serializer.fromJson<String>(json['recurrenceRule']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petMedicationId': serializer.toJson<String>(petMedicationId),
      'localTime': serializer.toJson<String>(localTime),
      'timezoneId': serializer.toJson<String>(timezoneId),
      'recurrenceRule': serializer.toJson<String>(recurrenceRule),
    };
  }

  MedicationSchedule copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petMedicationId,
    String? localTime,
    String? timezoneId,
    String? recurrenceRule,
  }) => MedicationSchedule(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petMedicationId: petMedicationId ?? this.petMedicationId,
    localTime: localTime ?? this.localTime,
    timezoneId: timezoneId ?? this.timezoneId,
    recurrenceRule: recurrenceRule ?? this.recurrenceRule,
  );
  MedicationSchedule copyWithCompanion(MedicationSchedulesCompanion data) {
    return MedicationSchedule(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petMedicationId:
          data.petMedicationId.present
              ? data.petMedicationId.value
              : this.petMedicationId,
      localTime: data.localTime.present ? data.localTime.value : this.localTime,
      timezoneId:
          data.timezoneId.present ? data.timezoneId.value : this.timezoneId,
      recurrenceRule:
          data.recurrenceRule.present
              ? data.recurrenceRule.value
              : this.recurrenceRule,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicationSchedule(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petMedicationId: $petMedicationId, ')
          ..write('localTime: $localTime, ')
          ..write('timezoneId: $timezoneId, ')
          ..write('recurrenceRule: $recurrenceRule')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petMedicationId,
    localTime,
    timezoneId,
    recurrenceRule,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationSchedule &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petMedicationId == this.petMedicationId &&
          other.localTime == this.localTime &&
          other.timezoneId == this.timezoneId &&
          other.recurrenceRule == this.recurrenceRule);
}

class MedicationSchedulesCompanion extends UpdateCompanion<MedicationSchedule> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petMedicationId;
  final Value<String> localTime;
  final Value<String> timezoneId;
  final Value<String> recurrenceRule;
  final Value<int> rowid;
  const MedicationSchedulesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petMedicationId = const Value.absent(),
    this.localTime = const Value.absent(),
    this.timezoneId = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationSchedulesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petMedicationId,
    required String localTime,
    required String timezoneId,
    required String recurrenceRule,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petMedicationId = Value(petMedicationId),
       localTime = Value(localTime),
       timezoneId = Value(timezoneId),
       recurrenceRule = Value(recurrenceRule);
  static Insertable<MedicationSchedule> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petMedicationId,
    Expression<String>? localTime,
    Expression<String>? timezoneId,
    Expression<String>? recurrenceRule,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petMedicationId != null) 'pet_medication_id': petMedicationId,
      if (localTime != null) 'local_time': localTime,
      if (timezoneId != null) 'timezone_id': timezoneId,
      if (recurrenceRule != null) 'recurrence_rule': recurrenceRule,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationSchedulesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petMedicationId,
    Value<String>? localTime,
    Value<String>? timezoneId,
    Value<String>? recurrenceRule,
    Value<int>? rowid,
  }) {
    return MedicationSchedulesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petMedicationId: petMedicationId ?? this.petMedicationId,
      localTime: localTime ?? this.localTime,
      timezoneId: timezoneId ?? this.timezoneId,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petMedicationId.present) {
      map['pet_medication_id'] = Variable<String>(petMedicationId.value);
    }
    if (localTime.present) {
      map['local_time'] = Variable<String>(localTime.value);
    }
    if (timezoneId.present) {
      map['timezone_id'] = Variable<String>(timezoneId.value);
    }
    if (recurrenceRule.present) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationSchedulesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petMedicationId: $petMedicationId, ')
          ..write('localTime: $localTime, ')
          ..write('timezoneId: $timezoneId, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationAdministrationsTable extends MedicationAdministrations
    with TableInfo<$MedicationAdministrationsTable, MedicationAdministration> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationAdministrationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petMedicationIdMeta = const VerificationMeta(
    'petMedicationId',
  );
  @override
  late final GeneratedColumn<String> petMedicationId = GeneratedColumn<String>(
    'pet_medication_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduledForMeta = const VerificationMeta(
    'scheduledFor',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledFor = GeneratedColumn<DateTime>(
    'scheduled_for',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _administeredAtMeta = const VerificationMeta(
    'administeredAt',
  );
  @override
  late final GeneratedColumn<DateTime> administeredAt =
      GeneratedColumn<DateTime>(
        'administered_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petMedicationId,
    scheduledFor,
    administeredAt,
    state,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_administrations';
  @override
  VerificationContext validateIntegrity(
    Insertable<MedicationAdministration> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_medication_id')) {
      context.handle(
        _petMedicationIdMeta,
        petMedicationId.isAcceptableOrUnknown(
          data['pet_medication_id']!,
          _petMedicationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_petMedicationIdMeta);
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
        _scheduledForMeta,
        scheduledFor.isAcceptableOrUnknown(
          data['scheduled_for']!,
          _scheduledForMeta,
        ),
      );
    }
    if (data.containsKey('administered_at')) {
      context.handle(
        _administeredAtMeta,
        administeredAt.isAcceptableOrUnknown(
          data['administered_at']!,
          _administeredAtMeta,
        ),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationAdministration map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationAdministration(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petMedicationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_medication_id'],
          )!,
      scheduledFor: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_for'],
      ),
      administeredAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}administered_at'],
      ),
      state:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}state'],
          )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $MedicationAdministrationsTable createAlias(String alias) {
    return $MedicationAdministrationsTable(attachedDatabase, alias);
  }
}

class MedicationAdministration extends DataClass
    implements Insertable<MedicationAdministration> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petMedicationId;
  final DateTime? scheduledFor;
  final DateTime? administeredAt;
  final String state;
  final String? notes;
  const MedicationAdministration({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petMedicationId,
    this.scheduledFor,
    this.administeredAt,
    required this.state,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_medication_id'] = Variable<String>(petMedicationId);
    if (!nullToAbsent || scheduledFor != null) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor);
    }
    if (!nullToAbsent || administeredAt != null) {
      map['administered_at'] = Variable<DateTime>(administeredAt);
    }
    map['state'] = Variable<String>(state);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  MedicationAdministrationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationAdministrationsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petMedicationId: Value(petMedicationId),
      scheduledFor:
          scheduledFor == null && nullToAbsent
              ? const Value.absent()
              : Value(scheduledFor),
      administeredAt:
          administeredAt == null && nullToAbsent
              ? const Value.absent()
              : Value(administeredAt),
      state: Value(state),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory MedicationAdministration.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationAdministration(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petMedicationId: serializer.fromJson<String>(json['petMedicationId']),
      scheduledFor: serializer.fromJson<DateTime?>(json['scheduledFor']),
      administeredAt: serializer.fromJson<DateTime?>(json['administeredAt']),
      state: serializer.fromJson<String>(json['state']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petMedicationId': serializer.toJson<String>(petMedicationId),
      'scheduledFor': serializer.toJson<DateTime?>(scheduledFor),
      'administeredAt': serializer.toJson<DateTime?>(administeredAt),
      'state': serializer.toJson<String>(state),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  MedicationAdministration copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petMedicationId,
    Value<DateTime?> scheduledFor = const Value.absent(),
    Value<DateTime?> administeredAt = const Value.absent(),
    String? state,
    Value<String?> notes = const Value.absent(),
  }) => MedicationAdministration(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petMedicationId: petMedicationId ?? this.petMedicationId,
    scheduledFor: scheduledFor.present ? scheduledFor.value : this.scheduledFor,
    administeredAt:
        administeredAt.present ? administeredAt.value : this.administeredAt,
    state: state ?? this.state,
    notes: notes.present ? notes.value : this.notes,
  );
  MedicationAdministration copyWithCompanion(
    MedicationAdministrationsCompanion data,
  ) {
    return MedicationAdministration(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petMedicationId:
          data.petMedicationId.present
              ? data.petMedicationId.value
              : this.petMedicationId,
      scheduledFor:
          data.scheduledFor.present
              ? data.scheduledFor.value
              : this.scheduledFor,
      administeredAt:
          data.administeredAt.present
              ? data.administeredAt.value
              : this.administeredAt,
      state: data.state.present ? data.state.value : this.state,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MedicationAdministration(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petMedicationId: $petMedicationId, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('administeredAt: $administeredAt, ')
          ..write('state: $state, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petMedicationId,
    scheduledFor,
    administeredAt,
    state,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationAdministration &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petMedicationId == this.petMedicationId &&
          other.scheduledFor == this.scheduledFor &&
          other.administeredAt == this.administeredAt &&
          other.state == this.state &&
          other.notes == this.notes);
}

class MedicationAdministrationsCompanion
    extends UpdateCompanion<MedicationAdministration> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petMedicationId;
  final Value<DateTime?> scheduledFor;
  final Value<DateTime?> administeredAt;
  final Value<String> state;
  final Value<String?> notes;
  final Value<int> rowid;
  const MedicationAdministrationsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petMedicationId = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.administeredAt = const Value.absent(),
    this.state = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationAdministrationsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petMedicationId,
    this.scheduledFor = const Value.absent(),
    this.administeredAt = const Value.absent(),
    required String state,
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petMedicationId = Value(petMedicationId),
       state = Value(state);
  static Insertable<MedicationAdministration> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petMedicationId,
    Expression<DateTime>? scheduledFor,
    Expression<DateTime>? administeredAt,
    Expression<String>? state,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petMedicationId != null) 'pet_medication_id': petMedicationId,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (administeredAt != null) 'administered_at': administeredAt,
      if (state != null) 'state': state,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationAdministrationsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petMedicationId,
    Value<DateTime?>? scheduledFor,
    Value<DateTime?>? administeredAt,
    Value<String>? state,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return MedicationAdministrationsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petMedicationId: petMedicationId ?? this.petMedicationId,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      administeredAt: administeredAt ?? this.administeredAt,
      state: state ?? this.state,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petMedicationId.present) {
      map['pet_medication_id'] = Variable<String>(petMedicationId.value);
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor.value);
    }
    if (administeredAt.present) {
      map['administered_at'] = Variable<DateTime>(administeredAt.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationAdministrationsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petMedicationId: $petMedicationId, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('administeredAt: $administeredAt, ')
          ..write('state: $state, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppointmentsTable extends Appointments
    with TableInfo<$AppointmentsTable, Appointment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _appointmentTypeMeta = const VerificationMeta(
    'appointmentType',
  );
  @override
  late final GeneratedColumn<String> appointmentType = GeneratedColumn<String>(
    'appointment_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startsAtMeta = const VerificationMeta(
    'startsAt',
  );
  @override
  late final GeneratedColumn<DateTime> startsAt = GeneratedColumn<DateTime>(
    'starts_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneIdMeta = const VerificationMeta(
    'timezoneId',
  );
  @override
  late final GeneratedColumn<String> timezoneId = GeneratedColumn<String>(
    'timezone_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _providerNameMeta = const VerificationMeta(
    'providerName',
  );
  @override
  late final GeneratedColumn<String> providerName = GeneratedColumn<String>(
    'provider_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('scheduled'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    title,
    appointmentType,
    startsAt,
    timezoneId,
    durationMinutes,
    providerName,
    location,
    notes,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Appointment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('appointment_type')) {
      context.handle(
        _appointmentTypeMeta,
        appointmentType.isAcceptableOrUnknown(
          data['appointment_type']!,
          _appointmentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_appointmentTypeMeta);
    }
    if (data.containsKey('starts_at')) {
      context.handle(
        _startsAtMeta,
        startsAt.isAcceptableOrUnknown(data['starts_at']!, _startsAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startsAtMeta);
    }
    if (data.containsKey('timezone_id')) {
      context.handle(
        _timezoneIdMeta,
        timezoneId.isAcceptableOrUnknown(data['timezone_id']!, _timezoneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneIdMeta);
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('provider_name')) {
      context.handle(
        _providerNameMeta,
        providerName.isAcceptableOrUnknown(
          data['provider_name']!,
          _providerNameMeta,
        ),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Appointment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Appointment(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      appointmentType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}appointment_type'],
          )!,
      startsAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}starts_at'],
          )!,
      timezoneId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}timezone_id'],
          )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      providerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_name'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $AppointmentsTable createAlias(String alias) {
    return $AppointmentsTable(attachedDatabase, alias);
  }
}

class Appointment extends DataClass implements Insertable<Appointment> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petId;
  final String title;
  final String appointmentType;
  final DateTime startsAt;
  final String timezoneId;
  final int? durationMinutes;
  final String? providerName;
  final String? location;
  final String? notes;
  final String status;
  const Appointment({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petId,
    required this.title,
    required this.appointmentType,
    required this.startsAt,
    required this.timezoneId,
    this.durationMinutes,
    this.providerName,
    this.location,
    this.notes,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['title'] = Variable<String>(title);
    map['appointment_type'] = Variable<String>(appointmentType);
    map['starts_at'] = Variable<DateTime>(startsAt);
    map['timezone_id'] = Variable<String>(timezoneId);
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || providerName != null) {
      map['provider_name'] = Variable<String>(providerName);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  AppointmentsCompanion toCompanion(bool nullToAbsent) {
    return AppointmentsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId: Value(petId),
      title: Value(title),
      appointmentType: Value(appointmentType),
      startsAt: Value(startsAt),
      timezoneId: Value(timezoneId),
      durationMinutes:
          durationMinutes == null && nullToAbsent
              ? const Value.absent()
              : Value(durationMinutes),
      providerName:
          providerName == null && nullToAbsent
              ? const Value.absent()
              : Value(providerName),
      location:
          location == null && nullToAbsent
              ? const Value.absent()
              : Value(location),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      status: Value(status),
    );
  }

  factory Appointment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Appointment(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      title: serializer.fromJson<String>(json['title']),
      appointmentType: serializer.fromJson<String>(json['appointmentType']),
      startsAt: serializer.fromJson<DateTime>(json['startsAt']),
      timezoneId: serializer.fromJson<String>(json['timezoneId']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      providerName: serializer.fromJson<String?>(json['providerName']),
      location: serializer.fromJson<String?>(json['location']),
      notes: serializer.fromJson<String?>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'title': serializer.toJson<String>(title),
      'appointmentType': serializer.toJson<String>(appointmentType),
      'startsAt': serializer.toJson<DateTime>(startsAt),
      'timezoneId': serializer.toJson<String>(timezoneId),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'providerName': serializer.toJson<String?>(providerName),
      'location': serializer.toJson<String?>(location),
      'notes': serializer.toJson<String?>(notes),
      'status': serializer.toJson<String>(status),
    };
  }

  Appointment copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petId,
    String? title,
    String? appointmentType,
    DateTime? startsAt,
    String? timezoneId,
    Value<int?> durationMinutes = const Value.absent(),
    Value<String?> providerName = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? status,
  }) => Appointment(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId ?? this.petId,
    title: title ?? this.title,
    appointmentType: appointmentType ?? this.appointmentType,
    startsAt: startsAt ?? this.startsAt,
    timezoneId: timezoneId ?? this.timezoneId,
    durationMinutes:
        durationMinutes.present ? durationMinutes.value : this.durationMinutes,
    providerName: providerName.present ? providerName.value : this.providerName,
    location: location.present ? location.value : this.location,
    notes: notes.present ? notes.value : this.notes,
    status: status ?? this.status,
  );
  Appointment copyWithCompanion(AppointmentsCompanion data) {
    return Appointment(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      title: data.title.present ? data.title.value : this.title,
      appointmentType:
          data.appointmentType.present
              ? data.appointmentType.value
              : this.appointmentType,
      startsAt: data.startsAt.present ? data.startsAt.value : this.startsAt,
      timezoneId:
          data.timezoneId.present ? data.timezoneId.value : this.timezoneId,
      durationMinutes:
          data.durationMinutes.present
              ? data.durationMinutes.value
              : this.durationMinutes,
      providerName:
          data.providerName.present
              ? data.providerName.value
              : this.providerName,
      location: data.location.present ? data.location.value : this.location,
      notes: data.notes.present ? data.notes.value : this.notes,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Appointment(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('appointmentType: $appointmentType, ')
          ..write('startsAt: $startsAt, ')
          ..write('timezoneId: $timezoneId, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('providerName: $providerName, ')
          ..write('location: $location, ')
          ..write('notes: $notes, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    title,
    appointmentType,
    startsAt,
    timezoneId,
    durationMinutes,
    providerName,
    location,
    notes,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Appointment &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.title == this.title &&
          other.appointmentType == this.appointmentType &&
          other.startsAt == this.startsAt &&
          other.timezoneId == this.timezoneId &&
          other.durationMinutes == this.durationMinutes &&
          other.providerName == this.providerName &&
          other.location == this.location &&
          other.notes == this.notes &&
          other.status == this.status);
}

class AppointmentsCompanion extends UpdateCompanion<Appointment> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petId;
  final Value<String> title;
  final Value<String> appointmentType;
  final Value<DateTime> startsAt;
  final Value<String> timezoneId;
  final Value<int?> durationMinutes;
  final Value<String?> providerName;
  final Value<String?> location;
  final Value<String?> notes;
  final Value<String> status;
  final Value<int> rowid;
  const AppointmentsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.title = const Value.absent(),
    this.appointmentType = const Value.absent(),
    this.startsAt = const Value.absent(),
    this.timezoneId = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.providerName = const Value.absent(),
    this.location = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppointmentsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petId,
    required String title,
    required String appointmentType,
    required DateTime startsAt,
    required String timezoneId,
    this.durationMinutes = const Value.absent(),
    this.providerName = const Value.absent(),
    this.location = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       title = Value(title),
       appointmentType = Value(appointmentType),
       startsAt = Value(startsAt),
       timezoneId = Value(timezoneId);
  static Insertable<Appointment> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? title,
    Expression<String>? appointmentType,
    Expression<DateTime>? startsAt,
    Expression<String>? timezoneId,
    Expression<int>? durationMinutes,
    Expression<String>? providerName,
    Expression<String>? location,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (title != null) 'title': title,
      if (appointmentType != null) 'appointment_type': appointmentType,
      if (startsAt != null) 'starts_at': startsAt,
      if (timezoneId != null) 'timezone_id': timezoneId,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (providerName != null) 'provider_name': providerName,
      if (location != null) 'location': location,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppointmentsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petId,
    Value<String>? title,
    Value<String>? appointmentType,
    Value<DateTime>? startsAt,
    Value<String>? timezoneId,
    Value<int?>? durationMinutes,
    Value<String?>? providerName,
    Value<String?>? location,
    Value<String?>? notes,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return AppointmentsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      title: title ?? this.title,
      appointmentType: appointmentType ?? this.appointmentType,
      startsAt: startsAt ?? this.startsAt,
      timezoneId: timezoneId ?? this.timezoneId,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      providerName: providerName ?? this.providerName,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (appointmentType.present) {
      map['appointment_type'] = Variable<String>(appointmentType.value);
    }
    if (startsAt.present) {
      map['starts_at'] = Variable<DateTime>(startsAt.value);
    }
    if (timezoneId.present) {
      map['timezone_id'] = Variable<String>(timezoneId.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (providerName.present) {
      map['provider_name'] = Variable<String>(providerName.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('appointmentType: $appointmentType, ')
          ..write('startsAt: $startsAt, ')
          ..write('timezoneId: $timezoneId, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('providerName: $providerName, ')
          ..write('location: $location, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileIdMeta = const VerificationMeta('fileId');
  @override
  late final GeneratedColumn<String> fileId = GeneratedColumn<String>(
    'file_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _documentTypeMeta = const VerificationMeta(
    'documentType',
  );
  @override
  late final GeneratedColumn<String> documentType = GeneratedColumn<String>(
    'document_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _issuedOnMeta = const VerificationMeta(
    'issuedOn',
  );
  @override
  late final GeneratedColumn<DateTime> issuedOn = GeneratedColumn<DateTime>(
    'issued_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _expiresOnMeta = const VerificationMeta(
    'expiresOn',
  );
  @override
  late final GeneratedColumn<DateTime> expiresOn = GeneratedColumn<DateTime>(
    'expires_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    fileId,
    title,
    documentType,
    issuedOn,
    expiresOn,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<Document> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    }
    if (data.containsKey('file_id')) {
      context.handle(
        _fileIdMeta,
        fileId.isAcceptableOrUnknown(data['file_id']!, _fileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_fileIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('document_type')) {
      context.handle(
        _documentTypeMeta,
        documentType.isAcceptableOrUnknown(
          data['document_type']!,
          _documentTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_documentTypeMeta);
    }
    if (data.containsKey('issued_on')) {
      context.handle(
        _issuedOnMeta,
        issuedOn.isAcceptableOrUnknown(data['issued_on']!, _issuedOnMeta),
      );
    }
    if (data.containsKey('expires_on')) {
      context.handle(
        _expiresOnMeta,
        expiresOn.isAcceptableOrUnknown(data['expires_on']!, _expiresOnMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Document(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      ),
      fileId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}file_id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      documentType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}document_type'],
          )!,
      issuedOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}issued_on'],
      ),
      expiresOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_on'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String? petId;
  final String fileId;
  final String title;
  final String documentType;
  final DateTime? issuedOn;
  final DateTime? expiresOn;
  final String? notes;
  const Document({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.petId,
    required this.fileId,
    required this.title,
    required this.documentType,
    this.issuedOn,
    this.expiresOn,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<String>(petId);
    }
    map['file_id'] = Variable<String>(fileId);
    map['title'] = Variable<String>(title);
    map['document_type'] = Variable<String>(documentType);
    if (!nullToAbsent || issuedOn != null) {
      map['issued_on'] = Variable<DateTime>(issuedOn);
    }
    if (!nullToAbsent || expiresOn != null) {
      map['expires_on'] = Variable<DateTime>(expiresOn);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      fileId: Value(fileId),
      title: Value(title),
      documentType: Value(documentType),
      issuedOn:
          issuedOn == null && nullToAbsent
              ? const Value.absent()
              : Value(issuedOn),
      expiresOn:
          expiresOn == null && nullToAbsent
              ? const Value.absent()
              : Value(expiresOn),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Document.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String?>(json['petId']),
      fileId: serializer.fromJson<String>(json['fileId']),
      title: serializer.fromJson<String>(json['title']),
      documentType: serializer.fromJson<String>(json['documentType']),
      issuedOn: serializer.fromJson<DateTime?>(json['issuedOn']),
      expiresOn: serializer.fromJson<DateTime?>(json['expiresOn']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String?>(petId),
      'fileId': serializer.toJson<String>(fileId),
      'title': serializer.toJson<String>(title),
      'documentType': serializer.toJson<String>(documentType),
      'issuedOn': serializer.toJson<DateTime?>(issuedOn),
      'expiresOn': serializer.toJson<DateTime?>(expiresOn),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Document copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    Value<String?> petId = const Value.absent(),
    String? fileId,
    String? title,
    String? documentType,
    Value<DateTime?> issuedOn = const Value.absent(),
    Value<DateTime?> expiresOn = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Document(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId.present ? petId.value : this.petId,
    fileId: fileId ?? this.fileId,
    title: title ?? this.title,
    documentType: documentType ?? this.documentType,
    issuedOn: issuedOn.present ? issuedOn.value : this.issuedOn,
    expiresOn: expiresOn.present ? expiresOn.value : this.expiresOn,
    notes: notes.present ? notes.value : this.notes,
  );
  Document copyWithCompanion(DocumentsCompanion data) {
    return Document(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      fileId: data.fileId.present ? data.fileId.value : this.fileId,
      title: data.title.present ? data.title.value : this.title,
      documentType:
          data.documentType.present
              ? data.documentType.value
              : this.documentType,
      issuedOn: data.issuedOn.present ? data.issuedOn.value : this.issuedOn,
      expiresOn: data.expiresOn.present ? data.expiresOn.value : this.expiresOn,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('fileId: $fileId, ')
          ..write('title: $title, ')
          ..write('documentType: $documentType, ')
          ..write('issuedOn: $issuedOn, ')
          ..write('expiresOn: $expiresOn, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    fileId,
    title,
    documentType,
    issuedOn,
    expiresOn,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.fileId == this.fileId &&
          other.title == this.title &&
          other.documentType == this.documentType &&
          other.issuedOn == this.issuedOn &&
          other.expiresOn == this.expiresOn &&
          other.notes == this.notes);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String?> petId;
  final Value<String> fileId;
  final Value<String> title;
  final Value<String> documentType;
  final Value<DateTime?> issuedOn;
  final Value<DateTime?> expiresOn;
  final Value<String?> notes;
  final Value<int> rowid;
  const DocumentsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.fileId = const Value.absent(),
    this.title = const Value.absent(),
    this.documentType = const Value.absent(),
    this.issuedOn = const Value.absent(),
    this.expiresOn = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    this.petId = const Value.absent(),
    required String fileId,
    required String title,
    required String documentType,
    this.issuedOn = const Value.absent(),
    this.expiresOn = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fileId = Value(fileId),
       title = Value(title),
       documentType = Value(documentType);
  static Insertable<Document> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? fileId,
    Expression<String>? title,
    Expression<String>? documentType,
    Expression<DateTime>? issuedOn,
    Expression<DateTime>? expiresOn,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (fileId != null) 'file_id': fileId,
      if (title != null) 'title': title,
      if (documentType != null) 'document_type': documentType,
      if (issuedOn != null) 'issued_on': issuedOn,
      if (expiresOn != null) 'expires_on': expiresOn,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DocumentsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String?>? petId,
    Value<String>? fileId,
    Value<String>? title,
    Value<String>? documentType,
    Value<DateTime?>? issuedOn,
    Value<DateTime?>? expiresOn,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return DocumentsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      fileId: fileId ?? this.fileId,
      title: title ?? this.title,
      documentType: documentType ?? this.documentType,
      issuedOn: issuedOn ?? this.issuedOn,
      expiresOn: expiresOn ?? this.expiresOn,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (fileId.present) {
      map['file_id'] = Variable<String>(fileId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (documentType.present) {
      map['document_type'] = Variable<String>(documentType.value);
    }
    if (issuedOn.present) {
      map['issued_on'] = Variable<DateTime>(issuedOn.value);
    }
    if (expiresOn.present) {
      map['expires_on'] = Variable<DateTime>(expiresOn.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('fileId: $fileId, ')
          ..write('title: $title, ')
          ..write('documentType: $documentType, ')
          ..write('issuedOn: $issuedOn, ')
          ..write('expiresOn: $expiresOn, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecordAttachmentsTable extends RecordAttachments
    with TableInfo<$RecordAttachmentsTable, RecordAttachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordAttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileIdMeta = const VerificationMeta('fileId');
  @override
  late final GeneratedColumn<String> fileId = GeneratedColumn<String>(
    'file_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _captionMeta = const VerificationMeta(
    'caption',
  );
  @override
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
    'caption',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    fileId,
    entityType,
    entityId,
    caption,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'record_attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecordAttachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('file_id')) {
      context.handle(
        _fileIdMeta,
        fileId.isAcceptableOrUnknown(data['file_id']!, _fileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_fileIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('caption')) {
      context.handle(
        _captionMeta,
        caption.isAcceptableOrUnknown(data['caption']!, _captionMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordAttachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordAttachment(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      fileId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}file_id'],
          )!,
      entityType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}entity_type'],
          )!,
      entityId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}entity_id'],
          )!,
      caption: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caption'],
      ),
    );
  }

  @override
  $RecordAttachmentsTable createAlias(String alias) {
    return $RecordAttachmentsTable(attachedDatabase, alias);
  }
}

class RecordAttachment extends DataClass
    implements Insertable<RecordAttachment> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String fileId;
  final String entityType;
  final String entityId;
  final String? caption;
  const RecordAttachment({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.fileId,
    required this.entityType,
    required this.entityId,
    this.caption,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['file_id'] = Variable<String>(fileId);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    if (!nullToAbsent || caption != null) {
      map['caption'] = Variable<String>(caption);
    }
    return map;
  }

  RecordAttachmentsCompanion toCompanion(bool nullToAbsent) {
    return RecordAttachmentsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      fileId: Value(fileId),
      entityType: Value(entityType),
      entityId: Value(entityId),
      caption:
          caption == null && nullToAbsent
              ? const Value.absent()
              : Value(caption),
    );
  }

  factory RecordAttachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordAttachment(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      fileId: serializer.fromJson<String>(json['fileId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      caption: serializer.fromJson<String?>(json['caption']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'fileId': serializer.toJson<String>(fileId),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'caption': serializer.toJson<String?>(caption),
    };
  }

  RecordAttachment copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? fileId,
    String? entityType,
    String? entityId,
    Value<String?> caption = const Value.absent(),
  }) => RecordAttachment(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    fileId: fileId ?? this.fileId,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    caption: caption.present ? caption.value : this.caption,
  );
  RecordAttachment copyWithCompanion(RecordAttachmentsCompanion data) {
    return RecordAttachment(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      fileId: data.fileId.present ? data.fileId.value : this.fileId,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      caption: data.caption.present ? data.caption.value : this.caption,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecordAttachment(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('fileId: $fileId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('caption: $caption')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    fileId,
    entityType,
    entityId,
    caption,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordAttachment &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.fileId == this.fileId &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.caption == this.caption);
}

class RecordAttachmentsCompanion extends UpdateCompanion<RecordAttachment> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> fileId;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String?> caption;
  final Value<int> rowid;
  const RecordAttachmentsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.fileId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.caption = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordAttachmentsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String fileId,
    required String entityType,
    required String entityId,
    this.caption = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fileId = Value(fileId),
       entityType = Value(entityType),
       entityId = Value(entityId);
  static Insertable<RecordAttachment> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? fileId,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? caption,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (fileId != null) 'file_id': fileId,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (caption != null) 'caption': caption,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordAttachmentsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? fileId,
    Value<String>? entityType,
    Value<String>? entityId,
    Value<String?>? caption,
    Value<int>? rowid,
  }) {
    return RecordAttachmentsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      fileId: fileId ?? this.fileId,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      caption: caption ?? this.caption,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fileId.present) {
      map['file_id'] = Variable<String>(fileId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordAttachmentsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('fileId: $fileId, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('caption: $caption, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GrowthEntriesTable extends GrowthEntries
    with TableInfo<$GrowthEntriesTable, GrowthEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GrowthEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _measuredAtMeta = const VerificationMeta(
    'measuredAt',
  );
  @override
  late final GeneratedColumn<DateTime> measuredAt = GeneratedColumn<DateTime>(
    'measured_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightGramsMeta = const VerificationMeta(
    'weightGrams',
  );
  @override
  late final GeneratedColumn<int> weightGrams = GeneratedColumn<int>(
    'weight_grams',
    aliasedName,
    false,
    check: () => ComparableExpr(weightGrams).isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyConditionScoreMeta =
      const VerificationMeta('bodyConditionScore');
  @override
  late final GeneratedColumn<double> bodyConditionScore =
      GeneratedColumn<double>(
        'body_condition_score',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    measuredAt,
    weightGrams,
    bodyConditionScore,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'growth_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<GrowthEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('measured_at')) {
      context.handle(
        _measuredAtMeta,
        measuredAt.isAcceptableOrUnknown(data['measured_at']!, _measuredAtMeta),
      );
    } else if (isInserting) {
      context.missing(_measuredAtMeta);
    }
    if (data.containsKey('weight_grams')) {
      context.handle(
        _weightGramsMeta,
        weightGrams.isAcceptableOrUnknown(
          data['weight_grams']!,
          _weightGramsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weightGramsMeta);
    }
    if (data.containsKey('body_condition_score')) {
      context.handle(
        _bodyConditionScoreMeta,
        bodyConditionScore.isAcceptableOrUnknown(
          data['body_condition_score']!,
          _bodyConditionScoreMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GrowthEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GrowthEntry(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_id'],
          )!,
      measuredAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}measured_at'],
          )!,
      weightGrams:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}weight_grams'],
          )!,
      bodyConditionScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}body_condition_score'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $GrowthEntriesTable createAlias(String alias) {
    return $GrowthEntriesTable(attachedDatabase, alias);
  }
}

class GrowthEntry extends DataClass implements Insertable<GrowthEntry> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petId;
  final DateTime measuredAt;
  final int weightGrams;
  final double? bodyConditionScore;
  final String? notes;
  const GrowthEntry({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petId,
    required this.measuredAt,
    required this.weightGrams,
    this.bodyConditionScore,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['measured_at'] = Variable<DateTime>(measuredAt);
    map['weight_grams'] = Variable<int>(weightGrams);
    if (!nullToAbsent || bodyConditionScore != null) {
      map['body_condition_score'] = Variable<double>(bodyConditionScore);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  GrowthEntriesCompanion toCompanion(bool nullToAbsent) {
    return GrowthEntriesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId: Value(petId),
      measuredAt: Value(measuredAt),
      weightGrams: Value(weightGrams),
      bodyConditionScore:
          bodyConditionScore == null && nullToAbsent
              ? const Value.absent()
              : Value(bodyConditionScore),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory GrowthEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GrowthEntry(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      measuredAt: serializer.fromJson<DateTime>(json['measuredAt']),
      weightGrams: serializer.fromJson<int>(json['weightGrams']),
      bodyConditionScore: serializer.fromJson<double?>(
        json['bodyConditionScore'],
      ),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'measuredAt': serializer.toJson<DateTime>(measuredAt),
      'weightGrams': serializer.toJson<int>(weightGrams),
      'bodyConditionScore': serializer.toJson<double?>(bodyConditionScore),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  GrowthEntry copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petId,
    DateTime? measuredAt,
    int? weightGrams,
    Value<double?> bodyConditionScore = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => GrowthEntry(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId ?? this.petId,
    measuredAt: measuredAt ?? this.measuredAt,
    weightGrams: weightGrams ?? this.weightGrams,
    bodyConditionScore:
        bodyConditionScore.present
            ? bodyConditionScore.value
            : this.bodyConditionScore,
    notes: notes.present ? notes.value : this.notes,
  );
  GrowthEntry copyWithCompanion(GrowthEntriesCompanion data) {
    return GrowthEntry(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      measuredAt:
          data.measuredAt.present ? data.measuredAt.value : this.measuredAt,
      weightGrams:
          data.weightGrams.present ? data.weightGrams.value : this.weightGrams,
      bodyConditionScore:
          data.bodyConditionScore.present
              ? data.bodyConditionScore.value
              : this.bodyConditionScore,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GrowthEntry(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('weightGrams: $weightGrams, ')
          ..write('bodyConditionScore: $bodyConditionScore, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    measuredAt,
    weightGrams,
    bodyConditionScore,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GrowthEntry &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.measuredAt == this.measuredAt &&
          other.weightGrams == this.weightGrams &&
          other.bodyConditionScore == this.bodyConditionScore &&
          other.notes == this.notes);
}

class GrowthEntriesCompanion extends UpdateCompanion<GrowthEntry> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petId;
  final Value<DateTime> measuredAt;
  final Value<int> weightGrams;
  final Value<double?> bodyConditionScore;
  final Value<String?> notes;
  final Value<int> rowid;
  const GrowthEntriesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.measuredAt = const Value.absent(),
    this.weightGrams = const Value.absent(),
    this.bodyConditionScore = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GrowthEntriesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petId,
    required DateTime measuredAt,
    required int weightGrams,
    this.bodyConditionScore = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       measuredAt = Value(measuredAt),
       weightGrams = Value(weightGrams);
  static Insertable<GrowthEntry> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<DateTime>? measuredAt,
    Expression<int>? weightGrams,
    Expression<double>? bodyConditionScore,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (measuredAt != null) 'measured_at': measuredAt,
      if (weightGrams != null) 'weight_grams': weightGrams,
      if (bodyConditionScore != null)
        'body_condition_score': bodyConditionScore,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GrowthEntriesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petId,
    Value<DateTime>? measuredAt,
    Value<int>? weightGrams,
    Value<double?>? bodyConditionScore,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return GrowthEntriesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      measuredAt: measuredAt ?? this.measuredAt,
      weightGrams: weightGrams ?? this.weightGrams,
      bodyConditionScore: bodyConditionScore ?? this.bodyConditionScore,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (measuredAt.present) {
      map['measured_at'] = Variable<DateTime>(measuredAt.value);
    }
    if (weightGrams.present) {
      map['weight_grams'] = Variable<int>(weightGrams.value);
    }
    if (bodyConditionScore.present) {
      map['body_condition_score'] = Variable<double>(bodyConditionScore.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GrowthEntriesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('measuredAt: $measuredAt, ')
          ..write('weightGrams: $weightGrams, ')
          ..write('bodyConditionScore: $bodyConditionScore, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMinorMeta = const VerificationMeta(
    'amountMinor',
  );
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
    'amount_minor',
    aliasedName,
    false,
    check: () => ComparableExpr(amountMinor).isBiggerOrEqualValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _occurredOnMeta = const VerificationMeta(
    'occurredOn',
  );
  @override
  late final GeneratedColumn<DateTime> occurredOn = GeneratedColumn<DateTime>(
    'occurred_on',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _merchantMeta = const VerificationMeta(
    'merchant',
  );
  @override
  late final GeneratedColumn<String> merchant = GeneratedColumn<String>(
    'merchant',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receiptFileIdMeta = const VerificationMeta(
    'receiptFileId',
  );
  @override
  late final GeneratedColumn<String> receiptFileId = GeneratedColumn<String>(
    'receipt_file_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    category,
    amountMinor,
    currencyCode,
    occurredOn,
    merchant,
    paymentMethod,
    receiptFileId,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Expense> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
        _amountMinorMeta,
        amountMinor.isAcceptableOrUnknown(
          data['amount_minor']!,
          _amountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('occurred_on')) {
      context.handle(
        _occurredOnMeta,
        occurredOn.isAcceptableOrUnknown(data['occurred_on']!, _occurredOnMeta),
      );
    } else if (isInserting) {
      context.missing(_occurredOnMeta);
    }
    if (data.containsKey('merchant')) {
      context.handle(
        _merchantMeta,
        merchant.isAcceptableOrUnknown(data['merchant']!, _merchantMeta),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('receipt_file_id')) {
      context.handle(
        _receiptFileIdMeta,
        receiptFileId.isAcceptableOrUnknown(
          data['receipt_file_id']!,
          _receiptFileIdMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      ),
      category:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}category'],
          )!,
      amountMinor:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}amount_minor'],
          )!,
      currencyCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}currency_code'],
          )!,
      occurredOn:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}occurred_on'],
          )!,
      merchant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merchant'],
      ),
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      ),
      receiptFileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_file_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String? petId;
  final String category;
  final int amountMinor;
  final String currencyCode;
  final DateTime occurredOn;
  final String? merchant;
  final String? paymentMethod;
  final String? receiptFileId;
  final String? notes;
  const Expense({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.petId,
    required this.category,
    required this.amountMinor,
    required this.currencyCode,
    required this.occurredOn,
    this.merchant,
    this.paymentMethod,
    this.receiptFileId,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<String>(petId);
    }
    map['category'] = Variable<String>(category);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['currency_code'] = Variable<String>(currencyCode);
    map['occurred_on'] = Variable<DateTime>(occurredOn);
    if (!nullToAbsent || merchant != null) {
      map['merchant'] = Variable<String>(merchant);
    }
    if (!nullToAbsent || paymentMethod != null) {
      map['payment_method'] = Variable<String>(paymentMethod);
    }
    if (!nullToAbsent || receiptFileId != null) {
      map['receipt_file_id'] = Variable<String>(receiptFileId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      category: Value(category),
      amountMinor: Value(amountMinor),
      currencyCode: Value(currencyCode),
      occurredOn: Value(occurredOn),
      merchant:
          merchant == null && nullToAbsent
              ? const Value.absent()
              : Value(merchant),
      paymentMethod:
          paymentMethod == null && nullToAbsent
              ? const Value.absent()
              : Value(paymentMethod),
      receiptFileId:
          receiptFileId == null && nullToAbsent
              ? const Value.absent()
              : Value(receiptFileId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Expense.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String?>(json['petId']),
      category: serializer.fromJson<String>(json['category']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      occurredOn: serializer.fromJson<DateTime>(json['occurredOn']),
      merchant: serializer.fromJson<String?>(json['merchant']),
      paymentMethod: serializer.fromJson<String?>(json['paymentMethod']),
      receiptFileId: serializer.fromJson<String?>(json['receiptFileId']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String?>(petId),
      'category': serializer.toJson<String>(category),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'occurredOn': serializer.toJson<DateTime>(occurredOn),
      'merchant': serializer.toJson<String?>(merchant),
      'paymentMethod': serializer.toJson<String?>(paymentMethod),
      'receiptFileId': serializer.toJson<String?>(receiptFileId),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Expense copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    Value<String?> petId = const Value.absent(),
    String? category,
    int? amountMinor,
    String? currencyCode,
    DateTime? occurredOn,
    Value<String?> merchant = const Value.absent(),
    Value<String?> paymentMethod = const Value.absent(),
    Value<String?> receiptFileId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Expense(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId.present ? petId.value : this.petId,
    category: category ?? this.category,
    amountMinor: amountMinor ?? this.amountMinor,
    currencyCode: currencyCode ?? this.currencyCode,
    occurredOn: occurredOn ?? this.occurredOn,
    merchant: merchant.present ? merchant.value : this.merchant,
    paymentMethod:
        paymentMethod.present ? paymentMethod.value : this.paymentMethod,
    receiptFileId:
        receiptFileId.present ? receiptFileId.value : this.receiptFileId,
    notes: notes.present ? notes.value : this.notes,
  );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      category: data.category.present ? data.category.value : this.category,
      amountMinor:
          data.amountMinor.present ? data.amountMinor.value : this.amountMinor,
      currencyCode:
          data.currencyCode.present
              ? data.currencyCode.value
              : this.currencyCode,
      occurredOn:
          data.occurredOn.present ? data.occurredOn.value : this.occurredOn,
      merchant: data.merchant.present ? data.merchant.value : this.merchant,
      paymentMethod:
          data.paymentMethod.present
              ? data.paymentMethod.value
              : this.paymentMethod,
      receiptFileId:
          data.receiptFileId.present
              ? data.receiptFileId.value
              : this.receiptFileId,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurredOn: $occurredOn, ')
          ..write('merchant: $merchant, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('receiptFileId: $receiptFileId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    category,
    amountMinor,
    currencyCode,
    occurredOn,
    merchant,
    paymentMethod,
    receiptFileId,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.category == this.category &&
          other.amountMinor == this.amountMinor &&
          other.currencyCode == this.currencyCode &&
          other.occurredOn == this.occurredOn &&
          other.merchant == this.merchant &&
          other.paymentMethod == this.paymentMethod &&
          other.receiptFileId == this.receiptFileId &&
          other.notes == this.notes);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String?> petId;
  final Value<String> category;
  final Value<int> amountMinor;
  final Value<String> currencyCode;
  final Value<DateTime> occurredOn;
  final Value<String?> merchant;
  final Value<String?> paymentMethod;
  final Value<String?> receiptFileId;
  final Value<String?> notes;
  final Value<int> rowid;
  const ExpensesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.category = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.occurredOn = const Value.absent(),
    this.merchant = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.receiptFileId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    this.petId = const Value.absent(),
    required String category,
    required int amountMinor,
    required String currencyCode,
    required DateTime occurredOn,
    this.merchant = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.receiptFileId = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       category = Value(category),
       amountMinor = Value(amountMinor),
       currencyCode = Value(currencyCode),
       occurredOn = Value(occurredOn);
  static Insertable<Expense> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? category,
    Expression<int>? amountMinor,
    Expression<String>? currencyCode,
    Expression<DateTime>? occurredOn,
    Expression<String>? merchant,
    Expression<String>? paymentMethod,
    Expression<String>? receiptFileId,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (category != null) 'category': category,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (occurredOn != null) 'occurred_on': occurredOn,
      if (merchant != null) 'merchant': merchant,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (receiptFileId != null) 'receipt_file_id': receiptFileId,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpensesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String?>? petId,
    Value<String>? category,
    Value<int>? amountMinor,
    Value<String>? currencyCode,
    Value<DateTime>? occurredOn,
    Value<String?>? merchant,
    Value<String?>? paymentMethod,
    Value<String?>? receiptFileId,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ExpensesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      category: category ?? this.category,
      amountMinor: amountMinor ?? this.amountMinor,
      currencyCode: currencyCode ?? this.currencyCode,
      occurredOn: occurredOn ?? this.occurredOn,
      merchant: merchant ?? this.merchant,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      receiptFileId: receiptFileId ?? this.receiptFileId,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (occurredOn.present) {
      map['occurred_on'] = Variable<DateTime>(occurredOn.value);
    }
    if (merchant.present) {
      map['merchant'] = Variable<String>(merchant.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (receiptFileId.present) {
      map['receipt_file_id'] = Variable<String>(receiptFileId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('category: $category, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('occurredOn: $occurredOn, ')
          ..write('merchant: $merchant, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('receiptFileId: $receiptFileId, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startsAtMeta = const VerificationMeta(
    'startsAt',
  );
  @override
  late final GeneratedColumn<DateTime> startsAt = GeneratedColumn<DateTime>(
    'starts_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timezoneIdMeta = const VerificationMeta(
    'timezoneId',
  );
  @override
  late final GeneratedColumn<String> timezoneId = GeneratedColumn<String>(
    'timezone_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recurrenceRuleMeta = const VerificationMeta(
    'recurrenceRule',
  );
  @override
  late final GeneratedColumn<String> recurrenceRule = GeneratedColumn<String>(
    'recurrence_rule',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceEntityTypeMeta = const VerificationMeta(
    'sourceEntityType',
  );
  @override
  late final GeneratedColumn<String> sourceEntityType = GeneratedColumn<String>(
    'source_entity_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceEntityIdMeta = const VerificationMeta(
    'sourceEntityId',
  );
  @override
  late final GeneratedColumn<String> sourceEntityId = GeneratedColumn<String>(
    'source_entity_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _notificationLeadMinutesMeta =
      const VerificationMeta('notificationLeadMinutes');
  @override
  late final GeneratedColumn<int> notificationLeadMinutes =
      GeneratedColumn<int>(
        'notification_lead_minutes',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _endsAtMeta = const VerificationMeta('endsAt');
  @override
  late final GeneratedColumn<DateTime> endsAt = GeneratedColumn<DateTime>(
    'ends_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    kind,
    title,
    body,
    startsAt,
    timezoneId,
    recurrenceRule,
    sourceEntityType,
    sourceEntityId,
    enabled,
    notificationLeadMinutes,
    endsAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    }
    if (data.containsKey('starts_at')) {
      context.handle(
        _startsAtMeta,
        startsAt.isAcceptableOrUnknown(data['starts_at']!, _startsAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startsAtMeta);
    }
    if (data.containsKey('timezone_id')) {
      context.handle(
        _timezoneIdMeta,
        timezoneId.isAcceptableOrUnknown(data['timezone_id']!, _timezoneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_timezoneIdMeta);
    }
    if (data.containsKey('recurrence_rule')) {
      context.handle(
        _recurrenceRuleMeta,
        recurrenceRule.isAcceptableOrUnknown(
          data['recurrence_rule']!,
          _recurrenceRuleMeta,
        ),
      );
    }
    if (data.containsKey('source_entity_type')) {
      context.handle(
        _sourceEntityTypeMeta,
        sourceEntityType.isAcceptableOrUnknown(
          data['source_entity_type']!,
          _sourceEntityTypeMeta,
        ),
      );
    }
    if (data.containsKey('source_entity_id')) {
      context.handle(
        _sourceEntityIdMeta,
        sourceEntityId.isAcceptableOrUnknown(
          data['source_entity_id']!,
          _sourceEntityIdMeta,
        ),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('notification_lead_minutes')) {
      context.handle(
        _notificationLeadMinutesMeta,
        notificationLeadMinutes.isAcceptableOrUnknown(
          data['notification_lead_minutes']!,
          _notificationLeadMinutesMeta,
        ),
      );
    }
    if (data.containsKey('ends_at')) {
      context.handle(
        _endsAtMeta,
        endsAt.isAcceptableOrUnknown(data['ends_at']!, _endsAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      ),
      kind:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}kind'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      ),
      startsAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}starts_at'],
          )!,
      timezoneId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}timezone_id'],
          )!,
      recurrenceRule: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurrence_rule'],
      ),
      sourceEntityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_entity_type'],
      ),
      sourceEntityId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_entity_id'],
      ),
      enabled:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}enabled'],
          )!,
      notificationLeadMinutes:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}notification_lead_minutes'],
          )!,
      endsAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ends_at'],
      ),
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String? petId;
  final String kind;
  final String title;
  final String? body;
  final DateTime startsAt;
  final String timezoneId;
  final String? recurrenceRule;
  final String? sourceEntityType;
  final String? sourceEntityId;
  final bool enabled;
  final int notificationLeadMinutes;
  final DateTime? endsAt;
  const Reminder({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.petId,
    required this.kind,
    required this.title,
    this.body,
    required this.startsAt,
    required this.timezoneId,
    this.recurrenceRule,
    this.sourceEntityType,
    this.sourceEntityId,
    required this.enabled,
    required this.notificationLeadMinutes,
    this.endsAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<String>(petId);
    }
    map['kind'] = Variable<String>(kind);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    map['starts_at'] = Variable<DateTime>(startsAt);
    map['timezone_id'] = Variable<String>(timezoneId);
    if (!nullToAbsent || recurrenceRule != null) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule);
    }
    if (!nullToAbsent || sourceEntityType != null) {
      map['source_entity_type'] = Variable<String>(sourceEntityType);
    }
    if (!nullToAbsent || sourceEntityId != null) {
      map['source_entity_id'] = Variable<String>(sourceEntityId);
    }
    map['enabled'] = Variable<bool>(enabled);
    map['notification_lead_minutes'] = Variable<int>(notificationLeadMinutes);
    if (!nullToAbsent || endsAt != null) {
      map['ends_at'] = Variable<DateTime>(endsAt);
    }
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      kind: Value(kind),
      title: Value(title),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      startsAt: Value(startsAt),
      timezoneId: Value(timezoneId),
      recurrenceRule:
          recurrenceRule == null && nullToAbsent
              ? const Value.absent()
              : Value(recurrenceRule),
      sourceEntityType:
          sourceEntityType == null && nullToAbsent
              ? const Value.absent()
              : Value(sourceEntityType),
      sourceEntityId:
          sourceEntityId == null && nullToAbsent
              ? const Value.absent()
              : Value(sourceEntityId),
      enabled: Value(enabled),
      notificationLeadMinutes: Value(notificationLeadMinutes),
      endsAt:
          endsAt == null && nullToAbsent ? const Value.absent() : Value(endsAt),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String?>(json['petId']),
      kind: serializer.fromJson<String>(json['kind']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String?>(json['body']),
      startsAt: serializer.fromJson<DateTime>(json['startsAt']),
      timezoneId: serializer.fromJson<String>(json['timezoneId']),
      recurrenceRule: serializer.fromJson<String?>(json['recurrenceRule']),
      sourceEntityType: serializer.fromJson<String?>(json['sourceEntityType']),
      sourceEntityId: serializer.fromJson<String?>(json['sourceEntityId']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      notificationLeadMinutes: serializer.fromJson<int>(
        json['notificationLeadMinutes'],
      ),
      endsAt: serializer.fromJson<DateTime?>(json['endsAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String?>(petId),
      'kind': serializer.toJson<String>(kind),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String?>(body),
      'startsAt': serializer.toJson<DateTime>(startsAt),
      'timezoneId': serializer.toJson<String>(timezoneId),
      'recurrenceRule': serializer.toJson<String?>(recurrenceRule),
      'sourceEntityType': serializer.toJson<String?>(sourceEntityType),
      'sourceEntityId': serializer.toJson<String?>(sourceEntityId),
      'enabled': serializer.toJson<bool>(enabled),
      'notificationLeadMinutes': serializer.toJson<int>(
        notificationLeadMinutes,
      ),
      'endsAt': serializer.toJson<DateTime?>(endsAt),
    };
  }

  Reminder copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    Value<String?> petId = const Value.absent(),
    String? kind,
    String? title,
    Value<String?> body = const Value.absent(),
    DateTime? startsAt,
    String? timezoneId,
    Value<String?> recurrenceRule = const Value.absent(),
    Value<String?> sourceEntityType = const Value.absent(),
    Value<String?> sourceEntityId = const Value.absent(),
    bool? enabled,
    int? notificationLeadMinutes,
    Value<DateTime?> endsAt = const Value.absent(),
  }) => Reminder(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId.present ? petId.value : this.petId,
    kind: kind ?? this.kind,
    title: title ?? this.title,
    body: body.present ? body.value : this.body,
    startsAt: startsAt ?? this.startsAt,
    timezoneId: timezoneId ?? this.timezoneId,
    recurrenceRule:
        recurrenceRule.present ? recurrenceRule.value : this.recurrenceRule,
    sourceEntityType:
        sourceEntityType.present
            ? sourceEntityType.value
            : this.sourceEntityType,
    sourceEntityId:
        sourceEntityId.present ? sourceEntityId.value : this.sourceEntityId,
    enabled: enabled ?? this.enabled,
    notificationLeadMinutes:
        notificationLeadMinutes ?? this.notificationLeadMinutes,
    endsAt: endsAt.present ? endsAt.value : this.endsAt,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      kind: data.kind.present ? data.kind.value : this.kind,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      startsAt: data.startsAt.present ? data.startsAt.value : this.startsAt,
      timezoneId:
          data.timezoneId.present ? data.timezoneId.value : this.timezoneId,
      recurrenceRule:
          data.recurrenceRule.present
              ? data.recurrenceRule.value
              : this.recurrenceRule,
      sourceEntityType:
          data.sourceEntityType.present
              ? data.sourceEntityType.value
              : this.sourceEntityType,
      sourceEntityId:
          data.sourceEntityId.present
              ? data.sourceEntityId.value
              : this.sourceEntityId,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      notificationLeadMinutes:
          data.notificationLeadMinutes.present
              ? data.notificationLeadMinutes.value
              : this.notificationLeadMinutes,
      endsAt: data.endsAt.present ? data.endsAt.value : this.endsAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('kind: $kind, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('startsAt: $startsAt, ')
          ..write('timezoneId: $timezoneId, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('sourceEntityType: $sourceEntityType, ')
          ..write('sourceEntityId: $sourceEntityId, ')
          ..write('enabled: $enabled, ')
          ..write('notificationLeadMinutes: $notificationLeadMinutes, ')
          ..write('endsAt: $endsAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    kind,
    title,
    body,
    startsAt,
    timezoneId,
    recurrenceRule,
    sourceEntityType,
    sourceEntityId,
    enabled,
    notificationLeadMinutes,
    endsAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.kind == this.kind &&
          other.title == this.title &&
          other.body == this.body &&
          other.startsAt == this.startsAt &&
          other.timezoneId == this.timezoneId &&
          other.recurrenceRule == this.recurrenceRule &&
          other.sourceEntityType == this.sourceEntityType &&
          other.sourceEntityId == this.sourceEntityId &&
          other.enabled == this.enabled &&
          other.notificationLeadMinutes == this.notificationLeadMinutes &&
          other.endsAt == this.endsAt);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String?> petId;
  final Value<String> kind;
  final Value<String> title;
  final Value<String?> body;
  final Value<DateTime> startsAt;
  final Value<String> timezoneId;
  final Value<String?> recurrenceRule;
  final Value<String?> sourceEntityType;
  final Value<String?> sourceEntityId;
  final Value<bool> enabled;
  final Value<int> notificationLeadMinutes;
  final Value<DateTime?> endsAt;
  final Value<int> rowid;
  const RemindersCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.kind = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.startsAt = const Value.absent(),
    this.timezoneId = const Value.absent(),
    this.recurrenceRule = const Value.absent(),
    this.sourceEntityType = const Value.absent(),
    this.sourceEntityId = const Value.absent(),
    this.enabled = const Value.absent(),
    this.notificationLeadMinutes = const Value.absent(),
    this.endsAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    this.petId = const Value.absent(),
    required String kind,
    required String title,
    this.body = const Value.absent(),
    required DateTime startsAt,
    required String timezoneId,
    this.recurrenceRule = const Value.absent(),
    this.sourceEntityType = const Value.absent(),
    this.sourceEntityId = const Value.absent(),
    this.enabled = const Value.absent(),
    this.notificationLeadMinutes = const Value.absent(),
    this.endsAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       kind = Value(kind),
       title = Value(title),
       startsAt = Value(startsAt),
       timezoneId = Value(timezoneId);
  static Insertable<Reminder> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? kind,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? startsAt,
    Expression<String>? timezoneId,
    Expression<String>? recurrenceRule,
    Expression<String>? sourceEntityType,
    Expression<String>? sourceEntityId,
    Expression<bool>? enabled,
    Expression<int>? notificationLeadMinutes,
    Expression<DateTime>? endsAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (kind != null) 'kind': kind,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (startsAt != null) 'starts_at': startsAt,
      if (timezoneId != null) 'timezone_id': timezoneId,
      if (recurrenceRule != null) 'recurrence_rule': recurrenceRule,
      if (sourceEntityType != null) 'source_entity_type': sourceEntityType,
      if (sourceEntityId != null) 'source_entity_id': sourceEntityId,
      if (enabled != null) 'enabled': enabled,
      if (notificationLeadMinutes != null)
        'notification_lead_minutes': notificationLeadMinutes,
      if (endsAt != null) 'ends_at': endsAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String?>? petId,
    Value<String>? kind,
    Value<String>? title,
    Value<String?>? body,
    Value<DateTime>? startsAt,
    Value<String>? timezoneId,
    Value<String?>? recurrenceRule,
    Value<String?>? sourceEntityType,
    Value<String?>? sourceEntityId,
    Value<bool>? enabled,
    Value<int>? notificationLeadMinutes,
    Value<DateTime?>? endsAt,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      kind: kind ?? this.kind,
      title: title ?? this.title,
      body: body ?? this.body,
      startsAt: startsAt ?? this.startsAt,
      timezoneId: timezoneId ?? this.timezoneId,
      recurrenceRule: recurrenceRule ?? this.recurrenceRule,
      sourceEntityType: sourceEntityType ?? this.sourceEntityType,
      sourceEntityId: sourceEntityId ?? this.sourceEntityId,
      enabled: enabled ?? this.enabled,
      notificationLeadMinutes:
          notificationLeadMinutes ?? this.notificationLeadMinutes,
      endsAt: endsAt ?? this.endsAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (startsAt.present) {
      map['starts_at'] = Variable<DateTime>(startsAt.value);
    }
    if (timezoneId.present) {
      map['timezone_id'] = Variable<String>(timezoneId.value);
    }
    if (recurrenceRule.present) {
      map['recurrence_rule'] = Variable<String>(recurrenceRule.value);
    }
    if (sourceEntityType.present) {
      map['source_entity_type'] = Variable<String>(sourceEntityType.value);
    }
    if (sourceEntityId.present) {
      map['source_entity_id'] = Variable<String>(sourceEntityId.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (notificationLeadMinutes.present) {
      map['notification_lead_minutes'] = Variable<int>(
        notificationLeadMinutes.value,
      );
    }
    if (endsAt.present) {
      map['ends_at'] = Variable<DateTime>(endsAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('kind: $kind, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('startsAt: $startsAt, ')
          ..write('timezoneId: $timezoneId, ')
          ..write('recurrenceRule: $recurrenceRule, ')
          ..write('sourceEntityType: $sourceEntityType, ')
          ..write('sourceEntityId: $sourceEntityId, ')
          ..write('enabled: $enabled, ')
          ..write('notificationLeadMinutes: $notificationLeadMinutes, ')
          ..write('endsAt: $endsAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScheduledNotificationsTable extends ScheduledNotifications
    with TableInfo<$ScheduledNotificationsTable, ScheduledNotification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduledNotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reminderIdMeta = const VerificationMeta(
    'reminderId',
  );
  @override
  late final GeneratedColumn<String> reminderId = GeneratedColumn<String>(
    'reminder_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _platformNotificationIdMeta =
      const VerificationMeta('platformNotificationId');
  @override
  late final GeneratedColumn<int> platformNotificationId = GeneratedColumn<int>(
    'platform_notification_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _scheduledForMeta = const VerificationMeta(
    'scheduledFor',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledFor = GeneratedColumn<DateTime>(
    'scheduled_for',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    reminderId,
    platformNotificationId,
    scheduledFor,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scheduled_notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScheduledNotification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('reminder_id')) {
      context.handle(
        _reminderIdMeta,
        reminderId.isAcceptableOrUnknown(data['reminder_id']!, _reminderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reminderIdMeta);
    }
    if (data.containsKey('platform_notification_id')) {
      context.handle(
        _platformNotificationIdMeta,
        platformNotificationId.isAcceptableOrUnknown(
          data['platform_notification_id']!,
          _platformNotificationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_platformNotificationIdMeta);
    }
    if (data.containsKey('scheduled_for')) {
      context.handle(
        _scheduledForMeta,
        scheduledFor.isAcceptableOrUnknown(
          data['scheduled_for']!,
          _scheduledForMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledForMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduledNotification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduledNotification(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      reminderId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}reminder_id'],
          )!,
      platformNotificationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}platform_notification_id'],
          )!,
      scheduledFor:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}scheduled_for'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $ScheduledNotificationsTable createAlias(String alias) {
    return $ScheduledNotificationsTable(attachedDatabase, alias);
  }
}

class ScheduledNotification extends DataClass
    implements Insertable<ScheduledNotification> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String reminderId;
  final int platformNotificationId;
  final DateTime scheduledFor;
  final String status;
  const ScheduledNotification({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.reminderId,
    required this.platformNotificationId,
    required this.scheduledFor,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['reminder_id'] = Variable<String>(reminderId);
    map['platform_notification_id'] = Variable<int>(platformNotificationId);
    map['scheduled_for'] = Variable<DateTime>(scheduledFor);
    map['status'] = Variable<String>(status);
    return map;
  }

  ScheduledNotificationsCompanion toCompanion(bool nullToAbsent) {
    return ScheduledNotificationsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      reminderId: Value(reminderId),
      platformNotificationId: Value(platformNotificationId),
      scheduledFor: Value(scheduledFor),
      status: Value(status),
    );
  }

  factory ScheduledNotification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduledNotification(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      reminderId: serializer.fromJson<String>(json['reminderId']),
      platformNotificationId: serializer.fromJson<int>(
        json['platformNotificationId'],
      ),
      scheduledFor: serializer.fromJson<DateTime>(json['scheduledFor']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'reminderId': serializer.toJson<String>(reminderId),
      'platformNotificationId': serializer.toJson<int>(platformNotificationId),
      'scheduledFor': serializer.toJson<DateTime>(scheduledFor),
      'status': serializer.toJson<String>(status),
    };
  }

  ScheduledNotification copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? reminderId,
    int? platformNotificationId,
    DateTime? scheduledFor,
    String? status,
  }) => ScheduledNotification(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    reminderId: reminderId ?? this.reminderId,
    platformNotificationId:
        platformNotificationId ?? this.platformNotificationId,
    scheduledFor: scheduledFor ?? this.scheduledFor,
    status: status ?? this.status,
  );
  ScheduledNotification copyWithCompanion(
    ScheduledNotificationsCompanion data,
  ) {
    return ScheduledNotification(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      reminderId:
          data.reminderId.present ? data.reminderId.value : this.reminderId,
      platformNotificationId:
          data.platformNotificationId.present
              ? data.platformNotificationId.value
              : this.platformNotificationId,
      scheduledFor:
          data.scheduledFor.present
              ? data.scheduledFor.value
              : this.scheduledFor,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledNotification(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('reminderId: $reminderId, ')
          ..write('platformNotificationId: $platformNotificationId, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    reminderId,
    platformNotificationId,
    scheduledFor,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduledNotification &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.reminderId == this.reminderId &&
          other.platformNotificationId == this.platformNotificationId &&
          other.scheduledFor == this.scheduledFor &&
          other.status == this.status);
}

class ScheduledNotificationsCompanion
    extends UpdateCompanion<ScheduledNotification> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> reminderId;
  final Value<int> platformNotificationId;
  final Value<DateTime> scheduledFor;
  final Value<String> status;
  final Value<int> rowid;
  const ScheduledNotificationsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.reminderId = const Value.absent(),
    this.platformNotificationId = const Value.absent(),
    this.scheduledFor = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScheduledNotificationsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String reminderId,
    required int platformNotificationId,
    required DateTime scheduledFor,
    required String status,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       reminderId = Value(reminderId),
       platformNotificationId = Value(platformNotificationId),
       scheduledFor = Value(scheduledFor),
       status = Value(status);
  static Insertable<ScheduledNotification> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? reminderId,
    Expression<int>? platformNotificationId,
    Expression<DateTime>? scheduledFor,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (reminderId != null) 'reminder_id': reminderId,
      if (platformNotificationId != null)
        'platform_notification_id': platformNotificationId,
      if (scheduledFor != null) 'scheduled_for': scheduledFor,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScheduledNotificationsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? reminderId,
    Value<int>? platformNotificationId,
    Value<DateTime>? scheduledFor,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return ScheduledNotificationsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      reminderId: reminderId ?? this.reminderId,
      platformNotificationId:
          platformNotificationId ?? this.platformNotificationId,
      scheduledFor: scheduledFor ?? this.scheduledFor,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (reminderId.present) {
      map['reminder_id'] = Variable<String>(reminderId.value);
    }
    if (platformNotificationId.present) {
      map['platform_notification_id'] = Variable<int>(
        platformNotificationId.value,
      );
    }
    if (scheduledFor.present) {
      map['scheduled_for'] = Variable<DateTime>(scheduledFor.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledNotificationsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('reminderId: $reminderId, ')
          ..write('platformNotificationId: $platformNotificationId, ')
          ..write('scheduledFor: $scheduledFor, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GeneratedReportsTable extends GeneratedReports
    with TableInfo<$GeneratedReportsTable, GeneratedReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeneratedReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fileIdMeta = const VerificationMeta('fileId');
  @override
  late final GeneratedColumn<String> fileId = GeneratedColumn<String>(
    'file_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reportTypeMeta = const VerificationMeta(
    'reportType',
  );
  @override
  late final GeneratedColumn<String> reportType = GeneratedColumn<String>(
    'report_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodStartMeta = const VerificationMeta(
    'periodStart',
  );
  @override
  late final GeneratedColumn<DateTime> periodStart = GeneratedColumn<DateTime>(
    'period_start',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _periodEndMeta = const VerificationMeta(
    'periodEnd',
  );
  @override
  late final GeneratedColumn<DateTime> periodEnd = GeneratedColumn<DateTime>(
    'period_end',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    fileId,
    reportType,
    periodStart,
    periodEnd,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'generated_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<GeneratedReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    }
    if (data.containsKey('file_id')) {
      context.handle(
        _fileIdMeta,
        fileId.isAcceptableOrUnknown(data['file_id']!, _fileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_fileIdMeta);
    }
    if (data.containsKey('report_type')) {
      context.handle(
        _reportTypeMeta,
        reportType.isAcceptableOrUnknown(data['report_type']!, _reportTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_reportTypeMeta);
    }
    if (data.containsKey('period_start')) {
      context.handle(
        _periodStartMeta,
        periodStart.isAcceptableOrUnknown(
          data['period_start']!,
          _periodStartMeta,
        ),
      );
    }
    if (data.containsKey('period_end')) {
      context.handle(
        _periodEndMeta,
        periodEnd.isAcceptableOrUnknown(data['period_end']!, _periodEndMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeneratedReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeneratedReport(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pet_id'],
      ),
      fileId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}file_id'],
          )!,
      reportType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}report_type'],
          )!,
      periodStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}period_start'],
      ),
      periodEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}period_end'],
      ),
    );
  }

  @override
  $GeneratedReportsTable createAlias(String alias) {
    return $GeneratedReportsTable(attachedDatabase, alias);
  }
}

class GeneratedReport extends DataClass implements Insertable<GeneratedReport> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String? petId;
  final String fileId;
  final String reportType;
  final DateTime? periodStart;
  final DateTime? periodEnd;
  const GeneratedReport({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.petId,
    required this.fileId,
    required this.reportType,
    this.periodStart,
    this.periodEnd,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || petId != null) {
      map['pet_id'] = Variable<String>(petId);
    }
    map['file_id'] = Variable<String>(fileId);
    map['report_type'] = Variable<String>(reportType);
    if (!nullToAbsent || periodStart != null) {
      map['period_start'] = Variable<DateTime>(periodStart);
    }
    if (!nullToAbsent || periodEnd != null) {
      map['period_end'] = Variable<DateTime>(periodEnd);
    }
    return map;
  }

  GeneratedReportsCompanion toCompanion(bool nullToAbsent) {
    return GeneratedReportsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId:
          petId == null && nullToAbsent ? const Value.absent() : Value(petId),
      fileId: Value(fileId),
      reportType: Value(reportType),
      periodStart:
          periodStart == null && nullToAbsent
              ? const Value.absent()
              : Value(periodStart),
      periodEnd:
          periodEnd == null && nullToAbsent
              ? const Value.absent()
              : Value(periodEnd),
    );
  }

  factory GeneratedReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeneratedReport(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String?>(json['petId']),
      fileId: serializer.fromJson<String>(json['fileId']),
      reportType: serializer.fromJson<String>(json['reportType']),
      periodStart: serializer.fromJson<DateTime?>(json['periodStart']),
      periodEnd: serializer.fromJson<DateTime?>(json['periodEnd']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String?>(petId),
      'fileId': serializer.toJson<String>(fileId),
      'reportType': serializer.toJson<String>(reportType),
      'periodStart': serializer.toJson<DateTime?>(periodStart),
      'periodEnd': serializer.toJson<DateTime?>(periodEnd),
    };
  }

  GeneratedReport copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    Value<String?> petId = const Value.absent(),
    String? fileId,
    String? reportType,
    Value<DateTime?> periodStart = const Value.absent(),
    Value<DateTime?> periodEnd = const Value.absent(),
  }) => GeneratedReport(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId.present ? petId.value : this.petId,
    fileId: fileId ?? this.fileId,
    reportType: reportType ?? this.reportType,
    periodStart: periodStart.present ? periodStart.value : this.periodStart,
    periodEnd: periodEnd.present ? periodEnd.value : this.periodEnd,
  );
  GeneratedReport copyWithCompanion(GeneratedReportsCompanion data) {
    return GeneratedReport(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      fileId: data.fileId.present ? data.fileId.value : this.fileId,
      reportType:
          data.reportType.present ? data.reportType.value : this.reportType,
      periodStart:
          data.periodStart.present ? data.periodStart.value : this.periodStart,
      periodEnd: data.periodEnd.present ? data.periodEnd.value : this.periodEnd,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedReport(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('fileId: $fileId, ')
          ..write('reportType: $reportType, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    fileId,
    reportType,
    periodStart,
    periodEnd,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeneratedReport &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.fileId == this.fileId &&
          other.reportType == this.reportType &&
          other.periodStart == this.periodStart &&
          other.periodEnd == this.periodEnd);
}

class GeneratedReportsCompanion extends UpdateCompanion<GeneratedReport> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String?> petId;
  final Value<String> fileId;
  final Value<String> reportType;
  final Value<DateTime?> periodStart;
  final Value<DateTime?> periodEnd;
  final Value<int> rowid;
  const GeneratedReportsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.fileId = const Value.absent(),
    this.reportType = const Value.absent(),
    this.periodStart = const Value.absent(),
    this.periodEnd = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GeneratedReportsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    this.petId = const Value.absent(),
    required String fileId,
    required String reportType,
    this.periodStart = const Value.absent(),
    this.periodEnd = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       fileId = Value(fileId),
       reportType = Value(reportType);
  static Insertable<GeneratedReport> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? fileId,
    Expression<String>? reportType,
    Expression<DateTime>? periodStart,
    Expression<DateTime>? periodEnd,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (fileId != null) 'file_id': fileId,
      if (reportType != null) 'report_type': reportType,
      if (periodStart != null) 'period_start': periodStart,
      if (periodEnd != null) 'period_end': periodEnd,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GeneratedReportsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String?>? petId,
    Value<String>? fileId,
    Value<String>? reportType,
    Value<DateTime?>? periodStart,
    Value<DateTime?>? periodEnd,
    Value<int>? rowid,
  }) {
    return GeneratedReportsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      fileId: fileId ?? this.fileId,
      reportType: reportType ?? this.reportType,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (fileId.present) {
      map['file_id'] = Variable<String>(fileId.value);
    }
    if (reportType.present) {
      map['report_type'] = Variable<String>(reportType.value);
    }
    if (periodStart.present) {
      map['period_start'] = Variable<DateTime>(periodStart.value);
    }
    if (periodEnd.present) {
      map['period_end'] = Variable<DateTime>(periodEnd.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeneratedReportsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('fileId: $fileId, ')
          ..write('reportType: $reportType, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _settingKeyMeta = const VerificationMeta(
    'settingKey',
  );
  @override
  late final GeneratedColumn<String> settingKey = GeneratedColumn<String>(
    'setting_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _valueJsonMeta = const VerificationMeta(
    'valueJson',
  );
  @override
  late final GeneratedColumn<String> valueJson = GeneratedColumn<String>(
    'value_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    settingKey,
    valueJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('setting_key')) {
      context.handle(
        _settingKeyMeta,
        settingKey.isAcceptableOrUnknown(data['setting_key']!, _settingKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_settingKeyMeta);
    }
    if (data.containsKey('value_json')) {
      context.handle(
        _valueJsonMeta,
        valueJson.isAcceptableOrUnknown(data['value_json']!, _valueJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_valueJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      settingKey:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}setting_key'],
          )!,
      valueJson:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}value_json'],
          )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String settingKey;
  final String valueJson;
  const AppSetting({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.settingKey,
    required this.valueJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['setting_key'] = Variable<String>(settingKey);
    map['value_json'] = Variable<String>(valueJson);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      settingKey: Value(settingKey),
      valueJson: Value(valueJson),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      settingKey: serializer.fromJson<String>(json['settingKey']),
      valueJson: serializer.fromJson<String>(json['valueJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'settingKey': serializer.toJson<String>(settingKey),
      'valueJson': serializer.toJson<String>(valueJson),
    };
  }

  AppSetting copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? settingKey,
    String? valueJson,
  }) => AppSetting(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    settingKey: settingKey ?? this.settingKey,
    valueJson: valueJson ?? this.valueJson,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      settingKey:
          data.settingKey.present ? data.settingKey.value : this.settingKey,
      valueJson: data.valueJson.present ? data.valueJson.value : this.valueJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('settingKey: $settingKey, ')
          ..write('valueJson: $valueJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(createdAt, updatedAt, id, settingKey, valueJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.settingKey == this.settingKey &&
          other.valueJson == this.valueJson);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> settingKey;
  final Value<String> valueJson;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.settingKey = const Value.absent(),
    this.valueJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String settingKey,
    required String valueJson,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       settingKey = Value(settingKey),
       valueJson = Value(valueJson);
  static Insertable<AppSetting> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? settingKey,
    Expression<String>? valueJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (settingKey != null) 'setting_key': settingKey,
      if (valueJson != null) 'value_json': valueJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? settingKey,
    Value<String>? valueJson,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      settingKey: settingKey ?? this.settingKey,
      valueJson: valueJson ?? this.valueJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (settingKey.present) {
      map['setting_key'] = Variable<String>(settingKey.value);
    }
    if (valueJson.present) {
      map['value_json'] = Variable<String>(valueJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('settingKey: $settingKey, ')
          ..write('valueJson: $valueJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BackupRecordsTable extends BackupRecords
    with TableInfo<$BackupRecordsTable, BackupRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BackupRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _driveFileIdMeta = const VerificationMeta(
    'driveFileId',
  );
  @override
  late final GeneratedColumn<String> driveFileId = GeneratedColumn<String>(
    'drive_file_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _backupFormatVersionMeta =
      const VerificationMeta('backupFormatVersion');
  @override
  late final GeneratedColumn<int> backupFormatVersion = GeneratedColumn<int>(
    'backup_format_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _databaseSchemaVersionMeta =
      const VerificationMeta('databaseSchemaVersion');
  @override
  late final GeneratedColumn<int> databaseSchemaVersion = GeneratedColumn<int>(
    'database_schema_version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _encryptedSha256Meta = const VerificationMeta(
    'encryptedSha256',
  );
  @override
  late final GeneratedColumn<String> encryptedSha256 = GeneratedColumn<String>(
    'encrypted_sha256',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _byteSizeMeta = const VerificationMeta(
    'byteSize',
  );
  @override
  late final GeneratedColumn<int> byteSize = GeneratedColumn<int>(
    'byte_size',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _failureCodeMeta = const VerificationMeta(
    'failureCode',
  );
  @override
  late final GeneratedColumn<String> failureCode = GeneratedColumn<String>(
    'failure_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    driveFileId,
    backupFormatVersion,
    databaseSchemaVersion,
    encryptedSha256,
    byteSize,
    startedAt,
    completedAt,
    status,
    failureCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'backup_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<BackupRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('drive_file_id')) {
      context.handle(
        _driveFileIdMeta,
        driveFileId.isAcceptableOrUnknown(
          data['drive_file_id']!,
          _driveFileIdMeta,
        ),
      );
    }
    if (data.containsKey('backup_format_version')) {
      context.handle(
        _backupFormatVersionMeta,
        backupFormatVersion.isAcceptableOrUnknown(
          data['backup_format_version']!,
          _backupFormatVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_backupFormatVersionMeta);
    }
    if (data.containsKey('database_schema_version')) {
      context.handle(
        _databaseSchemaVersionMeta,
        databaseSchemaVersion.isAcceptableOrUnknown(
          data['database_schema_version']!,
          _databaseSchemaVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_databaseSchemaVersionMeta);
    }
    if (data.containsKey('encrypted_sha256')) {
      context.handle(
        _encryptedSha256Meta,
        encryptedSha256.isAcceptableOrUnknown(
          data['encrypted_sha256']!,
          _encryptedSha256Meta,
        ),
      );
    }
    if (data.containsKey('byte_size')) {
      context.handle(
        _byteSizeMeta,
        byteSize.isAcceptableOrUnknown(data['byte_size']!, _byteSizeMeta),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('failure_code')) {
      context.handle(
        _failureCodeMeta,
        failureCode.isAcceptableOrUnknown(
          data['failure_code']!,
          _failureCodeMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BackupRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BackupRecord(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      driveFileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}drive_file_id'],
      ),
      backupFormatVersion:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}backup_format_version'],
          )!,
      databaseSchemaVersion:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}database_schema_version'],
          )!,
      encryptedSha256: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}encrypted_sha256'],
      ),
      byteSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}byte_size'],
      ),
      startedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}started_at'],
          )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      failureCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}failure_code'],
      ),
    );
  }

  @override
  $BackupRecordsTable createAlias(String alias) {
    return $BackupRecordsTable(attachedDatabase, alias);
  }
}

class BackupRecord extends DataClass implements Insertable<BackupRecord> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String? driveFileId;
  final int backupFormatVersion;
  final int databaseSchemaVersion;
  final String? encryptedSha256;
  final int? byteSize;
  final DateTime startedAt;
  final DateTime? completedAt;
  final String status;
  final String? failureCode;
  const BackupRecord({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.driveFileId,
    required this.backupFormatVersion,
    required this.databaseSchemaVersion,
    this.encryptedSha256,
    this.byteSize,
    required this.startedAt,
    this.completedAt,
    required this.status,
    this.failureCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || driveFileId != null) {
      map['drive_file_id'] = Variable<String>(driveFileId);
    }
    map['backup_format_version'] = Variable<int>(backupFormatVersion);
    map['database_schema_version'] = Variable<int>(databaseSchemaVersion);
    if (!nullToAbsent || encryptedSha256 != null) {
      map['encrypted_sha256'] = Variable<String>(encryptedSha256);
    }
    if (!nullToAbsent || byteSize != null) {
      map['byte_size'] = Variable<int>(byteSize);
    }
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || failureCode != null) {
      map['failure_code'] = Variable<String>(failureCode);
    }
    return map;
  }

  BackupRecordsCompanion toCompanion(bool nullToAbsent) {
    return BackupRecordsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      driveFileId:
          driveFileId == null && nullToAbsent
              ? const Value.absent()
              : Value(driveFileId),
      backupFormatVersion: Value(backupFormatVersion),
      databaseSchemaVersion: Value(databaseSchemaVersion),
      encryptedSha256:
          encryptedSha256 == null && nullToAbsent
              ? const Value.absent()
              : Value(encryptedSha256),
      byteSize:
          byteSize == null && nullToAbsent
              ? const Value.absent()
              : Value(byteSize),
      startedAt: Value(startedAt),
      completedAt:
          completedAt == null && nullToAbsent
              ? const Value.absent()
              : Value(completedAt),
      status: Value(status),
      failureCode:
          failureCode == null && nullToAbsent
              ? const Value.absent()
              : Value(failureCode),
    );
  }

  factory BackupRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BackupRecord(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      driveFileId: serializer.fromJson<String?>(json['driveFileId']),
      backupFormatVersion: serializer.fromJson<int>(
        json['backupFormatVersion'],
      ),
      databaseSchemaVersion: serializer.fromJson<int>(
        json['databaseSchemaVersion'],
      ),
      encryptedSha256: serializer.fromJson<String?>(json['encryptedSha256']),
      byteSize: serializer.fromJson<int?>(json['byteSize']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      status: serializer.fromJson<String>(json['status']),
      failureCode: serializer.fromJson<String?>(json['failureCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'driveFileId': serializer.toJson<String?>(driveFileId),
      'backupFormatVersion': serializer.toJson<int>(backupFormatVersion),
      'databaseSchemaVersion': serializer.toJson<int>(databaseSchemaVersion),
      'encryptedSha256': serializer.toJson<String?>(encryptedSha256),
      'byteSize': serializer.toJson<int?>(byteSize),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'status': serializer.toJson<String>(status),
      'failureCode': serializer.toJson<String?>(failureCode),
    };
  }

  BackupRecord copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    Value<String?> driveFileId = const Value.absent(),
    int? backupFormatVersion,
    int? databaseSchemaVersion,
    Value<String?> encryptedSha256 = const Value.absent(),
    Value<int?> byteSize = const Value.absent(),
    DateTime? startedAt,
    Value<DateTime?> completedAt = const Value.absent(),
    String? status,
    Value<String?> failureCode = const Value.absent(),
  }) => BackupRecord(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    driveFileId: driveFileId.present ? driveFileId.value : this.driveFileId,
    backupFormatVersion: backupFormatVersion ?? this.backupFormatVersion,
    databaseSchemaVersion: databaseSchemaVersion ?? this.databaseSchemaVersion,
    encryptedSha256:
        encryptedSha256.present ? encryptedSha256.value : this.encryptedSha256,
    byteSize: byteSize.present ? byteSize.value : this.byteSize,
    startedAt: startedAt ?? this.startedAt,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    status: status ?? this.status,
    failureCode: failureCode.present ? failureCode.value : this.failureCode,
  );
  BackupRecord copyWithCompanion(BackupRecordsCompanion data) {
    return BackupRecord(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      driveFileId:
          data.driveFileId.present ? data.driveFileId.value : this.driveFileId,
      backupFormatVersion:
          data.backupFormatVersion.present
              ? data.backupFormatVersion.value
              : this.backupFormatVersion,
      databaseSchemaVersion:
          data.databaseSchemaVersion.present
              ? data.databaseSchemaVersion.value
              : this.databaseSchemaVersion,
      encryptedSha256:
          data.encryptedSha256.present
              ? data.encryptedSha256.value
              : this.encryptedSha256,
      byteSize: data.byteSize.present ? data.byteSize.value : this.byteSize,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      status: data.status.present ? data.status.value : this.status,
      failureCode:
          data.failureCode.present ? data.failureCode.value : this.failureCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BackupRecord(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('driveFileId: $driveFileId, ')
          ..write('backupFormatVersion: $backupFormatVersion, ')
          ..write('databaseSchemaVersion: $databaseSchemaVersion, ')
          ..write('encryptedSha256: $encryptedSha256, ')
          ..write('byteSize: $byteSize, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('status: $status, ')
          ..write('failureCode: $failureCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    driveFileId,
    backupFormatVersion,
    databaseSchemaVersion,
    encryptedSha256,
    byteSize,
    startedAt,
    completedAt,
    status,
    failureCode,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BackupRecord &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.driveFileId == this.driveFileId &&
          other.backupFormatVersion == this.backupFormatVersion &&
          other.databaseSchemaVersion == this.databaseSchemaVersion &&
          other.encryptedSha256 == this.encryptedSha256 &&
          other.byteSize == this.byteSize &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.status == this.status &&
          other.failureCode == this.failureCode);
}

class BackupRecordsCompanion extends UpdateCompanion<BackupRecord> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String?> driveFileId;
  final Value<int> backupFormatVersion;
  final Value<int> databaseSchemaVersion;
  final Value<String?> encryptedSha256;
  final Value<int?> byteSize;
  final Value<DateTime> startedAt;
  final Value<DateTime?> completedAt;
  final Value<String> status;
  final Value<String?> failureCode;
  final Value<int> rowid;
  const BackupRecordsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.driveFileId = const Value.absent(),
    this.backupFormatVersion = const Value.absent(),
    this.databaseSchemaVersion = const Value.absent(),
    this.encryptedSha256 = const Value.absent(),
    this.byteSize = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.failureCode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BackupRecordsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    this.driveFileId = const Value.absent(),
    required int backupFormatVersion,
    required int databaseSchemaVersion,
    this.encryptedSha256 = const Value.absent(),
    this.byteSize = const Value.absent(),
    required DateTime startedAt,
    this.completedAt = const Value.absent(),
    required String status,
    this.failureCode = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       backupFormatVersion = Value(backupFormatVersion),
       databaseSchemaVersion = Value(databaseSchemaVersion),
       startedAt = Value(startedAt),
       status = Value(status);
  static Insertable<BackupRecord> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? driveFileId,
    Expression<int>? backupFormatVersion,
    Expression<int>? databaseSchemaVersion,
    Expression<String>? encryptedSha256,
    Expression<int>? byteSize,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<String>? status,
    Expression<String>? failureCode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (driveFileId != null) 'drive_file_id': driveFileId,
      if (backupFormatVersion != null)
        'backup_format_version': backupFormatVersion,
      if (databaseSchemaVersion != null)
        'database_schema_version': databaseSchemaVersion,
      if (encryptedSha256 != null) 'encrypted_sha256': encryptedSha256,
      if (byteSize != null) 'byte_size': byteSize,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (status != null) 'status': status,
      if (failureCode != null) 'failure_code': failureCode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BackupRecordsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String?>? driveFileId,
    Value<int>? backupFormatVersion,
    Value<int>? databaseSchemaVersion,
    Value<String?>? encryptedSha256,
    Value<int?>? byteSize,
    Value<DateTime>? startedAt,
    Value<DateTime?>? completedAt,
    Value<String>? status,
    Value<String?>? failureCode,
    Value<int>? rowid,
  }) {
    return BackupRecordsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      driveFileId: driveFileId ?? this.driveFileId,
      backupFormatVersion: backupFormatVersion ?? this.backupFormatVersion,
      databaseSchemaVersion:
          databaseSchemaVersion ?? this.databaseSchemaVersion,
      encryptedSha256: encryptedSha256 ?? this.encryptedSha256,
      byteSize: byteSize ?? this.byteSize,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      status: status ?? this.status,
      failureCode: failureCode ?? this.failureCode,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (driveFileId.present) {
      map['drive_file_id'] = Variable<String>(driveFileId.value);
    }
    if (backupFormatVersion.present) {
      map['backup_format_version'] = Variable<int>(backupFormatVersion.value);
    }
    if (databaseSchemaVersion.present) {
      map['database_schema_version'] = Variable<int>(
        databaseSchemaVersion.value,
      );
    }
    if (encryptedSha256.present) {
      map['encrypted_sha256'] = Variable<String>(encryptedSha256.value);
    }
    if (byteSize.present) {
      map['byte_size'] = Variable<int>(byteSize.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (failureCode.present) {
      map['failure_code'] = Variable<String>(failureCode.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BackupRecordsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('driveFileId: $driveFileId, ')
          ..write('backupFormatVersion: $backupFormatVersion, ')
          ..write('databaseSchemaVersion: $databaseSchemaVersion, ')
          ..write('encryptedSha256: $encryptedSha256, ')
          ..write('byteSize: $byteSize, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('status: $status, ')
          ..write('failureCode: $failureCode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemoriesTable extends Memories with TableInfo<$MemoriesTable, Memory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageFileIdMeta = const VerificationMeta(
    'imageFileId',
  );
  @override
  late final GeneratedColumn<String> imageFileId = GeneratedColumn<String>(
    'image_file_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    title,
    description,
    imageFileId,
    date,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Memory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('image_file_id')) {
      context.handle(
        _imageFileIdMeta,
        imageFileId.isAcceptableOrUnknown(
          data['image_file_id']!,
          _imageFileIdMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Memory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Memory(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_id'],
          )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      imageFileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_file_id'],
      ),
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
    );
  }

  @override
  $MemoriesTable createAlias(String alias) {
    return $MemoriesTable(attachedDatabase, alias);
  }
}

class Memory extends DataClass implements Insertable<Memory> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petId;
  final String? title;
  final String? description;
  final String? imageFileId;
  final DateTime date;
  const Memory({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petId,
    this.title,
    this.description,
    this.imageFileId,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imageFileId != null) {
      map['image_file_id'] = Variable<String>(imageFileId);
    }
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  MemoriesCompanion toCompanion(bool nullToAbsent) {
    return MemoriesCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId: Value(petId),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      imageFileId:
          imageFileId == null && nullToAbsent
              ? const Value.absent()
              : Value(imageFileId),
      date: Value(date),
    );
  }

  factory Memory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Memory(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      title: serializer.fromJson<String?>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      imageFileId: serializer.fromJson<String?>(json['imageFileId']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'title': serializer.toJson<String?>(title),
      'description': serializer.toJson<String?>(description),
      'imageFileId': serializer.toJson<String?>(imageFileId),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Memory copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petId,
    Value<String?> title = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> imageFileId = const Value.absent(),
    DateTime? date,
  }) => Memory(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId ?? this.petId,
    title: title.present ? title.value : this.title,
    description: description.present ? description.value : this.description,
    imageFileId: imageFileId.present ? imageFileId.value : this.imageFileId,
    date: date ?? this.date,
  );
  Memory copyWithCompanion(MemoriesCompanion data) {
    return Memory(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      imageFileId:
          data.imageFileId.present ? data.imageFileId.value : this.imageFileId,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Memory(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imageFileId: $imageFileId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    title,
    description,
    imageFileId,
    date,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memory &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.title == this.title &&
          other.description == this.description &&
          other.imageFileId == this.imageFileId &&
          other.date == this.date);
}

class MemoriesCompanion extends UpdateCompanion<Memory> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petId;
  final Value<String?> title;
  final Value<String?> description;
  final Value<String?> imageFileId;
  final Value<DateTime> date;
  final Value<int> rowid;
  const MemoriesCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imageFileId = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemoriesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petId,
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imageFileId = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId);
  static Insertable<Memory> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? imageFileId,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (imageFileId != null) 'image_file_id': imageFileId,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemoriesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petId,
    Value<String?>? title,
    Value<String?>? description,
    Value<String?>? imageFileId,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return MemoriesCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      title: title ?? this.title,
      description: description ?? this.description,
      imageFileId: imageFileId ?? this.imageFileId,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageFileId.present) {
      map['image_file_id'] = Variable<String>(imageFileId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemoriesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imageFileId: $imageFileId, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DewormingsTable extends Dewormings
    with TableInfo<$DewormingsTable, Deworming> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DewormingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _petIdMeta = const VerificationMeta('petId');
  @override
  late final GeneratedColumn<String> petId = GeneratedColumn<String>(
    'pet_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _medicationNameMeta = const VerificationMeta(
    'medicationName',
  );
  @override
  late final GeneratedColumn<String> medicationName = GeneratedColumn<String>(
    'medication_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _administeredOnMeta = const VerificationMeta(
    'administeredOn',
  );
  @override
  late final GeneratedColumn<DateTime> administeredOn =
      GeneratedColumn<DateTime>(
        'administered_on',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _nextDueOnMeta = const VerificationMeta(
    'nextDueOn',
  );
  @override
  late final GeneratedColumn<DateTime> nextDueOn = GeneratedColumn<DateTime>(
    'next_due_on',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('completed'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    updatedAt,
    id,
    petId,
    medicationName,
    administeredOn,
    nextDueOn,
    notes,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dewormings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Deworming> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pet_id')) {
      context.handle(
        _petIdMeta,
        petId.isAcceptableOrUnknown(data['pet_id']!, _petIdMeta),
      );
    } else if (isInserting) {
      context.missing(_petIdMeta);
    }
    if (data.containsKey('medication_name')) {
      context.handle(
        _medicationNameMeta,
        medicationName.isAcceptableOrUnknown(
          data['medication_name']!,
          _medicationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationNameMeta);
    }
    if (data.containsKey('administered_on')) {
      context.handle(
        _administeredOnMeta,
        administeredOn.isAcceptableOrUnknown(
          data['administered_on']!,
          _administeredOnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_administeredOnMeta);
    }
    if (data.containsKey('next_due_on')) {
      context.handle(
        _nextDueOnMeta,
        nextDueOn.isAcceptableOrUnknown(data['next_due_on']!, _nextDueOnMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Deworming map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Deworming(
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      petId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pet_id'],
          )!,
      medicationName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}medication_name'],
          )!,
      administeredOn:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}administered_on'],
          )!,
      nextDueOn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_due_on'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $DewormingsTable createAlias(String alias) {
    return $DewormingsTable(attachedDatabase, alias);
  }
}

class Deworming extends DataClass implements Insertable<Deworming> {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String id;
  final String petId;
  final String medicationName;
  final DateTime administeredOn;
  final DateTime? nextDueOn;
  final String? notes;
  final String status;
  const Deworming({
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.petId,
    required this.medicationName,
    required this.administeredOn,
    this.nextDueOn,
    this.notes,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['id'] = Variable<String>(id);
    map['pet_id'] = Variable<String>(petId);
    map['medication_name'] = Variable<String>(medicationName);
    map['administered_on'] = Variable<DateTime>(administeredOn);
    if (!nullToAbsent || nextDueOn != null) {
      map['next_due_on'] = Variable<DateTime>(nextDueOn);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  DewormingsCompanion toCompanion(bool nullToAbsent) {
    return DewormingsCompanion(
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      id: Value(id),
      petId: Value(petId),
      medicationName: Value(medicationName),
      administeredOn: Value(administeredOn),
      nextDueOn:
          nextDueOn == null && nullToAbsent
              ? const Value.absent()
              : Value(nextDueOn),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      status: Value(status),
    );
  }

  factory Deworming.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Deworming(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      id: serializer.fromJson<String>(json['id']),
      petId: serializer.fromJson<String>(json['petId']),
      medicationName: serializer.fromJson<String>(json['medicationName']),
      administeredOn: serializer.fromJson<DateTime>(json['administeredOn']),
      nextDueOn: serializer.fromJson<DateTime?>(json['nextDueOn']),
      notes: serializer.fromJson<String?>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'id': serializer.toJson<String>(id),
      'petId': serializer.toJson<String>(petId),
      'medicationName': serializer.toJson<String>(medicationName),
      'administeredOn': serializer.toJson<DateTime>(administeredOn),
      'nextDueOn': serializer.toJson<DateTime?>(nextDueOn),
      'notes': serializer.toJson<String?>(notes),
      'status': serializer.toJson<String>(status),
    };
  }

  Deworming copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
    String? petId,
    String? medicationName,
    DateTime? administeredOn,
    Value<DateTime?> nextDueOn = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    String? status,
  }) => Deworming(
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    id: id ?? this.id,
    petId: petId ?? this.petId,
    medicationName: medicationName ?? this.medicationName,
    administeredOn: administeredOn ?? this.administeredOn,
    nextDueOn: nextDueOn.present ? nextDueOn.value : this.nextDueOn,
    notes: notes.present ? notes.value : this.notes,
    status: status ?? this.status,
  );
  Deworming copyWithCompanion(DewormingsCompanion data) {
    return Deworming(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      id: data.id.present ? data.id.value : this.id,
      petId: data.petId.present ? data.petId.value : this.petId,
      medicationName:
          data.medicationName.present
              ? data.medicationName.value
              : this.medicationName,
      administeredOn:
          data.administeredOn.present
              ? data.administeredOn.value
              : this.administeredOn,
      nextDueOn: data.nextDueOn.present ? data.nextDueOn.value : this.nextDueOn,
      notes: data.notes.present ? data.notes.value : this.notes,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Deworming(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('medicationName: $medicationName, ')
          ..write('administeredOn: $administeredOn, ')
          ..write('nextDueOn: $nextDueOn, ')
          ..write('notes: $notes, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    updatedAt,
    id,
    petId,
    medicationName,
    administeredOn,
    nextDueOn,
    notes,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Deworming &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.id == this.id &&
          other.petId == this.petId &&
          other.medicationName == this.medicationName &&
          other.administeredOn == this.administeredOn &&
          other.nextDueOn == this.nextDueOn &&
          other.notes == this.notes &&
          other.status == this.status);
}

class DewormingsCompanion extends UpdateCompanion<Deworming> {
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> id;
  final Value<String> petId;
  final Value<String> medicationName;
  final Value<DateTime> administeredOn;
  final Value<DateTime?> nextDueOn;
  final Value<String?> notes;
  final Value<String> status;
  final Value<int> rowid;
  const DewormingsCompanion({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.petId = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.administeredOn = const Value.absent(),
    this.nextDueOn = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DewormingsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required String id,
    required String petId,
    required String medicationName,
    required DateTime administeredOn,
    this.nextDueOn = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       petId = Value(petId),
       medicationName = Value(medicationName),
       administeredOn = Value(administeredOn);
  static Insertable<Deworming> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? id,
    Expression<String>? petId,
    Expression<String>? medicationName,
    Expression<DateTime>? administeredOn,
    Expression<DateTime>? nextDueOn,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (id != null) 'id': id,
      if (petId != null) 'pet_id': petId,
      if (medicationName != null) 'medication_name': medicationName,
      if (administeredOn != null) 'administered_on': administeredOn,
      if (nextDueOn != null) 'next_due_on': nextDueOn,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DewormingsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String>? id,
    Value<String>? petId,
    Value<String>? medicationName,
    Value<DateTime>? administeredOn,
    Value<DateTime?>? nextDueOn,
    Value<String?>? notes,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return DewormingsCompanion(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      petId: petId ?? this.petId,
      medicationName: medicationName ?? this.medicationName,
      administeredOn: administeredOn ?? this.administeredOn,
      nextDueOn: nextDueOn ?? this.nextDueOn,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (petId.present) {
      map['pet_id'] = Variable<String>(petId.value);
    }
    if (medicationName.present) {
      map['medication_name'] = Variable<String>(medicationName.value);
    }
    if (administeredOn.present) {
      map['administered_on'] = Variable<DateTime>(administeredOn.value);
    }
    if (nextDueOn.present) {
      map['next_due_on'] = Variable<DateTime>(nextDueOn.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DewormingsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('id: $id, ')
          ..write('petId: $petId, ')
          ..write('medicationName: $medicationName, ')
          ..write('administeredOn: $administeredOn, ')
          ..write('nextDueOn: $nextDueOn, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FileAssetsTable fileAssets = $FileAssetsTable(this);
  late final $OwnerProfilesTable ownerProfiles = $OwnerProfilesTable(this);
  late final $PetsTable pets = $PetsTable(this);
  late final $VaccinationsTable vaccinations = $VaccinationsTable(this);
  late final $MedicalRecordsTable medicalRecords = $MedicalRecordsTable(this);
  late final $MedicinesTable medicines = $MedicinesTable(this);
  late final $PetMedicationsTable petMedications = $PetMedicationsTable(this);
  late final $MedicationSchedulesTable medicationSchedules =
      $MedicationSchedulesTable(this);
  late final $MedicationAdministrationsTable medicationAdministrations =
      $MedicationAdministrationsTable(this);
  late final $AppointmentsTable appointments = $AppointmentsTable(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $RecordAttachmentsTable recordAttachments =
      $RecordAttachmentsTable(this);
  late final $GrowthEntriesTable growthEntries = $GrowthEntriesTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $ScheduledNotificationsTable scheduledNotifications =
      $ScheduledNotificationsTable(this);
  late final $GeneratedReportsTable generatedReports = $GeneratedReportsTable(
    this,
  );
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $BackupRecordsTable backupRecords = $BackupRecordsTable(this);
  late final $MemoriesTable memories = $MemoriesTable(this);
  late final $DewormingsTable dewormings = $DewormingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    fileAssets,
    ownerProfiles,
    pets,
    vaccinations,
    medicalRecords,
    medicines,
    petMedications,
    medicationSchedules,
    medicationAdministrations,
    appointments,
    documents,
    recordAttachments,
    growthEntries,
    expenses,
    reminders,
    scheduledNotifications,
    generatedReports,
    appSettings,
    backupRecords,
    memories,
    dewormings,
  ];
}

typedef $$FileAssetsTableCreateCompanionBuilder =
    FileAssetsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String relativePath,
      required String originalName,
      required String mimeType,
      required int byteSize,
      required String sha256,
      required String category,
      Value<int> rowid,
    });
typedef $$FileAssetsTableUpdateCompanionBuilder =
    FileAssetsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> relativePath,
      Value<String> originalName,
      Value<String> mimeType,
      Value<int> byteSize,
      Value<String> sha256,
      Value<String> category,
      Value<int> rowid,
    });

class $$FileAssetsTableFilterComposer
    extends Composer<_$AppDatabase, $FileAssetsTable> {
  $$FileAssetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FileAssetsTableOrderingComposer
    extends Composer<_$AppDatabase, $FileAssetsTable> {
  $$FileAssetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mimeType => $composableBuilder(
    column: $table.mimeType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sha256 => $composableBuilder(
    column: $table.sha256,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FileAssetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FileAssetsTable> {
  $$FileAssetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get relativePath => $composableBuilder(
    column: $table.relativePath,
    builder: (column) => column,
  );

  GeneratedColumn<String> get originalName => $composableBuilder(
    column: $table.originalName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get mimeType =>
      $composableBuilder(column: $table.mimeType, builder: (column) => column);

  GeneratedColumn<int> get byteSize =>
      $composableBuilder(column: $table.byteSize, builder: (column) => column);

  GeneratedColumn<String> get sha256 =>
      $composableBuilder(column: $table.sha256, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$FileAssetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FileAssetsTable,
          FileAsset,
          $$FileAssetsTableFilterComposer,
          $$FileAssetsTableOrderingComposer,
          $$FileAssetsTableAnnotationComposer,
          $$FileAssetsTableCreateCompanionBuilder,
          $$FileAssetsTableUpdateCompanionBuilder,
          (
            FileAsset,
            BaseReferences<_$AppDatabase, $FileAssetsTable, FileAsset>,
          ),
          FileAsset,
          PrefetchHooks Function()
        > {
  $$FileAssetsTableTableManager(_$AppDatabase db, $FileAssetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FileAssetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$FileAssetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$FileAssetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> relativePath = const Value.absent(),
                Value<String> originalName = const Value.absent(),
                Value<String> mimeType = const Value.absent(),
                Value<int> byteSize = const Value.absent(),
                Value<String> sha256 = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FileAssetsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                relativePath: relativePath,
                originalName: originalName,
                mimeType: mimeType,
                byteSize: byteSize,
                sha256: sha256,
                category: category,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String relativePath,
                required String originalName,
                required String mimeType,
                required int byteSize,
                required String sha256,
                required String category,
                Value<int> rowid = const Value.absent(),
              }) => FileAssetsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                relativePath: relativePath,
                originalName: originalName,
                mimeType: mimeType,
                byteSize: byteSize,
                sha256: sha256,
                category: category,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FileAssetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FileAssetsTable,
      FileAsset,
      $$FileAssetsTableFilterComposer,
      $$FileAssetsTableOrderingComposer,
      $$FileAssetsTableAnnotationComposer,
      $$FileAssetsTableCreateCompanionBuilder,
      $$FileAssetsTableUpdateCompanionBuilder,
      (FileAsset, BaseReferences<_$AppDatabase, $FileAssetsTable, FileAsset>),
      FileAsset,
      PrefetchHooks Function()
    >;
typedef $$OwnerProfilesTableCreateCompanionBuilder =
    OwnerProfilesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String displayName,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> emergencyContactName,
      Value<String?> emergencyContactPhone,
      Value<String?> photoFileId,
      Value<int> rowid,
    });
typedef $$OwnerProfilesTableUpdateCompanionBuilder =
    OwnerProfilesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> displayName,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> emergencyContactName,
      Value<String?> emergencyContactPhone,
      Value<String?> photoFileId,
      Value<int> rowid,
    });

class $$OwnerProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $OwnerProfilesTable> {
  $$OwnerProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoFileId => $composableBuilder(
    column: $table.photoFileId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OwnerProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $OwnerProfilesTable> {
  $$OwnerProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoFileId => $composableBuilder(
    column: $table.photoFileId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OwnerProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $OwnerProfilesTable> {
  $$OwnerProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoFileId => $composableBuilder(
    column: $table.photoFileId,
    builder: (column) => column,
  );
}

class $$OwnerProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OwnerProfilesTable,
          OwnerProfile,
          $$OwnerProfilesTableFilterComposer,
          $$OwnerProfilesTableOrderingComposer,
          $$OwnerProfilesTableAnnotationComposer,
          $$OwnerProfilesTableCreateCompanionBuilder,
          $$OwnerProfilesTableUpdateCompanionBuilder,
          (
            OwnerProfile,
            BaseReferences<_$AppDatabase, $OwnerProfilesTable, OwnerProfile>,
          ),
          OwnerProfile,
          PrefetchHooks Function()
        > {
  $$OwnerProfilesTableTableManager(_$AppDatabase db, $OwnerProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$OwnerProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$OwnerProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$OwnerProfilesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> emergencyContactName = const Value.absent(),
                Value<String?> emergencyContactPhone = const Value.absent(),
                Value<String?> photoFileId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OwnerProfilesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                displayName: displayName,
                email: email,
                phone: phone,
                address: address,
                emergencyContactName: emergencyContactName,
                emergencyContactPhone: emergencyContactPhone,
                photoFileId: photoFileId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String displayName,
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> emergencyContactName = const Value.absent(),
                Value<String?> emergencyContactPhone = const Value.absent(),
                Value<String?> photoFileId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OwnerProfilesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                displayName: displayName,
                email: email,
                phone: phone,
                address: address,
                emergencyContactName: emergencyContactName,
                emergencyContactPhone: emergencyContactPhone,
                photoFileId: photoFileId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OwnerProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OwnerProfilesTable,
      OwnerProfile,
      $$OwnerProfilesTableFilterComposer,
      $$OwnerProfilesTableOrderingComposer,
      $$OwnerProfilesTableAnnotationComposer,
      $$OwnerProfilesTableCreateCompanionBuilder,
      $$OwnerProfilesTableUpdateCompanionBuilder,
      (
        OwnerProfile,
        BaseReferences<_$AppDatabase, $OwnerProfilesTable, OwnerProfile>,
      ),
      OwnerProfile,
      PrefetchHooks Function()
    >;
typedef $$PetsTableCreateCompanionBuilder =
    PetsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String ownerId,
      required String name,
      required String species,
      Value<String?> breed,
      Value<String?> sex,
      Value<DateTime?> birthDate,
      Value<DateTime?> adoptionDate,
      Value<String?> color,
      Value<String?> microchipNumber,
      Value<String?> bloodType,
      Value<bool?> neutered,
      Value<String?> notes,
      Value<String?> profileFileId,
      Value<String> status,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });
typedef $$PetsTableUpdateCompanionBuilder =
    PetsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> ownerId,
      Value<String> name,
      Value<String> species,
      Value<String?> breed,
      Value<String?> sex,
      Value<DateTime?> birthDate,
      Value<DateTime?> adoptionDate,
      Value<String?> color,
      Value<String?> microchipNumber,
      Value<String?> bloodType,
      Value<bool?> neutered,
      Value<String?> notes,
      Value<String?> profileFileId,
      Value<String> status,
      Value<DateTime?> archivedAt,
      Value<int> rowid,
    });

class $$PetsTableFilterComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get adoptionDate => $composableBuilder(
    column: $table.adoptionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get microchipNumber => $composableBuilder(
    column: $table.microchipNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get neutered => $composableBuilder(
    column: $table.neutered,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileFileId => $composableBuilder(
    column: $table.profileFileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PetsTableOrderingComposer extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get adoptionDate => $composableBuilder(
    column: $table.adoptionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get microchipNumber => $composableBuilder(
    column: $table.microchipNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get neutered => $composableBuilder(
    column: $table.neutered,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileFileId => $composableBuilder(
    column: $table.profileFileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetsTable> {
  $$PetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<DateTime> get adoptionDate => $composableBuilder(
    column: $table.adoptionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get microchipNumber => $composableBuilder(
    column: $table.microchipNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bloodType =>
      $composableBuilder(column: $table.bloodType, builder: (column) => column);

  GeneratedColumn<bool> get neutered =>
      $composableBuilder(column: $table.neutered, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get profileFileId => $composableBuilder(
    column: $table.profileFileId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );
}

class $$PetsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PetsTable,
          Pet,
          $$PetsTableFilterComposer,
          $$PetsTableOrderingComposer,
          $$PetsTableAnnotationComposer,
          $$PetsTableCreateCompanionBuilder,
          $$PetsTableUpdateCompanionBuilder,
          (Pet, BaseReferences<_$AppDatabase, $PetsTable, Pet>),
          Pet,
          PrefetchHooks Function()
        > {
  $$PetsTableTableManager(_$AppDatabase db, $PetsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<String?> breed = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<DateTime?> adoptionDate = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> microchipNumber = const Value.absent(),
                Value<String?> bloodType = const Value.absent(),
                Value<bool?> neutered = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> profileFileId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                ownerId: ownerId,
                name: name,
                species: species,
                breed: breed,
                sex: sex,
                birthDate: birthDate,
                adoptionDate: adoptionDate,
                color: color,
                microchipNumber: microchipNumber,
                bloodType: bloodType,
                neutered: neutered,
                notes: notes,
                profileFileId: profileFileId,
                status: status,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String ownerId,
                required String name,
                required String species,
                Value<String?> breed = const Value.absent(),
                Value<String?> sex = const Value.absent(),
                Value<DateTime?> birthDate = const Value.absent(),
                Value<DateTime?> adoptionDate = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<String?> microchipNumber = const Value.absent(),
                Value<String?> bloodType = const Value.absent(),
                Value<bool?> neutered = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> profileFileId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> archivedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                ownerId: ownerId,
                name: name,
                species: species,
                breed: breed,
                sex: sex,
                birthDate: birthDate,
                adoptionDate: adoptionDate,
                color: color,
                microchipNumber: microchipNumber,
                bloodType: bloodType,
                neutered: neutered,
                notes: notes,
                profileFileId: profileFileId,
                status: status,
                archivedAt: archivedAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PetsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PetsTable,
      Pet,
      $$PetsTableFilterComposer,
      $$PetsTableOrderingComposer,
      $$PetsTableAnnotationComposer,
      $$PetsTableCreateCompanionBuilder,
      $$PetsTableUpdateCompanionBuilder,
      (Pet, BaseReferences<_$AppDatabase, $PetsTable, Pet>),
      Pet,
      PrefetchHooks Function()
    >;
typedef $$VaccinationsTableCreateCompanionBuilder =
    VaccinationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petId,
      required String vaccineName,
      Value<String?> disease,
      Value<String?> manufacturer,
      Value<String?> batchNumber,
      Value<int?> doseNumber,
      required DateTime administeredOn,
      Value<DateTime?> nextDueOn,
      Value<String?> veterinarian,
      Value<String?> clinic,
      Value<String?> notes,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$VaccinationsTableUpdateCompanionBuilder =
    VaccinationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petId,
      Value<String> vaccineName,
      Value<String?> disease,
      Value<String?> manufacturer,
      Value<String?> batchNumber,
      Value<int?> doseNumber,
      Value<DateTime> administeredOn,
      Value<DateTime?> nextDueOn,
      Value<String?> veterinarian,
      Value<String?> clinic,
      Value<String?> notes,
      Value<String> status,
      Value<int> rowid,
    });

class $$VaccinationsTableFilterComposer
    extends Composer<_$AppDatabase, $VaccinationsTable> {
  $$VaccinationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get disease => $composableBuilder(
    column: $table.disease,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get doseNumber => $composableBuilder(
    column: $table.doseNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get administeredOn => $composableBuilder(
    column: $table.administeredOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDueOn => $composableBuilder(
    column: $table.nextDueOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get veterinarian => $composableBuilder(
    column: $table.veterinarian,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clinic => $composableBuilder(
    column: $table.clinic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VaccinationsTableOrderingComposer
    extends Composer<_$AppDatabase, $VaccinationsTable> {
  $$VaccinationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get disease => $composableBuilder(
    column: $table.disease,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get doseNumber => $composableBuilder(
    column: $table.doseNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get administeredOn => $composableBuilder(
    column: $table.administeredOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDueOn => $composableBuilder(
    column: $table.nextDueOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get veterinarian => $composableBuilder(
    column: $table.veterinarian,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clinic => $composableBuilder(
    column: $table.clinic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VaccinationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VaccinationsTable> {
  $$VaccinationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get vaccineName => $composableBuilder(
    column: $table.vaccineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get disease =>
      $composableBuilder(column: $table.disease, builder: (column) => column);

  GeneratedColumn<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => column,
  );

  GeneratedColumn<String> get batchNumber => $composableBuilder(
    column: $table.batchNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get doseNumber => $composableBuilder(
    column: $table.doseNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get administeredOn => $composableBuilder(
    column: $table.administeredOn,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextDueOn =>
      $composableBuilder(column: $table.nextDueOn, builder: (column) => column);

  GeneratedColumn<String> get veterinarian => $composableBuilder(
    column: $table.veterinarian,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clinic =>
      $composableBuilder(column: $table.clinic, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$VaccinationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VaccinationsTable,
          Vaccination,
          $$VaccinationsTableFilterComposer,
          $$VaccinationsTableOrderingComposer,
          $$VaccinationsTableAnnotationComposer,
          $$VaccinationsTableCreateCompanionBuilder,
          $$VaccinationsTableUpdateCompanionBuilder,
          (
            Vaccination,
            BaseReferences<_$AppDatabase, $VaccinationsTable, Vaccination>,
          ),
          Vaccination,
          PrefetchHooks Function()
        > {
  $$VaccinationsTableTableManager(_$AppDatabase db, $VaccinationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$VaccinationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$VaccinationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$VaccinationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> vaccineName = const Value.absent(),
                Value<String?> disease = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> batchNumber = const Value.absent(),
                Value<int?> doseNumber = const Value.absent(),
                Value<DateTime> administeredOn = const Value.absent(),
                Value<DateTime?> nextDueOn = const Value.absent(),
                Value<String?> veterinarian = const Value.absent(),
                Value<String?> clinic = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VaccinationsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                vaccineName: vaccineName,
                disease: disease,
                manufacturer: manufacturer,
                batchNumber: batchNumber,
                doseNumber: doseNumber,
                administeredOn: administeredOn,
                nextDueOn: nextDueOn,
                veterinarian: veterinarian,
                clinic: clinic,
                notes: notes,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petId,
                required String vaccineName,
                Value<String?> disease = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> batchNumber = const Value.absent(),
                Value<int?> doseNumber = const Value.absent(),
                required DateTime administeredOn,
                Value<DateTime?> nextDueOn = const Value.absent(),
                Value<String?> veterinarian = const Value.absent(),
                Value<String?> clinic = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VaccinationsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                vaccineName: vaccineName,
                disease: disease,
                manufacturer: manufacturer,
                batchNumber: batchNumber,
                doseNumber: doseNumber,
                administeredOn: administeredOn,
                nextDueOn: nextDueOn,
                veterinarian: veterinarian,
                clinic: clinic,
                notes: notes,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VaccinationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VaccinationsTable,
      Vaccination,
      $$VaccinationsTableFilterComposer,
      $$VaccinationsTableOrderingComposer,
      $$VaccinationsTableAnnotationComposer,
      $$VaccinationsTableCreateCompanionBuilder,
      $$VaccinationsTableUpdateCompanionBuilder,
      (
        Vaccination,
        BaseReferences<_$AppDatabase, $VaccinationsTable, Vaccination>,
      ),
      Vaccination,
      PrefetchHooks Function()
    >;
typedef $$MedicalRecordsTableCreateCompanionBuilder =
    MedicalRecordsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petId,
      required String recordType,
      required DateTime occurredOn,
      required String title,
      Value<String?> symptoms,
      Value<String?> diagnosis,
      Value<String?> treatment,
      Value<String?> veterinarian,
      Value<String?> clinic,
      Value<DateTime?> followUpOn,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$MedicalRecordsTableUpdateCompanionBuilder =
    MedicalRecordsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petId,
      Value<String> recordType,
      Value<DateTime> occurredOn,
      Value<String> title,
      Value<String?> symptoms,
      Value<String?> diagnosis,
      Value<String?> treatment,
      Value<String?> veterinarian,
      Value<String?> clinic,
      Value<DateTime?> followUpOn,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$MedicalRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicalRecordsTable> {
  $$MedicalRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symptoms => $composableBuilder(
    column: $table.symptoms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diagnosis => $composableBuilder(
    column: $table.diagnosis,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get treatment => $composableBuilder(
    column: $table.treatment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get veterinarian => $composableBuilder(
    column: $table.veterinarian,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clinic => $composableBuilder(
    column: $table.clinic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get followUpOn => $composableBuilder(
    column: $table.followUpOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedicalRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicalRecordsTable> {
  $$MedicalRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symptoms => $composableBuilder(
    column: $table.symptoms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diagnosis => $composableBuilder(
    column: $table.diagnosis,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get treatment => $composableBuilder(
    column: $table.treatment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get veterinarian => $composableBuilder(
    column: $table.veterinarian,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clinic => $composableBuilder(
    column: $table.clinic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get followUpOn => $composableBuilder(
    column: $table.followUpOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicalRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicalRecordsTable> {
  $$MedicalRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get recordType => $composableBuilder(
    column: $table.recordType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get symptoms =>
      $composableBuilder(column: $table.symptoms, builder: (column) => column);

  GeneratedColumn<String> get diagnosis =>
      $composableBuilder(column: $table.diagnosis, builder: (column) => column);

  GeneratedColumn<String> get treatment =>
      $composableBuilder(column: $table.treatment, builder: (column) => column);

  GeneratedColumn<String> get veterinarian => $composableBuilder(
    column: $table.veterinarian,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clinic =>
      $composableBuilder(column: $table.clinic, builder: (column) => column);

  GeneratedColumn<DateTime> get followUpOn => $composableBuilder(
    column: $table.followUpOn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$MedicalRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicalRecordsTable,
          MedicalRecord,
          $$MedicalRecordsTableFilterComposer,
          $$MedicalRecordsTableOrderingComposer,
          $$MedicalRecordsTableAnnotationComposer,
          $$MedicalRecordsTableCreateCompanionBuilder,
          $$MedicalRecordsTableUpdateCompanionBuilder,
          (
            MedicalRecord,
            BaseReferences<_$AppDatabase, $MedicalRecordsTable, MedicalRecord>,
          ),
          MedicalRecord,
          PrefetchHooks Function()
        > {
  $$MedicalRecordsTableTableManager(
    _$AppDatabase db,
    $MedicalRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MedicalRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$MedicalRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$MedicalRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> recordType = const Value.absent(),
                Value<DateTime> occurredOn = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> symptoms = const Value.absent(),
                Value<String?> diagnosis = const Value.absent(),
                Value<String?> treatment = const Value.absent(),
                Value<String?> veterinarian = const Value.absent(),
                Value<String?> clinic = const Value.absent(),
                Value<DateTime?> followUpOn = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicalRecordsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                recordType: recordType,
                occurredOn: occurredOn,
                title: title,
                symptoms: symptoms,
                diagnosis: diagnosis,
                treatment: treatment,
                veterinarian: veterinarian,
                clinic: clinic,
                followUpOn: followUpOn,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petId,
                required String recordType,
                required DateTime occurredOn,
                required String title,
                Value<String?> symptoms = const Value.absent(),
                Value<String?> diagnosis = const Value.absent(),
                Value<String?> treatment = const Value.absent(),
                Value<String?> veterinarian = const Value.absent(),
                Value<String?> clinic = const Value.absent(),
                Value<DateTime?> followUpOn = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicalRecordsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                recordType: recordType,
                occurredOn: occurredOn,
                title: title,
                symptoms: symptoms,
                diagnosis: diagnosis,
                treatment: treatment,
                veterinarian: veterinarian,
                clinic: clinic,
                followUpOn: followUpOn,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedicalRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicalRecordsTable,
      MedicalRecord,
      $$MedicalRecordsTableFilterComposer,
      $$MedicalRecordsTableOrderingComposer,
      $$MedicalRecordsTableAnnotationComposer,
      $$MedicalRecordsTableCreateCompanionBuilder,
      $$MedicalRecordsTableUpdateCompanionBuilder,
      (
        MedicalRecord,
        BaseReferences<_$AppDatabase, $MedicalRecordsTable, MedicalRecord>,
      ),
      MedicalRecord,
      PrefetchHooks Function()
    >;
typedef $$MedicinesTableCreateCompanionBuilder =
    MedicinesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String name,
      Value<String?> form,
      Value<String?> strength,
      Value<String?> manufacturer,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$MedicinesTableUpdateCompanionBuilder =
    MedicinesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> name,
      Value<String?> form,
      Value<String?> strength,
      Value<String?> manufacturer,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$MedicinesTableFilterComposer
    extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get form => $composableBuilder(
    column: $table.form,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedicinesTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get form => $composableBuilder(
    column: $table.form,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get strength => $composableBuilder(
    column: $table.strength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicinesTable> {
  $$MedicinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get form =>
      $composableBuilder(column: $table.form, builder: (column) => column);

  GeneratedColumn<String> get strength =>
      $composableBuilder(column: $table.strength, builder: (column) => column);

  GeneratedColumn<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$MedicinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicinesTable,
          Medicine,
          $$MedicinesTableFilterComposer,
          $$MedicinesTableOrderingComposer,
          $$MedicinesTableAnnotationComposer,
          $$MedicinesTableCreateCompanionBuilder,
          $$MedicinesTableUpdateCompanionBuilder,
          (Medicine, BaseReferences<_$AppDatabase, $MedicinesTable, Medicine>),
          Medicine,
          PrefetchHooks Function()
        > {
  $$MedicinesTableTableManager(_$AppDatabase db, $MedicinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MedicinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$MedicinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$MedicinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> form = const Value.absent(),
                Value<String?> strength = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicinesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                name: name,
                form: form,
                strength: strength,
                manufacturer: manufacturer,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String name,
                Value<String?> form = const Value.absent(),
                Value<String?> strength = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicinesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                name: name,
                form: form,
                strength: strength,
                manufacturer: manufacturer,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedicinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicinesTable,
      Medicine,
      $$MedicinesTableFilterComposer,
      $$MedicinesTableOrderingComposer,
      $$MedicinesTableAnnotationComposer,
      $$MedicinesTableCreateCompanionBuilder,
      $$MedicinesTableUpdateCompanionBuilder,
      (Medicine, BaseReferences<_$AppDatabase, $MedicinesTable, Medicine>),
      Medicine,
      PrefetchHooks Function()
    >;
typedef $$PetMedicationsTableCreateCompanionBuilder =
    PetMedicationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petId,
      required String medicineId,
      required String dosage,
      Value<String?> route,
      Value<String?> instructions,
      Value<String?> prescribedBy,
      required DateTime startDate,
      Value<DateTime?> endDate,
      Value<bool> asNeeded,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$PetMedicationsTableUpdateCompanionBuilder =
    PetMedicationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petId,
      Value<String> medicineId,
      Value<String> dosage,
      Value<String?> route,
      Value<String?> instructions,
      Value<String?> prescribedBy,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<bool> asNeeded,
      Value<String> status,
      Value<int> rowid,
    });

class $$PetMedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $PetMedicationsTable> {
  $$PetMedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicineId => $composableBuilder(
    column: $table.medicineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get asNeeded => $composableBuilder(
    column: $table.asNeeded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PetMedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PetMedicationsTable> {
  $$PetMedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicineId => $composableBuilder(
    column: $table.medicineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get asNeeded => $composableBuilder(
    column: $table.asNeeded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PetMedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetMedicationsTable> {
  $$PetMedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get medicineId => $composableBuilder(
    column: $table.medicineId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<String> get route =>
      $composableBuilder(column: $table.route, builder: (column) => column);

  GeneratedColumn<String> get instructions => $composableBuilder(
    column: $table.instructions,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get asNeeded =>
      $composableBuilder(column: $table.asNeeded, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$PetMedicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PetMedicationsTable,
          PetMedication,
          $$PetMedicationsTableFilterComposer,
          $$PetMedicationsTableOrderingComposer,
          $$PetMedicationsTableAnnotationComposer,
          $$PetMedicationsTableCreateCompanionBuilder,
          $$PetMedicationsTableUpdateCompanionBuilder,
          (
            PetMedication,
            BaseReferences<_$AppDatabase, $PetMedicationsTable, PetMedication>,
          ),
          PetMedication,
          PrefetchHooks Function()
        > {
  $$PetMedicationsTableTableManager(
    _$AppDatabase db,
    $PetMedicationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PetMedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$PetMedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PetMedicationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> medicineId = const Value.absent(),
                Value<String> dosage = const Value.absent(),
                Value<String?> route = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<String?> prescribedBy = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool> asNeeded = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetMedicationsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                medicineId: medicineId,
                dosage: dosage,
                route: route,
                instructions: instructions,
                prescribedBy: prescribedBy,
                startDate: startDate,
                endDate: endDate,
                asNeeded: asNeeded,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petId,
                required String medicineId,
                required String dosage,
                Value<String?> route = const Value.absent(),
                Value<String?> instructions = const Value.absent(),
                Value<String?> prescribedBy = const Value.absent(),
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                Value<bool> asNeeded = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PetMedicationsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                medicineId: medicineId,
                dosage: dosage,
                route: route,
                instructions: instructions,
                prescribedBy: prescribedBy,
                startDate: startDate,
                endDate: endDate,
                asNeeded: asNeeded,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PetMedicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PetMedicationsTable,
      PetMedication,
      $$PetMedicationsTableFilterComposer,
      $$PetMedicationsTableOrderingComposer,
      $$PetMedicationsTableAnnotationComposer,
      $$PetMedicationsTableCreateCompanionBuilder,
      $$PetMedicationsTableUpdateCompanionBuilder,
      (
        PetMedication,
        BaseReferences<_$AppDatabase, $PetMedicationsTable, PetMedication>,
      ),
      PetMedication,
      PrefetchHooks Function()
    >;
typedef $$MedicationSchedulesTableCreateCompanionBuilder =
    MedicationSchedulesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petMedicationId,
      required String localTime,
      required String timezoneId,
      required String recurrenceRule,
      Value<int> rowid,
    });
typedef $$MedicationSchedulesTableUpdateCompanionBuilder =
    MedicationSchedulesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petMedicationId,
      Value<String> localTime,
      Value<String> timezoneId,
      Value<String> recurrenceRule,
      Value<int> rowid,
    });

class $$MedicationSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationSchedulesTable> {
  $$MedicationSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petMedicationId => $composableBuilder(
    column: $table.petMedicationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localTime => $composableBuilder(
    column: $table.localTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedicationSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationSchedulesTable> {
  $$MedicationSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petMedicationId => $composableBuilder(
    column: $table.petMedicationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localTime => $composableBuilder(
    column: $table.localTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicationSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationSchedulesTable> {
  $$MedicationSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petMedicationId => $composableBuilder(
    column: $table.petMedicationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localTime =>
      $composableBuilder(column: $table.localTime, builder: (column) => column);

  GeneratedColumn<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => column,
  );
}

class $$MedicationSchedulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationSchedulesTable,
          MedicationSchedule,
          $$MedicationSchedulesTableFilterComposer,
          $$MedicationSchedulesTableOrderingComposer,
          $$MedicationSchedulesTableAnnotationComposer,
          $$MedicationSchedulesTableCreateCompanionBuilder,
          $$MedicationSchedulesTableUpdateCompanionBuilder,
          (
            MedicationSchedule,
            BaseReferences<
              _$AppDatabase,
              $MedicationSchedulesTable,
              MedicationSchedule
            >,
          ),
          MedicationSchedule,
          PrefetchHooks Function()
        > {
  $$MedicationSchedulesTableTableManager(
    _$AppDatabase db,
    $MedicationSchedulesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MedicationSchedulesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$MedicationSchedulesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$MedicationSchedulesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petMedicationId = const Value.absent(),
                Value<String> localTime = const Value.absent(),
                Value<String> timezoneId = const Value.absent(),
                Value<String> recurrenceRule = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationSchedulesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petMedicationId: petMedicationId,
                localTime: localTime,
                timezoneId: timezoneId,
                recurrenceRule: recurrenceRule,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petMedicationId,
                required String localTime,
                required String timezoneId,
                required String recurrenceRule,
                Value<int> rowid = const Value.absent(),
              }) => MedicationSchedulesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petMedicationId: petMedicationId,
                localTime: localTime,
                timezoneId: timezoneId,
                recurrenceRule: recurrenceRule,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedicationSchedulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationSchedulesTable,
      MedicationSchedule,
      $$MedicationSchedulesTableFilterComposer,
      $$MedicationSchedulesTableOrderingComposer,
      $$MedicationSchedulesTableAnnotationComposer,
      $$MedicationSchedulesTableCreateCompanionBuilder,
      $$MedicationSchedulesTableUpdateCompanionBuilder,
      (
        MedicationSchedule,
        BaseReferences<
          _$AppDatabase,
          $MedicationSchedulesTable,
          MedicationSchedule
        >,
      ),
      MedicationSchedule,
      PrefetchHooks Function()
    >;
typedef $$MedicationAdministrationsTableCreateCompanionBuilder =
    MedicationAdministrationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petMedicationId,
      Value<DateTime?> scheduledFor,
      Value<DateTime?> administeredAt,
      required String state,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$MedicationAdministrationsTableUpdateCompanionBuilder =
    MedicationAdministrationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petMedicationId,
      Value<DateTime?> scheduledFor,
      Value<DateTime?> administeredAt,
      Value<String> state,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$MedicationAdministrationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationAdministrationsTable> {
  $$MedicationAdministrationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petMedicationId => $composableBuilder(
    column: $table.petMedicationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get administeredAt => $composableBuilder(
    column: $table.administeredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedicationAdministrationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationAdministrationsTable> {
  $$MedicationAdministrationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petMedicationId => $composableBuilder(
    column: $table.petMedicationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get administeredAt => $composableBuilder(
    column: $table.administeredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicationAdministrationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationAdministrationsTable> {
  $$MedicationAdministrationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petMedicationId => $composableBuilder(
    column: $table.petMedicationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get administeredAt => $composableBuilder(
    column: $table.administeredAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$MedicationAdministrationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationAdministrationsTable,
          MedicationAdministration,
          $$MedicationAdministrationsTableFilterComposer,
          $$MedicationAdministrationsTableOrderingComposer,
          $$MedicationAdministrationsTableAnnotationComposer,
          $$MedicationAdministrationsTableCreateCompanionBuilder,
          $$MedicationAdministrationsTableUpdateCompanionBuilder,
          (
            MedicationAdministration,
            BaseReferences<
              _$AppDatabase,
              $MedicationAdministrationsTable,
              MedicationAdministration
            >,
          ),
          MedicationAdministration,
          PrefetchHooks Function()
        > {
  $$MedicationAdministrationsTableTableManager(
    _$AppDatabase db,
    $MedicationAdministrationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MedicationAdministrationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$MedicationAdministrationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$MedicationAdministrationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petMedicationId = const Value.absent(),
                Value<DateTime?> scheduledFor = const Value.absent(),
                Value<DateTime?> administeredAt = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationAdministrationsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petMedicationId: petMedicationId,
                scheduledFor: scheduledFor,
                administeredAt: administeredAt,
                state: state,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petMedicationId,
                Value<DateTime?> scheduledFor = const Value.absent(),
                Value<DateTime?> administeredAt = const Value.absent(),
                required String state,
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationAdministrationsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petMedicationId: petMedicationId,
                scheduledFor: scheduledFor,
                administeredAt: administeredAt,
                state: state,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedicationAdministrationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationAdministrationsTable,
      MedicationAdministration,
      $$MedicationAdministrationsTableFilterComposer,
      $$MedicationAdministrationsTableOrderingComposer,
      $$MedicationAdministrationsTableAnnotationComposer,
      $$MedicationAdministrationsTableCreateCompanionBuilder,
      $$MedicationAdministrationsTableUpdateCompanionBuilder,
      (
        MedicationAdministration,
        BaseReferences<
          _$AppDatabase,
          $MedicationAdministrationsTable,
          MedicationAdministration
        >,
      ),
      MedicationAdministration,
      PrefetchHooks Function()
    >;
typedef $$AppointmentsTableCreateCompanionBuilder =
    AppointmentsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petId,
      required String title,
      required String appointmentType,
      required DateTime startsAt,
      required String timezoneId,
      Value<int?> durationMinutes,
      Value<String?> providerName,
      Value<String?> location,
      Value<String?> notes,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$AppointmentsTableUpdateCompanionBuilder =
    AppointmentsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petId,
      Value<String> title,
      Value<String> appointmentType,
      Value<DateTime> startsAt,
      Value<String> timezoneId,
      Value<int?> durationMinutes,
      Value<String?> providerName,
      Value<String?> location,
      Value<String?> notes,
      Value<String> status,
      Value<int> rowid,
    });

class $$AppointmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get appointmentType => $composableBuilder(
    column: $table.appointmentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startsAt => $composableBuilder(
    column: $table.startsAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppointmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get appointmentType => $composableBuilder(
    column: $table.appointmentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startsAt => $composableBuilder(
    column: $table.startsAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppointmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get appointmentType => $composableBuilder(
    column: $table.appointmentType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startsAt =>
      $composableBuilder(column: $table.startsAt, builder: (column) => column);

  GeneratedColumn<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$AppointmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppointmentsTable,
          Appointment,
          $$AppointmentsTableFilterComposer,
          $$AppointmentsTableOrderingComposer,
          $$AppointmentsTableAnnotationComposer,
          $$AppointmentsTableCreateCompanionBuilder,
          $$AppointmentsTableUpdateCompanionBuilder,
          (
            Appointment,
            BaseReferences<_$AppDatabase, $AppointmentsTable, Appointment>,
          ),
          Appointment,
          PrefetchHooks Function()
        > {
  $$AppointmentsTableTableManager(_$AppDatabase db, $AppointmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AppointmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AppointmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$AppointmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> appointmentType = const Value.absent(),
                Value<DateTime> startsAt = const Value.absent(),
                Value<String> timezoneId = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> providerName = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppointmentsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                title: title,
                appointmentType: appointmentType,
                startsAt: startsAt,
                timezoneId: timezoneId,
                durationMinutes: durationMinutes,
                providerName: providerName,
                location: location,
                notes: notes,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petId,
                required String title,
                required String appointmentType,
                required DateTime startsAt,
                required String timezoneId,
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> providerName = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppointmentsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                title: title,
                appointmentType: appointmentType,
                startsAt: startsAt,
                timezoneId: timezoneId,
                durationMinutes: durationMinutes,
                providerName: providerName,
                location: location,
                notes: notes,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppointmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppointmentsTable,
      Appointment,
      $$AppointmentsTableFilterComposer,
      $$AppointmentsTableOrderingComposer,
      $$AppointmentsTableAnnotationComposer,
      $$AppointmentsTableCreateCompanionBuilder,
      $$AppointmentsTableUpdateCompanionBuilder,
      (
        Appointment,
        BaseReferences<_$AppDatabase, $AppointmentsTable, Appointment>,
      ),
      Appointment,
      PrefetchHooks Function()
    >;
typedef $$DocumentsTableCreateCompanionBuilder =
    DocumentsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      Value<String?> petId,
      required String fileId,
      required String title,
      required String documentType,
      Value<DateTime?> issuedOn,
      Value<DateTime?> expiresOn,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$DocumentsTableUpdateCompanionBuilder =
    DocumentsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String?> petId,
      Value<String> fileId,
      Value<String> title,
      Value<String> documentType,
      Value<DateTime?> issuedOn,
      Value<DateTime?> expiresOn,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileId => $composableBuilder(
    column: $table.fileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get issuedOn => $composableBuilder(
    column: $table.issuedOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresOn => $composableBuilder(
    column: $table.expiresOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileId => $composableBuilder(
    column: $table.fileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get issuedOn => $composableBuilder(
    column: $table.issuedOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresOn => $composableBuilder(
    column: $table.expiresOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get fileId =>
      $composableBuilder(column: $table.fileId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get documentType => $composableBuilder(
    column: $table.documentType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get issuedOn =>
      $composableBuilder(column: $table.issuedOn, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresOn =>
      $composableBuilder(column: $table.expiresOn, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$DocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentsTable,
          Document,
          $$DocumentsTableFilterComposer,
          $$DocumentsTableOrderingComposer,
          $$DocumentsTableAnnotationComposer,
          $$DocumentsTableCreateCompanionBuilder,
          $$DocumentsTableUpdateCompanionBuilder,
          (Document, BaseReferences<_$AppDatabase, $DocumentsTable, Document>),
          Document,
          PrefetchHooks Function()
        > {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String?> petId = const Value.absent(),
                Value<String> fileId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> documentType = const Value.absent(),
                Value<DateTime?> issuedOn = const Value.absent(),
                Value<DateTime?> expiresOn = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                fileId: fileId,
                title: title,
                documentType: documentType,
                issuedOn: issuedOn,
                expiresOn: expiresOn,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                Value<String?> petId = const Value.absent(),
                required String fileId,
                required String title,
                required String documentType,
                Value<DateTime?> issuedOn = const Value.absent(),
                Value<DateTime?> expiresOn = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                fileId: fileId,
                title: title,
                documentType: documentType,
                issuedOn: issuedOn,
                expiresOn: expiresOn,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentsTable,
      Document,
      $$DocumentsTableFilterComposer,
      $$DocumentsTableOrderingComposer,
      $$DocumentsTableAnnotationComposer,
      $$DocumentsTableCreateCompanionBuilder,
      $$DocumentsTableUpdateCompanionBuilder,
      (Document, BaseReferences<_$AppDatabase, $DocumentsTable, Document>),
      Document,
      PrefetchHooks Function()
    >;
typedef $$RecordAttachmentsTableCreateCompanionBuilder =
    RecordAttachmentsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String fileId,
      required String entityType,
      required String entityId,
      Value<String?> caption,
      Value<int> rowid,
    });
typedef $$RecordAttachmentsTableUpdateCompanionBuilder =
    RecordAttachmentsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> fileId,
      Value<String> entityType,
      Value<String> entityId,
      Value<String?> caption,
      Value<int> rowid,
    });

class $$RecordAttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $RecordAttachmentsTable> {
  $$RecordAttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileId => $composableBuilder(
    column: $table.fileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RecordAttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecordAttachmentsTable> {
  $$RecordAttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileId => $composableBuilder(
    column: $table.fileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecordAttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecordAttachmentsTable> {
  $$RecordAttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fileId =>
      $composableBuilder(column: $table.fileId, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get caption =>
      $composableBuilder(column: $table.caption, builder: (column) => column);
}

class $$RecordAttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecordAttachmentsTable,
          RecordAttachment,
          $$RecordAttachmentsTableFilterComposer,
          $$RecordAttachmentsTableOrderingComposer,
          $$RecordAttachmentsTableAnnotationComposer,
          $$RecordAttachmentsTableCreateCompanionBuilder,
          $$RecordAttachmentsTableUpdateCompanionBuilder,
          (
            RecordAttachment,
            BaseReferences<
              _$AppDatabase,
              $RecordAttachmentsTable,
              RecordAttachment
            >,
          ),
          RecordAttachment,
          PrefetchHooks Function()
        > {
  $$RecordAttachmentsTableTableManager(
    _$AppDatabase db,
    $RecordAttachmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RecordAttachmentsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$RecordAttachmentsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$RecordAttachmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> fileId = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<String> entityId = const Value.absent(),
                Value<String?> caption = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecordAttachmentsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                fileId: fileId,
                entityType: entityType,
                entityId: entityId,
                caption: caption,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String fileId,
                required String entityType,
                required String entityId,
                Value<String?> caption = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecordAttachmentsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                fileId: fileId,
                entityType: entityType,
                entityId: entityId,
                caption: caption,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RecordAttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecordAttachmentsTable,
      RecordAttachment,
      $$RecordAttachmentsTableFilterComposer,
      $$RecordAttachmentsTableOrderingComposer,
      $$RecordAttachmentsTableAnnotationComposer,
      $$RecordAttachmentsTableCreateCompanionBuilder,
      $$RecordAttachmentsTableUpdateCompanionBuilder,
      (
        RecordAttachment,
        BaseReferences<
          _$AppDatabase,
          $RecordAttachmentsTable,
          RecordAttachment
        >,
      ),
      RecordAttachment,
      PrefetchHooks Function()
    >;
typedef $$GrowthEntriesTableCreateCompanionBuilder =
    GrowthEntriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petId,
      required DateTime measuredAt,
      required int weightGrams,
      Value<double?> bodyConditionScore,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$GrowthEntriesTableUpdateCompanionBuilder =
    GrowthEntriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petId,
      Value<DateTime> measuredAt,
      Value<int> weightGrams,
      Value<double?> bodyConditionScore,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$GrowthEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $GrowthEntriesTable> {
  $$GrowthEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weightGrams => $composableBuilder(
    column: $table.weightGrams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bodyConditionScore => $composableBuilder(
    column: $table.bodyConditionScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GrowthEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $GrowthEntriesTable> {
  $$GrowthEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weightGrams => $composableBuilder(
    column: $table.weightGrams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bodyConditionScore => $composableBuilder(
    column: $table.bodyConditionScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GrowthEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GrowthEntriesTable> {
  $$GrowthEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<DateTime> get measuredAt => $composableBuilder(
    column: $table.measuredAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weightGrams => $composableBuilder(
    column: $table.weightGrams,
    builder: (column) => column,
  );

  GeneratedColumn<double> get bodyConditionScore => $composableBuilder(
    column: $table.bodyConditionScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$GrowthEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GrowthEntriesTable,
          GrowthEntry,
          $$GrowthEntriesTableFilterComposer,
          $$GrowthEntriesTableOrderingComposer,
          $$GrowthEntriesTableAnnotationComposer,
          $$GrowthEntriesTableCreateCompanionBuilder,
          $$GrowthEntriesTableUpdateCompanionBuilder,
          (
            GrowthEntry,
            BaseReferences<_$AppDatabase, $GrowthEntriesTable, GrowthEntry>,
          ),
          GrowthEntry,
          PrefetchHooks Function()
        > {
  $$GrowthEntriesTableTableManager(_$AppDatabase db, $GrowthEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$GrowthEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$GrowthEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$GrowthEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<DateTime> measuredAt = const Value.absent(),
                Value<int> weightGrams = const Value.absent(),
                Value<double?> bodyConditionScore = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GrowthEntriesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                measuredAt: measuredAt,
                weightGrams: weightGrams,
                bodyConditionScore: bodyConditionScore,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petId,
                required DateTime measuredAt,
                required int weightGrams,
                Value<double?> bodyConditionScore = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GrowthEntriesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                measuredAt: measuredAt,
                weightGrams: weightGrams,
                bodyConditionScore: bodyConditionScore,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GrowthEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GrowthEntriesTable,
      GrowthEntry,
      $$GrowthEntriesTableFilterComposer,
      $$GrowthEntriesTableOrderingComposer,
      $$GrowthEntriesTableAnnotationComposer,
      $$GrowthEntriesTableCreateCompanionBuilder,
      $$GrowthEntriesTableUpdateCompanionBuilder,
      (
        GrowthEntry,
        BaseReferences<_$AppDatabase, $GrowthEntriesTable, GrowthEntry>,
      ),
      GrowthEntry,
      PrefetchHooks Function()
    >;
typedef $$ExpensesTableCreateCompanionBuilder =
    ExpensesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      Value<String?> petId,
      required String category,
      required int amountMinor,
      required String currencyCode,
      required DateTime occurredOn,
      Value<String?> merchant,
      Value<String?> paymentMethod,
      Value<String?> receiptFileId,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ExpensesTableUpdateCompanionBuilder =
    ExpensesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String?> petId,
      Value<String> category,
      Value<int> amountMinor,
      Value<String> currencyCode,
      Value<DateTime> occurredOn,
      Value<String?> merchant,
      Value<String?> paymentMethod,
      Value<String?> receiptFileId,
      Value<String?> notes,
      Value<int> rowid,
    });

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get merchant => $composableBuilder(
    column: $table.merchant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptFileId => $composableBuilder(
    column: $table.receiptFileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get merchant => $composableBuilder(
    column: $table.merchant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptFileId => $composableBuilder(
    column: $table.receiptFileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
    column: $table.amountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get occurredOn => $composableBuilder(
    column: $table.occurredOn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get merchant =>
      $composableBuilder(column: $table.merchant, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receiptFileId => $composableBuilder(
    column: $table.receiptFileId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$ExpensesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpensesTable,
          Expense,
          $$ExpensesTableFilterComposer,
          $$ExpensesTableOrderingComposer,
          $$ExpensesTableAnnotationComposer,
          $$ExpensesTableCreateCompanionBuilder,
          $$ExpensesTableUpdateCompanionBuilder,
          (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
          Expense,
          PrefetchHooks Function()
        > {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String?> petId = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> amountMinor = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<DateTime> occurredOn = const Value.absent(),
                Value<String?> merchant = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<String?> receiptFileId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                category: category,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                occurredOn: occurredOn,
                merchant: merchant,
                paymentMethod: paymentMethod,
                receiptFileId: receiptFileId,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                Value<String?> petId = const Value.absent(),
                required String category,
                required int amountMinor,
                required String currencyCode,
                required DateTime occurredOn,
                Value<String?> merchant = const Value.absent(),
                Value<String?> paymentMethod = const Value.absent(),
                Value<String?> receiptFileId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpensesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                category: category,
                amountMinor: amountMinor,
                currencyCode: currencyCode,
                occurredOn: occurredOn,
                merchant: merchant,
                paymentMethod: paymentMethod,
                receiptFileId: receiptFileId,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpensesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpensesTable,
      Expense,
      $$ExpensesTableFilterComposer,
      $$ExpensesTableOrderingComposer,
      $$ExpensesTableAnnotationComposer,
      $$ExpensesTableCreateCompanionBuilder,
      $$ExpensesTableUpdateCompanionBuilder,
      (Expense, BaseReferences<_$AppDatabase, $ExpensesTable, Expense>),
      Expense,
      PrefetchHooks Function()
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      Value<String?> petId,
      required String kind,
      required String title,
      Value<String?> body,
      required DateTime startsAt,
      required String timezoneId,
      Value<String?> recurrenceRule,
      Value<String?> sourceEntityType,
      Value<String?> sourceEntityId,
      Value<bool> enabled,
      Value<int> notificationLeadMinutes,
      Value<DateTime?> endsAt,
      Value<int> rowid,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String?> petId,
      Value<String> kind,
      Value<String> title,
      Value<String?> body,
      Value<DateTime> startsAt,
      Value<String> timezoneId,
      Value<String?> recurrenceRule,
      Value<String?> sourceEntityType,
      Value<String?> sourceEntityId,
      Value<bool> enabled,
      Value<int> notificationLeadMinutes,
      Value<DateTime?> endsAt,
      Value<int> rowid,
    });

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startsAt => $composableBuilder(
    column: $table.startsAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceEntityType => $composableBuilder(
    column: $table.sourceEntityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceEntityId => $composableBuilder(
    column: $table.sourceEntityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationLeadMinutes => $composableBuilder(
    column: $table.notificationLeadMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endsAt => $composableBuilder(
    column: $table.endsAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startsAt => $composableBuilder(
    column: $table.startsAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceEntityType => $composableBuilder(
    column: $table.sourceEntityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceEntityId => $composableBuilder(
    column: $table.sourceEntityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationLeadMinutes => $composableBuilder(
    column: $table.notificationLeadMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endsAt => $composableBuilder(
    column: $table.endsAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get startsAt =>
      $composableBuilder(column: $table.startsAt, builder: (column) => column);

  GeneratedColumn<String> get timezoneId => $composableBuilder(
    column: $table.timezoneId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recurrenceRule => $composableBuilder(
    column: $table.recurrenceRule,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceEntityType => $composableBuilder(
    column: $table.sourceEntityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceEntityId => $composableBuilder(
    column: $table.sourceEntityId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get notificationLeadMinutes => $composableBuilder(
    column: $table.notificationLeadMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get endsAt =>
      $composableBuilder(column: $table.endsAt, builder: (column) => column);
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, BaseReferences<_$AppDatabase, $RemindersTable, Reminder>),
          Reminder,
          PrefetchHooks Function()
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String?> petId = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> body = const Value.absent(),
                Value<DateTime> startsAt = const Value.absent(),
                Value<String> timezoneId = const Value.absent(),
                Value<String?> recurrenceRule = const Value.absent(),
                Value<String?> sourceEntityType = const Value.absent(),
                Value<String?> sourceEntityId = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> notificationLeadMinutes = const Value.absent(),
                Value<DateTime?> endsAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                kind: kind,
                title: title,
                body: body,
                startsAt: startsAt,
                timezoneId: timezoneId,
                recurrenceRule: recurrenceRule,
                sourceEntityType: sourceEntityType,
                sourceEntityId: sourceEntityId,
                enabled: enabled,
                notificationLeadMinutes: notificationLeadMinutes,
                endsAt: endsAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                Value<String?> petId = const Value.absent(),
                required String kind,
                required String title,
                Value<String?> body = const Value.absent(),
                required DateTime startsAt,
                required String timezoneId,
                Value<String?> recurrenceRule = const Value.absent(),
                Value<String?> sourceEntityType = const Value.absent(),
                Value<String?> sourceEntityId = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> notificationLeadMinutes = const Value.absent(),
                Value<DateTime?> endsAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                kind: kind,
                title: title,
                body: body,
                startsAt: startsAt,
                timezoneId: timezoneId,
                recurrenceRule: recurrenceRule,
                sourceEntityType: sourceEntityType,
                sourceEntityId: sourceEntityId,
                enabled: enabled,
                notificationLeadMinutes: notificationLeadMinutes,
                endsAt: endsAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, BaseReferences<_$AppDatabase, $RemindersTable, Reminder>),
      Reminder,
      PrefetchHooks Function()
    >;
typedef $$ScheduledNotificationsTableCreateCompanionBuilder =
    ScheduledNotificationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String reminderId,
      required int platformNotificationId,
      required DateTime scheduledFor,
      required String status,
      Value<int> rowid,
    });
typedef $$ScheduledNotificationsTableUpdateCompanionBuilder =
    ScheduledNotificationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> reminderId,
      Value<int> platformNotificationId,
      Value<DateTime> scheduledFor,
      Value<String> status,
      Value<int> rowid,
    });

class $$ScheduledNotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reminderId => $composableBuilder(
    column: $table.reminderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get platformNotificationId => $composableBuilder(
    column: $table.platformNotificationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ScheduledNotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reminderId => $composableBuilder(
    column: $table.reminderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get platformNotificationId => $composableBuilder(
    column: $table.platformNotificationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ScheduledNotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScheduledNotificationsTable> {
  $$ScheduledNotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get reminderId => $composableBuilder(
    column: $table.reminderId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get platformNotificationId => $composableBuilder(
    column: $table.platformNotificationId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledFor => $composableBuilder(
    column: $table.scheduledFor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$ScheduledNotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScheduledNotificationsTable,
          ScheduledNotification,
          $$ScheduledNotificationsTableFilterComposer,
          $$ScheduledNotificationsTableOrderingComposer,
          $$ScheduledNotificationsTableAnnotationComposer,
          $$ScheduledNotificationsTableCreateCompanionBuilder,
          $$ScheduledNotificationsTableUpdateCompanionBuilder,
          (
            ScheduledNotification,
            BaseReferences<
              _$AppDatabase,
              $ScheduledNotificationsTable,
              ScheduledNotification
            >,
          ),
          ScheduledNotification,
          PrefetchHooks Function()
        > {
  $$ScheduledNotificationsTableTableManager(
    _$AppDatabase db,
    $ScheduledNotificationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ScheduledNotificationsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$ScheduledNotificationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ScheduledNotificationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> reminderId = const Value.absent(),
                Value<int> platformNotificationId = const Value.absent(),
                Value<DateTime> scheduledFor = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScheduledNotificationsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                reminderId: reminderId,
                platformNotificationId: platformNotificationId,
                scheduledFor: scheduledFor,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String reminderId,
                required int platformNotificationId,
                required DateTime scheduledFor,
                required String status,
                Value<int> rowid = const Value.absent(),
              }) => ScheduledNotificationsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                reminderId: reminderId,
                platformNotificationId: platformNotificationId,
                scheduledFor: scheduledFor,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ScheduledNotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScheduledNotificationsTable,
      ScheduledNotification,
      $$ScheduledNotificationsTableFilterComposer,
      $$ScheduledNotificationsTableOrderingComposer,
      $$ScheduledNotificationsTableAnnotationComposer,
      $$ScheduledNotificationsTableCreateCompanionBuilder,
      $$ScheduledNotificationsTableUpdateCompanionBuilder,
      (
        ScheduledNotification,
        BaseReferences<
          _$AppDatabase,
          $ScheduledNotificationsTable,
          ScheduledNotification
        >,
      ),
      ScheduledNotification,
      PrefetchHooks Function()
    >;
typedef $$GeneratedReportsTableCreateCompanionBuilder =
    GeneratedReportsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      Value<String?> petId,
      required String fileId,
      required String reportType,
      Value<DateTime?> periodStart,
      Value<DateTime?> periodEnd,
      Value<int> rowid,
    });
typedef $$GeneratedReportsTableUpdateCompanionBuilder =
    GeneratedReportsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String?> petId,
      Value<String> fileId,
      Value<String> reportType,
      Value<DateTime?> periodStart,
      Value<DateTime?> periodEnd,
      Value<int> rowid,
    });

class $$GeneratedReportsTableFilterComposer
    extends Composer<_$AppDatabase, $GeneratedReportsTable> {
  $$GeneratedReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileId => $composableBuilder(
    column: $table.fileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reportType => $composableBuilder(
    column: $table.reportType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get periodEnd => $composableBuilder(
    column: $table.periodEnd,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GeneratedReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $GeneratedReportsTable> {
  $$GeneratedReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileId => $composableBuilder(
    column: $table.fileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reportType => $composableBuilder(
    column: $table.reportType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get periodEnd => $composableBuilder(
    column: $table.periodEnd,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GeneratedReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeneratedReportsTable> {
  $$GeneratedReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get fileId =>
      $composableBuilder(column: $table.fileId, builder: (column) => column);

  GeneratedColumn<String> get reportType => $composableBuilder(
    column: $table.reportType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get periodStart => $composableBuilder(
    column: $table.periodStart,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get periodEnd =>
      $composableBuilder(column: $table.periodEnd, builder: (column) => column);
}

class $$GeneratedReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GeneratedReportsTable,
          GeneratedReport,
          $$GeneratedReportsTableFilterComposer,
          $$GeneratedReportsTableOrderingComposer,
          $$GeneratedReportsTableAnnotationComposer,
          $$GeneratedReportsTableCreateCompanionBuilder,
          $$GeneratedReportsTableUpdateCompanionBuilder,
          (
            GeneratedReport,
            BaseReferences<
              _$AppDatabase,
              $GeneratedReportsTable,
              GeneratedReport
            >,
          ),
          GeneratedReport,
          PrefetchHooks Function()
        > {
  $$GeneratedReportsTableTableManager(
    _$AppDatabase db,
    $GeneratedReportsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$GeneratedReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$GeneratedReportsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$GeneratedReportsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String?> petId = const Value.absent(),
                Value<String> fileId = const Value.absent(),
                Value<String> reportType = const Value.absent(),
                Value<DateTime?> periodStart = const Value.absent(),
                Value<DateTime?> periodEnd = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GeneratedReportsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                fileId: fileId,
                reportType: reportType,
                periodStart: periodStart,
                periodEnd: periodEnd,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                Value<String?> petId = const Value.absent(),
                required String fileId,
                required String reportType,
                Value<DateTime?> periodStart = const Value.absent(),
                Value<DateTime?> periodEnd = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GeneratedReportsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                fileId: fileId,
                reportType: reportType,
                periodStart: periodStart,
                periodEnd: periodEnd,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GeneratedReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GeneratedReportsTable,
      GeneratedReport,
      $$GeneratedReportsTableFilterComposer,
      $$GeneratedReportsTableOrderingComposer,
      $$GeneratedReportsTableAnnotationComposer,
      $$GeneratedReportsTableCreateCompanionBuilder,
      $$GeneratedReportsTableUpdateCompanionBuilder,
      (
        GeneratedReport,
        BaseReferences<_$AppDatabase, $GeneratedReportsTable, GeneratedReport>,
      ),
      GeneratedReport,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String settingKey,
      required String valueJson,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> settingKey,
      Value<String> valueJson,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueJson => $composableBuilder(
    column: $table.valueJson,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueJson => $composableBuilder(
    column: $table.valueJson,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get settingKey => $composableBuilder(
    column: $table.settingKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get valueJson =>
      $composableBuilder(column: $table.valueJson, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> settingKey = const Value.absent(),
                Value<String> valueJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                settingKey: settingKey,
                valueJson: valueJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String settingKey,
                required String valueJson,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                settingKey: settingKey,
                valueJson: valueJson,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$BackupRecordsTableCreateCompanionBuilder =
    BackupRecordsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      Value<String?> driveFileId,
      required int backupFormatVersion,
      required int databaseSchemaVersion,
      Value<String?> encryptedSha256,
      Value<int?> byteSize,
      required DateTime startedAt,
      Value<DateTime?> completedAt,
      required String status,
      Value<String?> failureCode,
      Value<int> rowid,
    });
typedef $$BackupRecordsTableUpdateCompanionBuilder =
    BackupRecordsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String?> driveFileId,
      Value<int> backupFormatVersion,
      Value<int> databaseSchemaVersion,
      Value<String?> encryptedSha256,
      Value<int?> byteSize,
      Value<DateTime> startedAt,
      Value<DateTime?> completedAt,
      Value<String> status,
      Value<String?> failureCode,
      Value<int> rowid,
    });

class $$BackupRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $BackupRecordsTable> {
  $$BackupRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get driveFileId => $composableBuilder(
    column: $table.driveFileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get backupFormatVersion => $composableBuilder(
    column: $table.backupFormatVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get databaseSchemaVersion => $composableBuilder(
    column: $table.databaseSchemaVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get encryptedSha256 => $composableBuilder(
    column: $table.encryptedSha256,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get failureCode => $composableBuilder(
    column: $table.failureCode,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BackupRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $BackupRecordsTable> {
  $$BackupRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get driveFileId => $composableBuilder(
    column: $table.driveFileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get backupFormatVersion => $composableBuilder(
    column: $table.backupFormatVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get databaseSchemaVersion => $composableBuilder(
    column: $table.databaseSchemaVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get encryptedSha256 => $composableBuilder(
    column: $table.encryptedSha256,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get byteSize => $composableBuilder(
    column: $table.byteSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get failureCode => $composableBuilder(
    column: $table.failureCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BackupRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BackupRecordsTable> {
  $$BackupRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get driveFileId => $composableBuilder(
    column: $table.driveFileId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get backupFormatVersion => $composableBuilder(
    column: $table.backupFormatVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get databaseSchemaVersion => $composableBuilder(
    column: $table.databaseSchemaVersion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get encryptedSha256 => $composableBuilder(
    column: $table.encryptedSha256,
    builder: (column) => column,
  );

  GeneratedColumn<int> get byteSize =>
      $composableBuilder(column: $table.byteSize, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get failureCode => $composableBuilder(
    column: $table.failureCode,
    builder: (column) => column,
  );
}

class $$BackupRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BackupRecordsTable,
          BackupRecord,
          $$BackupRecordsTableFilterComposer,
          $$BackupRecordsTableOrderingComposer,
          $$BackupRecordsTableAnnotationComposer,
          $$BackupRecordsTableCreateCompanionBuilder,
          $$BackupRecordsTableUpdateCompanionBuilder,
          (
            BackupRecord,
            BaseReferences<_$AppDatabase, $BackupRecordsTable, BackupRecord>,
          ),
          BackupRecord,
          PrefetchHooks Function()
        > {
  $$BackupRecordsTableTableManager(_$AppDatabase db, $BackupRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$BackupRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$BackupRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$BackupRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String?> driveFileId = const Value.absent(),
                Value<int> backupFormatVersion = const Value.absent(),
                Value<int> databaseSchemaVersion = const Value.absent(),
                Value<String?> encryptedSha256 = const Value.absent(),
                Value<int?> byteSize = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> completedAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> failureCode = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BackupRecordsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                driveFileId: driveFileId,
                backupFormatVersion: backupFormatVersion,
                databaseSchemaVersion: databaseSchemaVersion,
                encryptedSha256: encryptedSha256,
                byteSize: byteSize,
                startedAt: startedAt,
                completedAt: completedAt,
                status: status,
                failureCode: failureCode,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                Value<String?> driveFileId = const Value.absent(),
                required int backupFormatVersion,
                required int databaseSchemaVersion,
                Value<String?> encryptedSha256 = const Value.absent(),
                Value<int?> byteSize = const Value.absent(),
                required DateTime startedAt,
                Value<DateTime?> completedAt = const Value.absent(),
                required String status,
                Value<String?> failureCode = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BackupRecordsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                driveFileId: driveFileId,
                backupFormatVersion: backupFormatVersion,
                databaseSchemaVersion: databaseSchemaVersion,
                encryptedSha256: encryptedSha256,
                byteSize: byteSize,
                startedAt: startedAt,
                completedAt: completedAt,
                status: status,
                failureCode: failureCode,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BackupRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BackupRecordsTable,
      BackupRecord,
      $$BackupRecordsTableFilterComposer,
      $$BackupRecordsTableOrderingComposer,
      $$BackupRecordsTableAnnotationComposer,
      $$BackupRecordsTableCreateCompanionBuilder,
      $$BackupRecordsTableUpdateCompanionBuilder,
      (
        BackupRecord,
        BaseReferences<_$AppDatabase, $BackupRecordsTable, BackupRecord>,
      ),
      BackupRecord,
      PrefetchHooks Function()
    >;
typedef $$MemoriesTableCreateCompanionBuilder =
    MemoriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petId,
      Value<String?> title,
      Value<String?> description,
      Value<String?> imageFileId,
      Value<DateTime> date,
      Value<int> rowid,
    });
typedef $$MemoriesTableUpdateCompanionBuilder =
    MemoriesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petId,
      Value<String?> title,
      Value<String?> description,
      Value<String?> imageFileId,
      Value<DateTime> date,
      Value<int> rowid,
    });

class $$MemoriesTableFilterComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageFileId => $composableBuilder(
    column: $table.imageFileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MemoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageFileId => $composableBuilder(
    column: $table.imageFileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MemoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemoriesTable> {
  $$MemoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageFileId => $composableBuilder(
    column: $table.imageFileId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$MemoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MemoriesTable,
          Memory,
          $$MemoriesTableFilterComposer,
          $$MemoriesTableOrderingComposer,
          $$MemoriesTableAnnotationComposer,
          $$MemoriesTableCreateCompanionBuilder,
          $$MemoriesTableUpdateCompanionBuilder,
          (Memory, BaseReferences<_$AppDatabase, $MemoriesTable, Memory>),
          Memory,
          PrefetchHooks Function()
        > {
  $$MemoriesTableTableManager(_$AppDatabase db, $MemoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$MemoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$MemoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$MemoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> imageFileId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemoriesCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                title: title,
                description: description,
                imageFileId: imageFileId,
                date: date,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petId,
                Value<String?> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> imageFileId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemoriesCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                title: title,
                description: description,
                imageFileId: imageFileId,
                date: date,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MemoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MemoriesTable,
      Memory,
      $$MemoriesTableFilterComposer,
      $$MemoriesTableOrderingComposer,
      $$MemoriesTableAnnotationComposer,
      $$MemoriesTableCreateCompanionBuilder,
      $$MemoriesTableUpdateCompanionBuilder,
      (Memory, BaseReferences<_$AppDatabase, $MemoriesTable, Memory>),
      Memory,
      PrefetchHooks Function()
    >;
typedef $$DewormingsTableCreateCompanionBuilder =
    DewormingsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      required String id,
      required String petId,
      required String medicationName,
      required DateTime administeredOn,
      Value<DateTime?> nextDueOn,
      Value<String?> notes,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$DewormingsTableUpdateCompanionBuilder =
    DewormingsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String> id,
      Value<String> petId,
      Value<String> medicationName,
      Value<DateTime> administeredOn,
      Value<DateTime?> nextDueOn,
      Value<String?> notes,
      Value<String> status,
      Value<int> rowid,
    });

class $$DewormingsTableFilterComposer
    extends Composer<_$AppDatabase, $DewormingsTable> {
  $$DewormingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get administeredOn => $composableBuilder(
    column: $table.administeredOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextDueOn => $composableBuilder(
    column: $table.nextDueOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DewormingsTableOrderingComposer
    extends Composer<_$AppDatabase, $DewormingsTable> {
  $$DewormingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get petId => $composableBuilder(
    column: $table.petId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get administeredOn => $composableBuilder(
    column: $table.administeredOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextDueOn => $composableBuilder(
    column: $table.nextDueOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DewormingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DewormingsTable> {
  $$DewormingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get petId =>
      $composableBuilder(column: $table.petId, builder: (column) => column);

  GeneratedColumn<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get administeredOn => $composableBuilder(
    column: $table.administeredOn,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextDueOn =>
      $composableBuilder(column: $table.nextDueOn, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$DewormingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DewormingsTable,
          Deworming,
          $$DewormingsTableFilterComposer,
          $$DewormingsTableOrderingComposer,
          $$DewormingsTableAnnotationComposer,
          $$DewormingsTableCreateCompanionBuilder,
          $$DewormingsTableUpdateCompanionBuilder,
          (
            Deworming,
            BaseReferences<_$AppDatabase, $DewormingsTable, Deworming>,
          ),
          Deworming,
          PrefetchHooks Function()
        > {
  $$DewormingsTableTableManager(_$AppDatabase db, $DewormingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DewormingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DewormingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DewormingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> id = const Value.absent(),
                Value<String> petId = const Value.absent(),
                Value<String> medicationName = const Value.absent(),
                Value<DateTime> administeredOn = const Value.absent(),
                Value<DateTime?> nextDueOn = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DewormingsCompanion(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                medicationName: medicationName,
                administeredOn: administeredOn,
                nextDueOn: nextDueOn,
                notes: notes,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                required String id,
                required String petId,
                required String medicationName,
                required DateTime administeredOn,
                Value<DateTime?> nextDueOn = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DewormingsCompanion.insert(
                createdAt: createdAt,
                updatedAt: updatedAt,
                id: id,
                petId: petId,
                medicationName: medicationName,
                administeredOn: administeredOn,
                nextDueOn: nextDueOn,
                notes: notes,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DewormingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DewormingsTable,
      Deworming,
      $$DewormingsTableFilterComposer,
      $$DewormingsTableOrderingComposer,
      $$DewormingsTableAnnotationComposer,
      $$DewormingsTableCreateCompanionBuilder,
      $$DewormingsTableUpdateCompanionBuilder,
      (Deworming, BaseReferences<_$AppDatabase, $DewormingsTable, Deworming>),
      Deworming,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FileAssetsTableTableManager get fileAssets =>
      $$FileAssetsTableTableManager(_db, _db.fileAssets);
  $$OwnerProfilesTableTableManager get ownerProfiles =>
      $$OwnerProfilesTableTableManager(_db, _db.ownerProfiles);
  $$PetsTableTableManager get pets => $$PetsTableTableManager(_db, _db.pets);
  $$VaccinationsTableTableManager get vaccinations =>
      $$VaccinationsTableTableManager(_db, _db.vaccinations);
  $$MedicalRecordsTableTableManager get medicalRecords =>
      $$MedicalRecordsTableTableManager(_db, _db.medicalRecords);
  $$MedicinesTableTableManager get medicines =>
      $$MedicinesTableTableManager(_db, _db.medicines);
  $$PetMedicationsTableTableManager get petMedications =>
      $$PetMedicationsTableTableManager(_db, _db.petMedications);
  $$MedicationSchedulesTableTableManager get medicationSchedules =>
      $$MedicationSchedulesTableTableManager(_db, _db.medicationSchedules);
  $$MedicationAdministrationsTableTableManager get medicationAdministrations =>
      $$MedicationAdministrationsTableTableManager(
        _db,
        _db.medicationAdministrations,
      );
  $$AppointmentsTableTableManager get appointments =>
      $$AppointmentsTableTableManager(_db, _db.appointments);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$RecordAttachmentsTableTableManager get recordAttachments =>
      $$RecordAttachmentsTableTableManager(_db, _db.recordAttachments);
  $$GrowthEntriesTableTableManager get growthEntries =>
      $$GrowthEntriesTableTableManager(_db, _db.growthEntries);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$ScheduledNotificationsTableTableManager get scheduledNotifications =>
      $$ScheduledNotificationsTableTableManager(
        _db,
        _db.scheduledNotifications,
      );
  $$GeneratedReportsTableTableManager get generatedReports =>
      $$GeneratedReportsTableTableManager(_db, _db.generatedReports);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$BackupRecordsTableTableManager get backupRecords =>
      $$BackupRecordsTableTableManager(_db, _db.backupRecords);
  $$MemoriesTableTableManager get memories =>
      $$MemoriesTableTableManager(_db, _db.memories);
  $$DewormingsTableTableManager get dewormings =>
      $$DewormingsTableTableManager(_db, _db.dewormings);
}
