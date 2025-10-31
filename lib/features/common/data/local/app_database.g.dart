// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CircunscripcionTableTable extends CircunscripcionTable
    with TableInfo<$CircunscripcionTableTable, CircunscripcionEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CircunscripcionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v4(),
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
    'numero',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _delegadoMeta = const VerificationMeta(
    'delegado',
  );
  @override
  late final GeneratedColumn<String> delegado = GeneratedColumn<String>(
    'delegado',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _zonaMeta = const VerificationMeta('zona');
  @override
  late final GeneratedColumn<String> zona = GeneratedColumn<String>(
    'zona',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _consejoPopularMeta = const VerificationMeta(
    'consejoPopular',
  );
  @override
  late final GeneratedColumn<String> consejoPopular = GeneratedColumn<String>(
    'consejo_popular',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isAvailableMeta = const VerificationMeta(
    'isAvailable',
  );
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
    'is_available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_available" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    numero,
    delegado,
    zona,
    consejoPopular,
    isAvailable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'circunscripcion_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CircunscripcionEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('delegado')) {
      context.handle(
        _delegadoMeta,
        delegado.isAcceptableOrUnknown(data['delegado']!, _delegadoMeta),
      );
    } else if (isInserting) {
      context.missing(_delegadoMeta);
    }
    if (data.containsKey('zona')) {
      context.handle(
        _zonaMeta,
        zona.isAcceptableOrUnknown(data['zona']!, _zonaMeta),
      );
    }
    if (data.containsKey('consejo_popular')) {
      context.handle(
        _consejoPopularMeta,
        consejoPopular.isAcceptableOrUnknown(
          data['consejo_popular']!,
          _consejoPopularMeta,
        ),
      );
    }
    if (data.containsKey('is_available')) {
      context.handle(
        _isAvailableMeta,
        isAvailable.isAcceptableOrUnknown(
          data['is_available']!,
          _isAvailableMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CircunscripcionEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CircunscripcionEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      numero:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}numero'],
          )!,
      delegado:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}delegado'],
          )!,
      zona: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}zona'],
      ),
      consejoPopular: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}consejo_popular'],
      ),
      isAvailable:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_available'],
          )!,
    );
  }

  @override
  $CircunscripcionTableTable createAlias(String alias) {
    return $CircunscripcionTableTable(attachedDatabase, alias);
  }
}

class CircunscripcionEntity extends DataClass
    implements Insertable<CircunscripcionEntity> {
  final String id;
  final String numero;
  final String delegado;
  final String? zona;
  final String? consejoPopular;
  final bool isAvailable;
  const CircunscripcionEntity({
    required this.id,
    required this.numero,
    required this.delegado,
    this.zona,
    this.consejoPopular,
    required this.isAvailable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['numero'] = Variable<String>(numero);
    map['delegado'] = Variable<String>(delegado);
    if (!nullToAbsent || zona != null) {
      map['zona'] = Variable<String>(zona);
    }
    if (!nullToAbsent || consejoPopular != null) {
      map['consejo_popular'] = Variable<String>(consejoPopular);
    }
    map['is_available'] = Variable<bool>(isAvailable);
    return map;
  }

  CircunscripcionTableCompanion toCompanion(bool nullToAbsent) {
    return CircunscripcionTableCompanion(
      id: Value(id),
      numero: Value(numero),
      delegado: Value(delegado),
      zona: zona == null && nullToAbsent ? const Value.absent() : Value(zona),
      consejoPopular:
          consejoPopular == null && nullToAbsent
              ? const Value.absent()
              : Value(consejoPopular),
      isAvailable: Value(isAvailable),
    );
  }

  factory CircunscripcionEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CircunscripcionEntity(
      id: serializer.fromJson<String>(json['id']),
      numero: serializer.fromJson<String>(json['numero']),
      delegado: serializer.fromJson<String>(json['delegado']),
      zona: serializer.fromJson<String?>(json['zona']),
      consejoPopular: serializer.fromJson<String?>(json['consejoPopular']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'numero': serializer.toJson<String>(numero),
      'delegado': serializer.toJson<String>(delegado),
      'zona': serializer.toJson<String?>(zona),
      'consejoPopular': serializer.toJson<String?>(consejoPopular),
      'isAvailable': serializer.toJson<bool>(isAvailable),
    };
  }

  CircunscripcionEntity copyWith({
    String? id,
    String? numero,
    String? delegado,
    Value<String?> zona = const Value.absent(),
    Value<String?> consejoPopular = const Value.absent(),
    bool? isAvailable,
  }) => CircunscripcionEntity(
    id: id ?? this.id,
    numero: numero ?? this.numero,
    delegado: delegado ?? this.delegado,
    zona: zona.present ? zona.value : this.zona,
    consejoPopular:
        consejoPopular.present ? consejoPopular.value : this.consejoPopular,
    isAvailable: isAvailable ?? this.isAvailable,
  );
  CircunscripcionEntity copyWithCompanion(CircunscripcionTableCompanion data) {
    return CircunscripcionEntity(
      id: data.id.present ? data.id.value : this.id,
      numero: data.numero.present ? data.numero.value : this.numero,
      delegado: data.delegado.present ? data.delegado.value : this.delegado,
      zona: data.zona.present ? data.zona.value : this.zona,
      consejoPopular:
          data.consejoPopular.present
              ? data.consejoPopular.value
              : this.consejoPopular,
      isAvailable:
          data.isAvailable.present ? data.isAvailable.value : this.isAvailable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CircunscripcionEntity(')
          ..write('id: $id, ')
          ..write('numero: $numero, ')
          ..write('delegado: $delegado, ')
          ..write('zona: $zona, ')
          ..write('consejoPopular: $consejoPopular, ')
          ..write('isAvailable: $isAvailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, numero, delegado, zona, consejoPopular, isAvailable);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CircunscripcionEntity &&
          other.id == this.id &&
          other.numero == this.numero &&
          other.delegado == this.delegado &&
          other.zona == this.zona &&
          other.consejoPopular == this.consejoPopular &&
          other.isAvailable == this.isAvailable);
}

class CircunscripcionTableCompanion
    extends UpdateCompanion<CircunscripcionEntity> {
  final Value<String> id;
  final Value<String> numero;
  final Value<String> delegado;
  final Value<String?> zona;
  final Value<String?> consejoPopular;
  final Value<bool> isAvailable;
  final Value<int> rowid;
  const CircunscripcionTableCompanion({
    this.id = const Value.absent(),
    this.numero = const Value.absent(),
    this.delegado = const Value.absent(),
    this.zona = const Value.absent(),
    this.consejoPopular = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CircunscripcionTableCompanion.insert({
    this.id = const Value.absent(),
    required String numero,
    required String delegado,
    this.zona = const Value.absent(),
    this.consejoPopular = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : numero = Value(numero),
       delegado = Value(delegado);
  static Insertable<CircunscripcionEntity> custom({
    Expression<String>? id,
    Expression<String>? numero,
    Expression<String>? delegado,
    Expression<String>? zona,
    Expression<String>? consejoPopular,
    Expression<bool>? isAvailable,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numero != null) 'numero': numero,
      if (delegado != null) 'delegado': delegado,
      if (zona != null) 'zona': zona,
      if (consejoPopular != null) 'consejo_popular': consejoPopular,
      if (isAvailable != null) 'is_available': isAvailable,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CircunscripcionTableCompanion copyWith({
    Value<String>? id,
    Value<String>? numero,
    Value<String>? delegado,
    Value<String?>? zona,
    Value<String?>? consejoPopular,
    Value<bool>? isAvailable,
    Value<int>? rowid,
  }) {
    return CircunscripcionTableCompanion(
      id: id ?? this.id,
      numero: numero ?? this.numero,
      delegado: delegado ?? this.delegado,
      zona: zona ?? this.zona,
      consejoPopular: consejoPopular ?? this.consejoPopular,
      isAvailable: isAvailable ?? this.isAvailable,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    if (delegado.present) {
      map['delegado'] = Variable<String>(delegado.value);
    }
    if (zona.present) {
      map['zona'] = Variable<String>(zona.value);
    }
    if (consejoPopular.present) {
      map['consejo_popular'] = Variable<String>(consejoPopular.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CircunscripcionTableCompanion(')
          ..write('id: $id, ')
          ..write('numero: $numero, ')
          ..write('delegado: $delegado, ')
          ..write('zona: $zona, ')
          ..write('consejoPopular: $consejoPopular, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CdrTableTable extends CdrTable
    with TableInfo<$CdrTableTable, CdrEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CdrTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v4(),
  );
  static const VerificationMeta _numeroMeta = const VerificationMeta('numero');
  @override
  late final GeneratedColumn<String> numero = GeneratedColumn<String>(
    'numero',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _presidenteMeta = const VerificationMeta(
    'presidente',
  );
  @override
  late final GeneratedColumn<String> presidente = GeneratedColumn<String>(
    'presidente',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sectorMeta = const VerificationMeta('sector');
  @override
  late final GeneratedColumn<String> sector = GeneratedColumn<String>(
    'sector',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _circunscripcionIdMeta = const VerificationMeta(
    'circunscripcionId',
  );
  @override
  late final GeneratedColumn<String> circunscripcionId =
      GeneratedColumn<String>(
        'circunscripcion_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES circunscripcion_table (id)',
        ),
      );
  static const VerificationMeta _isAvailableMeta = const VerificationMeta(
    'isAvailable',
  );
  @override
  late final GeneratedColumn<bool> isAvailable = GeneratedColumn<bool>(
    'is_available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_available" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    numero,
    presidente,
    sector,
    circunscripcionId,
    isAvailable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cdr_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CdrEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('numero')) {
      context.handle(
        _numeroMeta,
        numero.isAcceptableOrUnknown(data['numero']!, _numeroMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroMeta);
    }
    if (data.containsKey('presidente')) {
      context.handle(
        _presidenteMeta,
        presidente.isAcceptableOrUnknown(data['presidente']!, _presidenteMeta),
      );
    }
    if (data.containsKey('sector')) {
      context.handle(
        _sectorMeta,
        sector.isAcceptableOrUnknown(data['sector']!, _sectorMeta),
      );
    }
    if (data.containsKey('circunscripcion_id')) {
      context.handle(
        _circunscripcionIdMeta,
        circunscripcionId.isAcceptableOrUnknown(
          data['circunscripcion_id']!,
          _circunscripcionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_circunscripcionIdMeta);
    }
    if (data.containsKey('is_available')) {
      context.handle(
        _isAvailableMeta,
        isAvailable.isAcceptableOrUnknown(
          data['is_available']!,
          _isAvailableMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CdrEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CdrEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      numero:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}numero'],
          )!,
      presidente: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}presidente'],
      ),
      sector: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sector'],
      ),
      circunscripcionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}circunscripcion_id'],
          )!,
      isAvailable:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_available'],
          )!,
    );
  }

  @override
  $CdrTableTable createAlias(String alias) {
    return $CdrTableTable(attachedDatabase, alias);
  }
}

class CdrEntity extends DataClass implements Insertable<CdrEntity> {
  final String id;
  final String numero;
  final String? presidente;
  final String? sector;
  final String circunscripcionId;
  final bool isAvailable;
  const CdrEntity({
    required this.id,
    required this.numero,
    this.presidente,
    this.sector,
    required this.circunscripcionId,
    required this.isAvailable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['numero'] = Variable<String>(numero);
    if (!nullToAbsent || presidente != null) {
      map['presidente'] = Variable<String>(presidente);
    }
    if (!nullToAbsent || sector != null) {
      map['sector'] = Variable<String>(sector);
    }
    map['circunscripcion_id'] = Variable<String>(circunscripcionId);
    map['is_available'] = Variable<bool>(isAvailable);
    return map;
  }

  CdrTableCompanion toCompanion(bool nullToAbsent) {
    return CdrTableCompanion(
      id: Value(id),
      numero: Value(numero),
      presidente:
          presidente == null && nullToAbsent
              ? const Value.absent()
              : Value(presidente),
      sector:
          sector == null && nullToAbsent ? const Value.absent() : Value(sector),
      circunscripcionId: Value(circunscripcionId),
      isAvailable: Value(isAvailable),
    );
  }

  factory CdrEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CdrEntity(
      id: serializer.fromJson<String>(json['id']),
      numero: serializer.fromJson<String>(json['numero']),
      presidente: serializer.fromJson<String?>(json['presidente']),
      sector: serializer.fromJson<String?>(json['sector']),
      circunscripcionId: serializer.fromJson<String>(json['circunscripcionId']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'numero': serializer.toJson<String>(numero),
      'presidente': serializer.toJson<String?>(presidente),
      'sector': serializer.toJson<String?>(sector),
      'circunscripcionId': serializer.toJson<String>(circunscripcionId),
      'isAvailable': serializer.toJson<bool>(isAvailable),
    };
  }

  CdrEntity copyWith({
    String? id,
    String? numero,
    Value<String?> presidente = const Value.absent(),
    Value<String?> sector = const Value.absent(),
    String? circunscripcionId,
    bool? isAvailable,
  }) => CdrEntity(
    id: id ?? this.id,
    numero: numero ?? this.numero,
    presidente: presidente.present ? presidente.value : this.presidente,
    sector: sector.present ? sector.value : this.sector,
    circunscripcionId: circunscripcionId ?? this.circunscripcionId,
    isAvailable: isAvailable ?? this.isAvailable,
  );
  CdrEntity copyWithCompanion(CdrTableCompanion data) {
    return CdrEntity(
      id: data.id.present ? data.id.value : this.id,
      numero: data.numero.present ? data.numero.value : this.numero,
      presidente:
          data.presidente.present ? data.presidente.value : this.presidente,
      sector: data.sector.present ? data.sector.value : this.sector,
      circunscripcionId:
          data.circunscripcionId.present
              ? data.circunscripcionId.value
              : this.circunscripcionId,
      isAvailable:
          data.isAvailable.present ? data.isAvailable.value : this.isAvailable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CdrEntity(')
          ..write('id: $id, ')
          ..write('numero: $numero, ')
          ..write('presidente: $presidente, ')
          ..write('sector: $sector, ')
          ..write('circunscripcionId: $circunscripcionId, ')
          ..write('isAvailable: $isAvailable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    numero,
    presidente,
    sector,
    circunscripcionId,
    isAvailable,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CdrEntity &&
          other.id == this.id &&
          other.numero == this.numero &&
          other.presidente == this.presidente &&
          other.sector == this.sector &&
          other.circunscripcionId == this.circunscripcionId &&
          other.isAvailable == this.isAvailable);
}

class CdrTableCompanion extends UpdateCompanion<CdrEntity> {
  final Value<String> id;
  final Value<String> numero;
  final Value<String?> presidente;
  final Value<String?> sector;
  final Value<String> circunscripcionId;
  final Value<bool> isAvailable;
  final Value<int> rowid;
  const CdrTableCompanion({
    this.id = const Value.absent(),
    this.numero = const Value.absent(),
    this.presidente = const Value.absent(),
    this.sector = const Value.absent(),
    this.circunscripcionId = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CdrTableCompanion.insert({
    this.id = const Value.absent(),
    required String numero,
    this.presidente = const Value.absent(),
    this.sector = const Value.absent(),
    required String circunscripcionId,
    this.isAvailable = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : numero = Value(numero),
       circunscripcionId = Value(circunscripcionId);
  static Insertable<CdrEntity> custom({
    Expression<String>? id,
    Expression<String>? numero,
    Expression<String>? presidente,
    Expression<String>? sector,
    Expression<String>? circunscripcionId,
    Expression<bool>? isAvailable,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (numero != null) 'numero': numero,
      if (presidente != null) 'presidente': presidente,
      if (sector != null) 'sector': sector,
      if (circunscripcionId != null) 'circunscripcion_id': circunscripcionId,
      if (isAvailable != null) 'is_available': isAvailable,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CdrTableCompanion copyWith({
    Value<String>? id,
    Value<String>? numero,
    Value<String?>? presidente,
    Value<String?>? sector,
    Value<String>? circunscripcionId,
    Value<bool>? isAvailable,
    Value<int>? rowid,
  }) {
    return CdrTableCompanion(
      id: id ?? this.id,
      numero: numero ?? this.numero,
      presidente: presidente ?? this.presidente,
      sector: sector ?? this.sector,
      circunscripcionId: circunscripcionId ?? this.circunscripcionId,
      isAvailable: isAvailable ?? this.isAvailable,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (numero.present) {
      map['numero'] = Variable<String>(numero.value);
    }
    if (presidente.present) {
      map['presidente'] = Variable<String>(presidente.value);
    }
    if (sector.present) {
      map['sector'] = Variable<String>(sector.value);
    }
    if (circunscripcionId.present) {
      map['circunscripcion_id'] = Variable<String>(circunscripcionId.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CdrTableCompanion(')
          ..write('id: $id, ')
          ..write('numero: $numero, ')
          ..write('presidente: $presidente, ')
          ..write('sector: $sector, ')
          ..write('circunscripcionId: $circunscripcionId, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PersonasTableTable extends PersonasTable
    with TableInfo<$PersonasTableTable, PersonasEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonasTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _edadMeta = const VerificationMeta('edad');
  @override
  late final GeneratedColumn<int> edad = GeneratedColumn<int>(
    'edad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre, edad];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personas_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonasEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('edad')) {
      context.handle(
        _edadMeta,
        edad.isAcceptableOrUnknown(data['edad']!, _edadMeta),
      );
    } else if (isInserting) {
      context.missing(_edadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonasEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonasEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      nombre:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}nombre'],
          )!,
      edad:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}edad'],
          )!,
    );
  }

  @override
  $PersonasTableTable createAlias(String alias) {
    return $PersonasTableTable(attachedDatabase, alias);
  }
}

class PersonasEntity extends DataClass implements Insertable<PersonasEntity> {
  final int id;
  final String nombre;
  final int edad;
  const PersonasEntity({
    required this.id,
    required this.nombre,
    required this.edad,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['edad'] = Variable<int>(edad);
    return map;
  }

  PersonasTableCompanion toCompanion(bool nullToAbsent) {
    return PersonasTableCompanion(
      id: Value(id),
      nombre: Value(nombre),
      edad: Value(edad),
    );
  }

  factory PersonasEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonasEntity(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      edad: serializer.fromJson<int>(json['edad']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'edad': serializer.toJson<int>(edad),
    };
  }

  PersonasEntity copyWith({int? id, String? nombre, int? edad}) =>
      PersonasEntity(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
      );
  PersonasEntity copyWithCompanion(PersonasTableCompanion data) {
    return PersonasEntity(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      edad: data.edad.present ? data.edad.value : this.edad,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonasEntity(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('edad: $edad')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, edad);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonasEntity &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.edad == this.edad);
}

class PersonasTableCompanion extends UpdateCompanion<PersonasEntity> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<int> edad;
  const PersonasTableCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.edad = const Value.absent(),
  });
  PersonasTableCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required int edad,
  }) : nombre = Value(nombre),
       edad = Value(edad);
  static Insertable<PersonasEntity> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<int>? edad,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (edad != null) 'edad': edad,
    });
  }

  PersonasTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<int>? edad,
  }) {
    return PersonasTableCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      edad: edad ?? this.edad,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (edad.present) {
      map['edad'] = Variable<int>(edad.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonasTableCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('edad: $edad')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CircunscripcionTableTable circunscripcionTable =
      $CircunscripcionTableTable(this);
  late final $CdrTableTable cdrTable = $CdrTableTable(this);
  late final $PersonasTableTable personasTable = $PersonasTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    circunscripcionTable,
    cdrTable,
    personasTable,
  ];
}

typedef $$CircunscripcionTableTableCreateCompanionBuilder =
    CircunscripcionTableCompanion Function({
      Value<String> id,
      required String numero,
      required String delegado,
      Value<String?> zona,
      Value<String?> consejoPopular,
      Value<bool> isAvailable,
      Value<int> rowid,
    });
typedef $$CircunscripcionTableTableUpdateCompanionBuilder =
    CircunscripcionTableCompanion Function({
      Value<String> id,
      Value<String> numero,
      Value<String> delegado,
      Value<String?> zona,
      Value<String?> consejoPopular,
      Value<bool> isAvailable,
      Value<int> rowid,
    });

final class $$CircunscripcionTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CircunscripcionTableTable,
          CircunscripcionEntity
        > {
  $$CircunscripcionTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$CdrTableTable, List<CdrEntity>>
  _cdrTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cdrTable,
    aliasName: $_aliasNameGenerator(
      db.circunscripcionTable.id,
      db.cdrTable.circunscripcionId,
    ),
  );

  $$CdrTableTableProcessedTableManager get cdrTableRefs {
    final manager = $$CdrTableTableTableManager($_db, $_db.cdrTable).filter(
      (f) => f.circunscripcionId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_cdrTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CircunscripcionTableTableFilterComposer
    extends Composer<_$AppDatabase, $CircunscripcionTableTable> {
  $$CircunscripcionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get delegado => $composableBuilder(
    column: $table.delegado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get zona => $composableBuilder(
    column: $table.zona,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get consejoPopular => $composableBuilder(
    column: $table.consejoPopular,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cdrTableRefs(
    Expression<bool> Function($$CdrTableTableFilterComposer f) f,
  ) {
    final $$CdrTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cdrTable,
      getReferencedColumn: (t) => t.circunscripcionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CdrTableTableFilterComposer(
            $db: $db,
            $table: $db.cdrTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CircunscripcionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CircunscripcionTableTable> {
  $$CircunscripcionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get delegado => $composableBuilder(
    column: $table.delegado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get zona => $composableBuilder(
    column: $table.zona,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get consejoPopular => $composableBuilder(
    column: $table.consejoPopular,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CircunscripcionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CircunscripcionTableTable> {
  $$CircunscripcionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<String> get delegado =>
      $composableBuilder(column: $table.delegado, builder: (column) => column);

  GeneratedColumn<String> get zona =>
      $composableBuilder(column: $table.zona, builder: (column) => column);

  GeneratedColumn<String> get consejoPopular => $composableBuilder(
    column: $table.consejoPopular,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => column,
  );

  Expression<T> cdrTableRefs<T extends Object>(
    Expression<T> Function($$CdrTableTableAnnotationComposer a) f,
  ) {
    final $$CdrTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cdrTable,
      getReferencedColumn: (t) => t.circunscripcionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CdrTableTableAnnotationComposer(
            $db: $db,
            $table: $db.cdrTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CircunscripcionTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CircunscripcionTableTable,
          CircunscripcionEntity,
          $$CircunscripcionTableTableFilterComposer,
          $$CircunscripcionTableTableOrderingComposer,
          $$CircunscripcionTableTableAnnotationComposer,
          $$CircunscripcionTableTableCreateCompanionBuilder,
          $$CircunscripcionTableTableUpdateCompanionBuilder,
          (CircunscripcionEntity, $$CircunscripcionTableTableReferences),
          CircunscripcionEntity,
          PrefetchHooks Function({bool cdrTableRefs})
        > {
  $$CircunscripcionTableTableTableManager(
    _$AppDatabase db,
    $CircunscripcionTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CircunscripcionTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$CircunscripcionTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CircunscripcionTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> numero = const Value.absent(),
                Value<String> delegado = const Value.absent(),
                Value<String?> zona = const Value.absent(),
                Value<String?> consejoPopular = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CircunscripcionTableCompanion(
                id: id,
                numero: numero,
                delegado: delegado,
                zona: zona,
                consejoPopular: consejoPopular,
                isAvailable: isAvailable,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String numero,
                required String delegado,
                Value<String?> zona = const Value.absent(),
                Value<String?> consejoPopular = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CircunscripcionTableCompanion.insert(
                id: id,
                numero: numero,
                delegado: delegado,
                zona: zona,
                consejoPopular: consejoPopular,
                isAvailable: isAvailable,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CircunscripcionTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({cdrTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cdrTableRefs) db.cdrTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cdrTableRefs)
                    await $_getPrefetchedData<
                      CircunscripcionEntity,
                      $CircunscripcionTableTable,
                      CdrEntity
                    >(
                      currentTable: table,
                      referencedTable: $$CircunscripcionTableTableReferences
                          ._cdrTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CircunscripcionTableTableReferences(
                                db,
                                table,
                                p0,
                              ).cdrTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.circunscripcionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CircunscripcionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CircunscripcionTableTable,
      CircunscripcionEntity,
      $$CircunscripcionTableTableFilterComposer,
      $$CircunscripcionTableTableOrderingComposer,
      $$CircunscripcionTableTableAnnotationComposer,
      $$CircunscripcionTableTableCreateCompanionBuilder,
      $$CircunscripcionTableTableUpdateCompanionBuilder,
      (CircunscripcionEntity, $$CircunscripcionTableTableReferences),
      CircunscripcionEntity,
      PrefetchHooks Function({bool cdrTableRefs})
    >;
typedef $$CdrTableTableCreateCompanionBuilder =
    CdrTableCompanion Function({
      Value<String> id,
      required String numero,
      Value<String?> presidente,
      Value<String?> sector,
      required String circunscripcionId,
      Value<bool> isAvailable,
      Value<int> rowid,
    });
typedef $$CdrTableTableUpdateCompanionBuilder =
    CdrTableCompanion Function({
      Value<String> id,
      Value<String> numero,
      Value<String?> presidente,
      Value<String?> sector,
      Value<String> circunscripcionId,
      Value<bool> isAvailable,
      Value<int> rowid,
    });

final class $$CdrTableTableReferences
    extends BaseReferences<_$AppDatabase, $CdrTableTable, CdrEntity> {
  $$CdrTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CircunscripcionTableTable _circunscripcionIdTable(_$AppDatabase db) =>
      db.circunscripcionTable.createAlias(
        $_aliasNameGenerator(
          db.cdrTable.circunscripcionId,
          db.circunscripcionTable.id,
        ),
      );

  $$CircunscripcionTableTableProcessedTableManager get circunscripcionId {
    final $_column = $_itemColumn<String>('circunscripcion_id')!;

    final manager = $$CircunscripcionTableTableTableManager(
      $_db,
      $_db.circunscripcionTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_circunscripcionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CdrTableTableFilterComposer
    extends Composer<_$AppDatabase, $CdrTableTable> {
  $$CdrTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get presidente => $composableBuilder(
    column: $table.presidente,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sector => $composableBuilder(
    column: $table.sector,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnFilters(column),
  );

  $$CircunscripcionTableTableFilterComposer get circunscripcionId {
    final $$CircunscripcionTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.circunscripcionId,
      referencedTable: $db.circunscripcionTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CircunscripcionTableTableFilterComposer(
            $db: $db,
            $table: $db.circunscripcionTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CdrTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CdrTableTable> {
  $$CdrTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numero => $composableBuilder(
    column: $table.numero,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get presidente => $composableBuilder(
    column: $table.presidente,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sector => $composableBuilder(
    column: $table.sector,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnOrderings(column),
  );

  $$CircunscripcionTableTableOrderingComposer get circunscripcionId {
    final $$CircunscripcionTableTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.circunscripcionId,
          referencedTable: $db.circunscripcionTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CircunscripcionTableTableOrderingComposer(
                $db: $db,
                $table: $db.circunscripcionTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CdrTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CdrTableTable> {
  $$CdrTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get numero =>
      $composableBuilder(column: $table.numero, builder: (column) => column);

  GeneratedColumn<String> get presidente => $composableBuilder(
    column: $table.presidente,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sector =>
      $composableBuilder(column: $table.sector, builder: (column) => column);

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => column,
  );

  $$CircunscripcionTableTableAnnotationComposer get circunscripcionId {
    final $$CircunscripcionTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.circunscripcionId,
          referencedTable: $db.circunscripcionTable,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CircunscripcionTableTableAnnotationComposer(
                $db: $db,
                $table: $db.circunscripcionTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$CdrTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CdrTableTable,
          CdrEntity,
          $$CdrTableTableFilterComposer,
          $$CdrTableTableOrderingComposer,
          $$CdrTableTableAnnotationComposer,
          $$CdrTableTableCreateCompanionBuilder,
          $$CdrTableTableUpdateCompanionBuilder,
          (CdrEntity, $$CdrTableTableReferences),
          CdrEntity,
          PrefetchHooks Function({bool circunscripcionId})
        > {
  $$CdrTableTableTableManager(_$AppDatabase db, $CdrTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CdrTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CdrTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CdrTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> numero = const Value.absent(),
                Value<String?> presidente = const Value.absent(),
                Value<String?> sector = const Value.absent(),
                Value<String> circunscripcionId = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CdrTableCompanion(
                id: id,
                numero: numero,
                presidente: presidente,
                sector: sector,
                circunscripcionId: circunscripcionId,
                isAvailable: isAvailable,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String numero,
                Value<String?> presidente = const Value.absent(),
                Value<String?> sector = const Value.absent(),
                required String circunscripcionId,
                Value<bool> isAvailable = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CdrTableCompanion.insert(
                id: id,
                numero: numero,
                presidente: presidente,
                sector: sector,
                circunscripcionId: circunscripcionId,
                isAvailable: isAvailable,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CdrTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({circunscripcionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (circunscripcionId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.circunscripcionId,
                            referencedTable: $$CdrTableTableReferences
                                ._circunscripcionIdTable(db),
                            referencedColumn:
                                $$CdrTableTableReferences
                                    ._circunscripcionIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CdrTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CdrTableTable,
      CdrEntity,
      $$CdrTableTableFilterComposer,
      $$CdrTableTableOrderingComposer,
      $$CdrTableTableAnnotationComposer,
      $$CdrTableTableCreateCompanionBuilder,
      $$CdrTableTableUpdateCompanionBuilder,
      (CdrEntity, $$CdrTableTableReferences),
      CdrEntity,
      PrefetchHooks Function({bool circunscripcionId})
    >;
typedef $$PersonasTableTableCreateCompanionBuilder =
    PersonasTableCompanion Function({
      Value<int> id,
      required String nombre,
      required int edad,
    });
typedef $$PersonasTableTableUpdateCompanionBuilder =
    PersonasTableCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<int> edad,
    });

class $$PersonasTableTableFilterComposer
    extends Composer<_$AppDatabase, $PersonasTableTable> {
  $$PersonasTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get edad => $composableBuilder(
    column: $table.edad,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PersonasTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonasTableTable> {
  $$PersonasTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get edad => $composableBuilder(
    column: $table.edad,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PersonasTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonasTableTable> {
  $$PersonasTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<int> get edad =>
      $composableBuilder(column: $table.edad, builder: (column) => column);
}

class $$PersonasTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonasTableTable,
          PersonasEntity,
          $$PersonasTableTableFilterComposer,
          $$PersonasTableTableOrderingComposer,
          $$PersonasTableTableAnnotationComposer,
          $$PersonasTableTableCreateCompanionBuilder,
          $$PersonasTableTableUpdateCompanionBuilder,
          (
            PersonasEntity,
            BaseReferences<_$AppDatabase, $PersonasTableTable, PersonasEntity>,
          ),
          PersonasEntity,
          PrefetchHooks Function()
        > {
  $$PersonasTableTableTableManager(_$AppDatabase db, $PersonasTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PersonasTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$PersonasTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PersonasTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<int> edad = const Value.absent(),
              }) => PersonasTableCompanion(id: id, nombre: nombre, edad: edad),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required int edad,
              }) => PersonasTableCompanion.insert(
                id: id,
                nombre: nombre,
                edad: edad,
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

typedef $$PersonasTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonasTableTable,
      PersonasEntity,
      $$PersonasTableTableFilterComposer,
      $$PersonasTableTableOrderingComposer,
      $$PersonasTableTableAnnotationComposer,
      $$PersonasTableTableCreateCompanionBuilder,
      $$PersonasTableTableUpdateCompanionBuilder,
      (
        PersonasEntity,
        BaseReferences<_$AppDatabase, $PersonasTableTable, PersonasEntity>,
      ),
      PersonasEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CircunscripcionTableTableTableManager get circunscripcionTable =>
      $$CircunscripcionTableTableTableManager(_db, _db.circunscripcionTable);
  $$CdrTableTableTableManager get cdrTable =>
      $$CdrTableTableTableManager(_db, _db.cdrTable);
  $$PersonasTableTableTableManager get personasTable =>
      $$PersonasTableTableTableManager(_db, _db.personasTable);
}
