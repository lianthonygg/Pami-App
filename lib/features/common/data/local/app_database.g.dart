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
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v4(),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ciMeta = const VerificationMeta('ci');
  @override
  late final GeneratedColumn<String> ci = GeneratedColumn<String>(
    'ci',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 11,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sexoMeta = const VerificationMeta('sexo');
  @override
  late final GeneratedColumn<String> sexo = GeneratedColumn<String>(
    'sexo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _razaMeta = const VerificationMeta('raza');
  @override
  late final GeneratedColumn<String> raza = GeneratedColumn<String>(
    'raza',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _direccionCiMeta = const VerificationMeta(
    'direccionCi',
  );
  @override
  late final GeneratedColumn<String> direccionCi = GeneratedColumn<String>(
    'direccion_ci',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _direccionViveMeta = const VerificationMeta(
    'direccionVive',
  );
  @override
  late final GeneratedColumn<String> direccionVive = GeneratedColumn<String>(
    'direccion_vive',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _antPPMeta = const VerificationMeta('antPP');
  @override
  late final GeneratedColumn<String> antPP = GeneratedColumn<String>(
    'ant_p_p',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nivelEscolarMeta = const VerificationMeta(
    'nivelEscolar',
  );
  @override
  late final GeneratedColumn<String> nivelEscolar = GeneratedColumn<String>(
    'nivel_escolar',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profesionMeta = const VerificationMeta(
    'profesion',
  );
  @override
  late final GeneratedColumn<String> profesion = GeneratedColumn<String>(
    'profesion',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 300,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _grupoDispensarialMeta = const VerificationMeta(
    'grupoDispensarial',
  );
  @override
  late final GeneratedColumn<String> grupoDispensarial =
      GeneratedColumn<String>(
        'grupo_dispensarial',
        aliasedName,
        false,
        additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 1,
          maxTextLength: 50,
        ),
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _observacionesMeta = const VerificationMeta(
    'observaciones',
  );
  @override
  late final GeneratedColumn<String> observaciones = GeneratedColumn<String>(
    'observaciones',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isControllerMeta = const VerificationMeta(
    'isController',
  );
  @override
  late final GeneratedColumn<bool> isController = GeneratedColumn<bool>(
    'is_controller',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_controller" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  static const VerificationMeta _cdrIdMeta = const VerificationMeta('cdrId');
  @override
  late final GeneratedColumn<String> cdrId = GeneratedColumn<String>(
    'cdr_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cdr_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    ci,
    sexo,
    raza,
    direccionCi,
    direccionVive,
    telefono,
    antPP,
    nivelEscolar,
    profesion,
    grupoDispensarial,
    observaciones,
    isController,
    isAvailable,
    cdrId,
  ];
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
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('ci')) {
      context.handle(_ciMeta, ci.isAcceptableOrUnknown(data['ci']!, _ciMeta));
    } else if (isInserting) {
      context.missing(_ciMeta);
    }
    if (data.containsKey('sexo')) {
      context.handle(
        _sexoMeta,
        sexo.isAcceptableOrUnknown(data['sexo']!, _sexoMeta),
      );
    } else if (isInserting) {
      context.missing(_sexoMeta);
    }
    if (data.containsKey('raza')) {
      context.handle(
        _razaMeta,
        raza.isAcceptableOrUnknown(data['raza']!, _razaMeta),
      );
    } else if (isInserting) {
      context.missing(_razaMeta);
    }
    if (data.containsKey('direccion_ci')) {
      context.handle(
        _direccionCiMeta,
        direccionCi.isAcceptableOrUnknown(
          data['direccion_ci']!,
          _direccionCiMeta,
        ),
      );
    }
    if (data.containsKey('direccion_vive')) {
      context.handle(
        _direccionViveMeta,
        direccionVive.isAcceptableOrUnknown(
          data['direccion_vive']!,
          _direccionViveMeta,
        ),
      );
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    }
    if (data.containsKey('ant_p_p')) {
      context.handle(
        _antPPMeta,
        antPP.isAcceptableOrUnknown(data['ant_p_p']!, _antPPMeta),
      );
    } else if (isInserting) {
      context.missing(_antPPMeta);
    }
    if (data.containsKey('nivel_escolar')) {
      context.handle(
        _nivelEscolarMeta,
        nivelEscolar.isAcceptableOrUnknown(
          data['nivel_escolar']!,
          _nivelEscolarMeta,
        ),
      );
    }
    if (data.containsKey('profesion')) {
      context.handle(
        _profesionMeta,
        profesion.isAcceptableOrUnknown(data['profesion']!, _profesionMeta),
      );
    }
    if (data.containsKey('grupo_dispensarial')) {
      context.handle(
        _grupoDispensarialMeta,
        grupoDispensarial.isAcceptableOrUnknown(
          data['grupo_dispensarial']!,
          _grupoDispensarialMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_grupoDispensarialMeta);
    }
    if (data.containsKey('observaciones')) {
      context.handle(
        _observacionesMeta,
        observaciones.isAcceptableOrUnknown(
          data['observaciones']!,
          _observacionesMeta,
        ),
      );
    }
    if (data.containsKey('is_controller')) {
      context.handle(
        _isControllerMeta,
        isController.isAcceptableOrUnknown(
          data['is_controller']!,
          _isControllerMeta,
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
    if (data.containsKey('cdr_id')) {
      context.handle(
        _cdrIdMeta,
        cdrId.isAcceptableOrUnknown(data['cdr_id']!, _cdrIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cdrIdMeta);
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
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      fullName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}full_name'],
          )!,
      ci:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}ci'],
          )!,
      sexo:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sexo'],
          )!,
      raza:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}raza'],
          )!,
      direccionCi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direccion_ci'],
      ),
      direccionVive: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}direccion_vive'],
      ),
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      ),
      antPP:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}ant_p_p'],
          )!,
      nivelEscolar: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nivel_escolar'],
      ),
      profesion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profesion'],
      ),
      grupoDispensarial:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}grupo_dispensarial'],
          )!,
      observaciones: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}observaciones'],
      ),
      isController:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_controller'],
          )!,
      isAvailable:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_available'],
          )!,
      cdrId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}cdr_id'],
          )!,
    );
  }

  @override
  $PersonasTableTable createAlias(String alias) {
    return $PersonasTableTable(attachedDatabase, alias);
  }
}

class PersonasEntity extends DataClass implements Insertable<PersonasEntity> {
  final String id;
  final String fullName;
  final String ci;
  final String sexo;
  final String raza;
  final String? direccionCi;
  final String? direccionVive;
  final String? telefono;
  final String antPP;
  final String? nivelEscolar;
  final String? profesion;
  final String grupoDispensarial;
  final String? observaciones;
  final bool isController;
  final bool isAvailable;
  final String cdrId;
  const PersonasEntity({
    required this.id,
    required this.fullName,
    required this.ci,
    required this.sexo,
    required this.raza,
    this.direccionCi,
    this.direccionVive,
    this.telefono,
    required this.antPP,
    this.nivelEscolar,
    this.profesion,
    required this.grupoDispensarial,
    this.observaciones,
    required this.isController,
    required this.isAvailable,
    required this.cdrId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['full_name'] = Variable<String>(fullName);
    map['ci'] = Variable<String>(ci);
    map['sexo'] = Variable<String>(sexo);
    map['raza'] = Variable<String>(raza);
    if (!nullToAbsent || direccionCi != null) {
      map['direccion_ci'] = Variable<String>(direccionCi);
    }
    if (!nullToAbsent || direccionVive != null) {
      map['direccion_vive'] = Variable<String>(direccionVive);
    }
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    map['ant_p_p'] = Variable<String>(antPP);
    if (!nullToAbsent || nivelEscolar != null) {
      map['nivel_escolar'] = Variable<String>(nivelEscolar);
    }
    if (!nullToAbsent || profesion != null) {
      map['profesion'] = Variable<String>(profesion);
    }
    map['grupo_dispensarial'] = Variable<String>(grupoDispensarial);
    if (!nullToAbsent || observaciones != null) {
      map['observaciones'] = Variable<String>(observaciones);
    }
    map['is_controller'] = Variable<bool>(isController);
    map['is_available'] = Variable<bool>(isAvailable);
    map['cdr_id'] = Variable<String>(cdrId);
    return map;
  }

  PersonasTableCompanion toCompanion(bool nullToAbsent) {
    return PersonasTableCompanion(
      id: Value(id),
      fullName: Value(fullName),
      ci: Value(ci),
      sexo: Value(sexo),
      raza: Value(raza),
      direccionCi:
          direccionCi == null && nullToAbsent
              ? const Value.absent()
              : Value(direccionCi),
      direccionVive:
          direccionVive == null && nullToAbsent
              ? const Value.absent()
              : Value(direccionVive),
      telefono:
          telefono == null && nullToAbsent
              ? const Value.absent()
              : Value(telefono),
      antPP: Value(antPP),
      nivelEscolar:
          nivelEscolar == null && nullToAbsent
              ? const Value.absent()
              : Value(nivelEscolar),
      profesion:
          profesion == null && nullToAbsent
              ? const Value.absent()
              : Value(profesion),
      grupoDispensarial: Value(grupoDispensarial),
      observaciones:
          observaciones == null && nullToAbsent
              ? const Value.absent()
              : Value(observaciones),
      isController: Value(isController),
      isAvailable: Value(isAvailable),
      cdrId: Value(cdrId),
    );
  }

  factory PersonasEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonasEntity(
      id: serializer.fromJson<String>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      ci: serializer.fromJson<String>(json['ci']),
      sexo: serializer.fromJson<String>(json['sexo']),
      raza: serializer.fromJson<String>(json['raza']),
      direccionCi: serializer.fromJson<String?>(json['direccionCi']),
      direccionVive: serializer.fromJson<String?>(json['direccionVive']),
      telefono: serializer.fromJson<String?>(json['telefono']),
      antPP: serializer.fromJson<String>(json['antPP']),
      nivelEscolar: serializer.fromJson<String?>(json['nivelEscolar']),
      profesion: serializer.fromJson<String?>(json['profesion']),
      grupoDispensarial: serializer.fromJson<String>(json['grupoDispensarial']),
      observaciones: serializer.fromJson<String?>(json['observaciones']),
      isController: serializer.fromJson<bool>(json['isController']),
      isAvailable: serializer.fromJson<bool>(json['isAvailable']),
      cdrId: serializer.fromJson<String>(json['cdrId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fullName': serializer.toJson<String>(fullName),
      'ci': serializer.toJson<String>(ci),
      'sexo': serializer.toJson<String>(sexo),
      'raza': serializer.toJson<String>(raza),
      'direccionCi': serializer.toJson<String?>(direccionCi),
      'direccionVive': serializer.toJson<String?>(direccionVive),
      'telefono': serializer.toJson<String?>(telefono),
      'antPP': serializer.toJson<String>(antPP),
      'nivelEscolar': serializer.toJson<String?>(nivelEscolar),
      'profesion': serializer.toJson<String?>(profesion),
      'grupoDispensarial': serializer.toJson<String>(grupoDispensarial),
      'observaciones': serializer.toJson<String?>(observaciones),
      'isController': serializer.toJson<bool>(isController),
      'isAvailable': serializer.toJson<bool>(isAvailable),
      'cdrId': serializer.toJson<String>(cdrId),
    };
  }

  PersonasEntity copyWith({
    String? id,
    String? fullName,
    String? ci,
    String? sexo,
    String? raza,
    Value<String?> direccionCi = const Value.absent(),
    Value<String?> direccionVive = const Value.absent(),
    Value<String?> telefono = const Value.absent(),
    String? antPP,
    Value<String?> nivelEscolar = const Value.absent(),
    Value<String?> profesion = const Value.absent(),
    String? grupoDispensarial,
    Value<String?> observaciones = const Value.absent(),
    bool? isController,
    bool? isAvailable,
    String? cdrId,
  }) => PersonasEntity(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    ci: ci ?? this.ci,
    sexo: sexo ?? this.sexo,
    raza: raza ?? this.raza,
    direccionCi: direccionCi.present ? direccionCi.value : this.direccionCi,
    direccionVive:
        direccionVive.present ? direccionVive.value : this.direccionVive,
    telefono: telefono.present ? telefono.value : this.telefono,
    antPP: antPP ?? this.antPP,
    nivelEscolar: nivelEscolar.present ? nivelEscolar.value : this.nivelEscolar,
    profesion: profesion.present ? profesion.value : this.profesion,
    grupoDispensarial: grupoDispensarial ?? this.grupoDispensarial,
    observaciones:
        observaciones.present ? observaciones.value : this.observaciones,
    isController: isController ?? this.isController,
    isAvailable: isAvailable ?? this.isAvailable,
    cdrId: cdrId ?? this.cdrId,
  );
  PersonasEntity copyWithCompanion(PersonasTableCompanion data) {
    return PersonasEntity(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      ci: data.ci.present ? data.ci.value : this.ci,
      sexo: data.sexo.present ? data.sexo.value : this.sexo,
      raza: data.raza.present ? data.raza.value : this.raza,
      direccionCi:
          data.direccionCi.present ? data.direccionCi.value : this.direccionCi,
      direccionVive:
          data.direccionVive.present
              ? data.direccionVive.value
              : this.direccionVive,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      antPP: data.antPP.present ? data.antPP.value : this.antPP,
      nivelEscolar:
          data.nivelEscolar.present
              ? data.nivelEscolar.value
              : this.nivelEscolar,
      profesion: data.profesion.present ? data.profesion.value : this.profesion,
      grupoDispensarial:
          data.grupoDispensarial.present
              ? data.grupoDispensarial.value
              : this.grupoDispensarial,
      observaciones:
          data.observaciones.present
              ? data.observaciones.value
              : this.observaciones,
      isController:
          data.isController.present
              ? data.isController.value
              : this.isController,
      isAvailable:
          data.isAvailable.present ? data.isAvailable.value : this.isAvailable,
      cdrId: data.cdrId.present ? data.cdrId.value : this.cdrId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonasEntity(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('ci: $ci, ')
          ..write('sexo: $sexo, ')
          ..write('raza: $raza, ')
          ..write('direccionCi: $direccionCi, ')
          ..write('direccionVive: $direccionVive, ')
          ..write('telefono: $telefono, ')
          ..write('antPP: $antPP, ')
          ..write('nivelEscolar: $nivelEscolar, ')
          ..write('profesion: $profesion, ')
          ..write('grupoDispensarial: $grupoDispensarial, ')
          ..write('observaciones: $observaciones, ')
          ..write('isController: $isController, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('cdrId: $cdrId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    fullName,
    ci,
    sexo,
    raza,
    direccionCi,
    direccionVive,
    telefono,
    antPP,
    nivelEscolar,
    profesion,
    grupoDispensarial,
    observaciones,
    isController,
    isAvailable,
    cdrId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonasEntity &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.ci == this.ci &&
          other.sexo == this.sexo &&
          other.raza == this.raza &&
          other.direccionCi == this.direccionCi &&
          other.direccionVive == this.direccionVive &&
          other.telefono == this.telefono &&
          other.antPP == this.antPP &&
          other.nivelEscolar == this.nivelEscolar &&
          other.profesion == this.profesion &&
          other.grupoDispensarial == this.grupoDispensarial &&
          other.observaciones == this.observaciones &&
          other.isController == this.isController &&
          other.isAvailable == this.isAvailable &&
          other.cdrId == this.cdrId);
}

class PersonasTableCompanion extends UpdateCompanion<PersonasEntity> {
  final Value<String> id;
  final Value<String> fullName;
  final Value<String> ci;
  final Value<String> sexo;
  final Value<String> raza;
  final Value<String?> direccionCi;
  final Value<String?> direccionVive;
  final Value<String?> telefono;
  final Value<String> antPP;
  final Value<String?> nivelEscolar;
  final Value<String?> profesion;
  final Value<String> grupoDispensarial;
  final Value<String?> observaciones;
  final Value<bool> isController;
  final Value<bool> isAvailable;
  final Value<String> cdrId;
  final Value<int> rowid;
  const PersonasTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.ci = const Value.absent(),
    this.sexo = const Value.absent(),
    this.raza = const Value.absent(),
    this.direccionCi = const Value.absent(),
    this.direccionVive = const Value.absent(),
    this.telefono = const Value.absent(),
    this.antPP = const Value.absent(),
    this.nivelEscolar = const Value.absent(),
    this.profesion = const Value.absent(),
    this.grupoDispensarial = const Value.absent(),
    this.observaciones = const Value.absent(),
    this.isController = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.cdrId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PersonasTableCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String ci,
    required String sexo,
    required String raza,
    this.direccionCi = const Value.absent(),
    this.direccionVive = const Value.absent(),
    this.telefono = const Value.absent(),
    required String antPP,
    this.nivelEscolar = const Value.absent(),
    this.profesion = const Value.absent(),
    required String grupoDispensarial,
    this.observaciones = const Value.absent(),
    this.isController = const Value.absent(),
    this.isAvailable = const Value.absent(),
    required String cdrId,
    this.rowid = const Value.absent(),
  }) : fullName = Value(fullName),
       ci = Value(ci),
       sexo = Value(sexo),
       raza = Value(raza),
       antPP = Value(antPP),
       grupoDispensarial = Value(grupoDispensarial),
       cdrId = Value(cdrId);
  static Insertable<PersonasEntity> custom({
    Expression<String>? id,
    Expression<String>? fullName,
    Expression<String>? ci,
    Expression<String>? sexo,
    Expression<String>? raza,
    Expression<String>? direccionCi,
    Expression<String>? direccionVive,
    Expression<String>? telefono,
    Expression<String>? antPP,
    Expression<String>? nivelEscolar,
    Expression<String>? profesion,
    Expression<String>? grupoDispensarial,
    Expression<String>? observaciones,
    Expression<bool>? isController,
    Expression<bool>? isAvailable,
    Expression<String>? cdrId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (ci != null) 'ci': ci,
      if (sexo != null) 'sexo': sexo,
      if (raza != null) 'raza': raza,
      if (direccionCi != null) 'direccion_ci': direccionCi,
      if (direccionVive != null) 'direccion_vive': direccionVive,
      if (telefono != null) 'telefono': telefono,
      if (antPP != null) 'ant_p_p': antPP,
      if (nivelEscolar != null) 'nivel_escolar': nivelEscolar,
      if (profesion != null) 'profesion': profesion,
      if (grupoDispensarial != null) 'grupo_dispensarial': grupoDispensarial,
      if (observaciones != null) 'observaciones': observaciones,
      if (isController != null) 'is_controller': isController,
      if (isAvailable != null) 'is_available': isAvailable,
      if (cdrId != null) 'cdr_id': cdrId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PersonasTableCompanion copyWith({
    Value<String>? id,
    Value<String>? fullName,
    Value<String>? ci,
    Value<String>? sexo,
    Value<String>? raza,
    Value<String?>? direccionCi,
    Value<String?>? direccionVive,
    Value<String?>? telefono,
    Value<String>? antPP,
    Value<String?>? nivelEscolar,
    Value<String?>? profesion,
    Value<String>? grupoDispensarial,
    Value<String?>? observaciones,
    Value<bool>? isController,
    Value<bool>? isAvailable,
    Value<String>? cdrId,
    Value<int>? rowid,
  }) {
    return PersonasTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      ci: ci ?? this.ci,
      sexo: sexo ?? this.sexo,
      raza: raza ?? this.raza,
      direccionCi: direccionCi ?? this.direccionCi,
      direccionVive: direccionVive ?? this.direccionVive,
      telefono: telefono ?? this.telefono,
      antPP: antPP ?? this.antPP,
      nivelEscolar: nivelEscolar ?? this.nivelEscolar,
      profesion: profesion ?? this.profesion,
      grupoDispensarial: grupoDispensarial ?? this.grupoDispensarial,
      observaciones: observaciones ?? this.observaciones,
      isController: isController ?? this.isController,
      isAvailable: isAvailable ?? this.isAvailable,
      cdrId: cdrId ?? this.cdrId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (ci.present) {
      map['ci'] = Variable<String>(ci.value);
    }
    if (sexo.present) {
      map['sexo'] = Variable<String>(sexo.value);
    }
    if (raza.present) {
      map['raza'] = Variable<String>(raza.value);
    }
    if (direccionCi.present) {
      map['direccion_ci'] = Variable<String>(direccionCi.value);
    }
    if (direccionVive.present) {
      map['direccion_vive'] = Variable<String>(direccionVive.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (antPP.present) {
      map['ant_p_p'] = Variable<String>(antPP.value);
    }
    if (nivelEscolar.present) {
      map['nivel_escolar'] = Variable<String>(nivelEscolar.value);
    }
    if (profesion.present) {
      map['profesion'] = Variable<String>(profesion.value);
    }
    if (grupoDispensarial.present) {
      map['grupo_dispensarial'] = Variable<String>(grupoDispensarial.value);
    }
    if (observaciones.present) {
      map['observaciones'] = Variable<String>(observaciones.value);
    }
    if (isController.present) {
      map['is_controller'] = Variable<bool>(isController.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<bool>(isAvailable.value);
    }
    if (cdrId.present) {
      map['cdr_id'] = Variable<String>(cdrId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonasTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('ci: $ci, ')
          ..write('sexo: $sexo, ')
          ..write('raza: $raza, ')
          ..write('direccionCi: $direccionCi, ')
          ..write('direccionVive: $direccionVive, ')
          ..write('telefono: $telefono, ')
          ..write('antPP: $antPP, ')
          ..write('nivelEscolar: $nivelEscolar, ')
          ..write('profesion: $profesion, ')
          ..write('grupoDispensarial: $grupoDispensarial, ')
          ..write('observaciones: $observaciones, ')
          ..write('isController: $isController, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('cdrId: $cdrId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GestanteTableTable extends GestanteTable
    with TableInfo<$GestanteTableTable, GestanteEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GestanteTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _antPpMeta = const VerificationMeta('antPp');
  @override
  late final GeneratedColumn<String> antPp = GeneratedColumn<String>(
    'ant_pp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _observacionesMeta = const VerificationMeta(
    'observaciones',
  );
  @override
  late final GeneratedColumn<String> observaciones = GeneratedColumn<String>(
    'observaciones',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tgCaptacionMeta = const VerificationMeta(
    'tgCaptacion',
  );
  @override
  late final GeneratedColumn<String> tgCaptacion = GeneratedColumn<String>(
    'tg_captacion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tgFinalMeta = const VerificationMeta(
    'tgFinal',
  );
  @override
  late final GeneratedColumn<String> tgFinal = GeneratedColumn<String>(
    'tg_final',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fumMeta = const VerificationMeta('fum');
  @override
  late final GeneratedColumn<DateTime> fum = GeneratedColumn<DateTime>(
    'fum',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gestacionesMeta = const VerificationMeta(
    'gestaciones',
  );
  @override
  late final GeneratedColumn<String> gestaciones = GeneratedColumn<String>(
    'gestaciones',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partosMeta = const VerificationMeta('partos');
  @override
  late final GeneratedColumn<String> partos = GeneratedColumn<String>(
    'partos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _abortosMeta = const VerificationMeta(
    'abortos',
  );
  @override
  late final GeneratedColumn<String> abortos = GeneratedColumn<String>(
    'abortos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cesareasMeta = const VerificationMeta(
    'cesareas',
  );
  @override
  late final GeneratedColumn<String> cesareas = GeneratedColumn<String>(
    'cesareas',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _antPPreterminoMeta = const VerificationMeta(
    'antPPretermino',
  );
  @override
  late final GeneratedColumn<String> antPPretermino = GeneratedColumn<String>(
    'ant_p_pretermino',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaCaptacionMeta = const VerificationMeta(
    'fechaCaptacion',
  );
  @override
  late final GeneratedColumn<DateTime> fechaCaptacion =
      GeneratedColumn<DateTime>(
        'fecha_captacion',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _fechaProbablePartoMeta =
      const VerificationMeta('fechaProbableParto');
  @override
  late final GeneratedColumn<DateTime> fechaProbableParto =
      GeneratedColumn<DateTime>(
        'fecha_probable_parto',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _rciuMeta = const VerificationMeta('rciu');
  @override
  late final GeneratedColumn<String> rciu = GeneratedColumn<String>(
    'rciu',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imcMeta = const VerificationMeta('imc');
  @override
  late final GeneratedColumn<String> imc = GeneratedColumn<String>(
    'imc',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clasificacionRiesgoMeta =
      const VerificationMeta('clasificacionRiesgo');
  @override
  late final GeneratedColumn<int> clasificacionRiesgo = GeneratedColumn<int>(
    'clasificacion_riesgo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personaIdMeta = const VerificationMeta(
    'personaId',
  );
  @override
  late final GeneratedColumn<String> personaId = GeneratedColumn<String>(
    'persona_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES personas_table (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    antPp,
    observaciones,
    tgCaptacion,
    tgFinal,
    fum,
    gestaciones,
    partos,
    abortos,
    cesareas,
    antPPretermino,
    fechaCaptacion,
    fechaProbableParto,
    rciu,
    imc,
    clasificacionRiesgo,
    personaId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gestante_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<GestanteEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ant_pp')) {
      context.handle(
        _antPpMeta,
        antPp.isAcceptableOrUnknown(data['ant_pp']!, _antPpMeta),
      );
    } else if (isInserting) {
      context.missing(_antPpMeta);
    }
    if (data.containsKey('observaciones')) {
      context.handle(
        _observacionesMeta,
        observaciones.isAcceptableOrUnknown(
          data['observaciones']!,
          _observacionesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_observacionesMeta);
    }
    if (data.containsKey('tg_captacion')) {
      context.handle(
        _tgCaptacionMeta,
        tgCaptacion.isAcceptableOrUnknown(
          data['tg_captacion']!,
          _tgCaptacionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tgCaptacionMeta);
    }
    if (data.containsKey('tg_final')) {
      context.handle(
        _tgFinalMeta,
        tgFinal.isAcceptableOrUnknown(data['tg_final']!, _tgFinalMeta),
      );
    } else if (isInserting) {
      context.missing(_tgFinalMeta);
    }
    if (data.containsKey('fum')) {
      context.handle(
        _fumMeta,
        fum.isAcceptableOrUnknown(data['fum']!, _fumMeta),
      );
    } else if (isInserting) {
      context.missing(_fumMeta);
    }
    if (data.containsKey('gestaciones')) {
      context.handle(
        _gestacionesMeta,
        gestaciones.isAcceptableOrUnknown(
          data['gestaciones']!,
          _gestacionesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_gestacionesMeta);
    }
    if (data.containsKey('partos')) {
      context.handle(
        _partosMeta,
        partos.isAcceptableOrUnknown(data['partos']!, _partosMeta),
      );
    } else if (isInserting) {
      context.missing(_partosMeta);
    }
    if (data.containsKey('abortos')) {
      context.handle(
        _abortosMeta,
        abortos.isAcceptableOrUnknown(data['abortos']!, _abortosMeta),
      );
    } else if (isInserting) {
      context.missing(_abortosMeta);
    }
    if (data.containsKey('cesareas')) {
      context.handle(
        _cesareasMeta,
        cesareas.isAcceptableOrUnknown(data['cesareas']!, _cesareasMeta),
      );
    } else if (isInserting) {
      context.missing(_cesareasMeta);
    }
    if (data.containsKey('ant_p_pretermino')) {
      context.handle(
        _antPPreterminoMeta,
        antPPretermino.isAcceptableOrUnknown(
          data['ant_p_pretermino']!,
          _antPPreterminoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_antPPreterminoMeta);
    }
    if (data.containsKey('fecha_captacion')) {
      context.handle(
        _fechaCaptacionMeta,
        fechaCaptacion.isAcceptableOrUnknown(
          data['fecha_captacion']!,
          _fechaCaptacionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fechaCaptacionMeta);
    }
    if (data.containsKey('fecha_probable_parto')) {
      context.handle(
        _fechaProbablePartoMeta,
        fechaProbableParto.isAcceptableOrUnknown(
          data['fecha_probable_parto']!,
          _fechaProbablePartoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fechaProbablePartoMeta);
    }
    if (data.containsKey('rciu')) {
      context.handle(
        _rciuMeta,
        rciu.isAcceptableOrUnknown(data['rciu']!, _rciuMeta),
      );
    } else if (isInserting) {
      context.missing(_rciuMeta);
    }
    if (data.containsKey('imc')) {
      context.handle(
        _imcMeta,
        imc.isAcceptableOrUnknown(data['imc']!, _imcMeta),
      );
    } else if (isInserting) {
      context.missing(_imcMeta);
    }
    if (data.containsKey('clasificacion_riesgo')) {
      context.handle(
        _clasificacionRiesgoMeta,
        clasificacionRiesgo.isAcceptableOrUnknown(
          data['clasificacion_riesgo']!,
          _clasificacionRiesgoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_clasificacionRiesgoMeta);
    }
    if (data.containsKey('persona_id')) {
      context.handle(
        _personaIdMeta,
        personaId.isAcceptableOrUnknown(data['persona_id']!, _personaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GestanteEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GestanteEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      antPp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}ant_pp'],
          )!,
      observaciones:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}observaciones'],
          )!,
      tgCaptacion:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tg_captacion'],
          )!,
      tgFinal:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tg_final'],
          )!,
      fum:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}fum'],
          )!,
      gestaciones:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}gestaciones'],
          )!,
      partos:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}partos'],
          )!,
      abortos:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}abortos'],
          )!,
      cesareas:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}cesareas'],
          )!,
      antPPretermino:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}ant_p_pretermino'],
          )!,
      fechaCaptacion:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}fecha_captacion'],
          )!,
      fechaProbableParto:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}fecha_probable_parto'],
          )!,
      rciu:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}rciu'],
          )!,
      imc:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}imc'],
          )!,
      clasificacionRiesgo:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}clasificacion_riesgo'],
          )!,
      personaId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}persona_id'],
          )!,
    );
  }

  @override
  $GestanteTableTable createAlias(String alias) {
    return $GestanteTableTable(attachedDatabase, alias);
  }
}

class GestanteEntity extends DataClass implements Insertable<GestanteEntity> {
  final String id;
  final String antPp;
  final String observaciones;
  final String tgCaptacion;
  final String tgFinal;
  final DateTime fum;
  final String gestaciones;
  final String partos;
  final String abortos;
  final String cesareas;
  final String antPPretermino;
  final DateTime fechaCaptacion;
  final DateTime fechaProbableParto;
  final String rciu;
  final String imc;
  final int clasificacionRiesgo;
  final String personaId;
  const GestanteEntity({
    required this.id,
    required this.antPp,
    required this.observaciones,
    required this.tgCaptacion,
    required this.tgFinal,
    required this.fum,
    required this.gestaciones,
    required this.partos,
    required this.abortos,
    required this.cesareas,
    required this.antPPretermino,
    required this.fechaCaptacion,
    required this.fechaProbableParto,
    required this.rciu,
    required this.imc,
    required this.clasificacionRiesgo,
    required this.personaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['ant_pp'] = Variable<String>(antPp);
    map['observaciones'] = Variable<String>(observaciones);
    map['tg_captacion'] = Variable<String>(tgCaptacion);
    map['tg_final'] = Variable<String>(tgFinal);
    map['fum'] = Variable<DateTime>(fum);
    map['gestaciones'] = Variable<String>(gestaciones);
    map['partos'] = Variable<String>(partos);
    map['abortos'] = Variable<String>(abortos);
    map['cesareas'] = Variable<String>(cesareas);
    map['ant_p_pretermino'] = Variable<String>(antPPretermino);
    map['fecha_captacion'] = Variable<DateTime>(fechaCaptacion);
    map['fecha_probable_parto'] = Variable<DateTime>(fechaProbableParto);
    map['rciu'] = Variable<String>(rciu);
    map['imc'] = Variable<String>(imc);
    map['clasificacion_riesgo'] = Variable<int>(clasificacionRiesgo);
    map['persona_id'] = Variable<String>(personaId);
    return map;
  }

  GestanteTableCompanion toCompanion(bool nullToAbsent) {
    return GestanteTableCompanion(
      id: Value(id),
      antPp: Value(antPp),
      observaciones: Value(observaciones),
      tgCaptacion: Value(tgCaptacion),
      tgFinal: Value(tgFinal),
      fum: Value(fum),
      gestaciones: Value(gestaciones),
      partos: Value(partos),
      abortos: Value(abortos),
      cesareas: Value(cesareas),
      antPPretermino: Value(antPPretermino),
      fechaCaptacion: Value(fechaCaptacion),
      fechaProbableParto: Value(fechaProbableParto),
      rciu: Value(rciu),
      imc: Value(imc),
      clasificacionRiesgo: Value(clasificacionRiesgo),
      personaId: Value(personaId),
    );
  }

  factory GestanteEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GestanteEntity(
      id: serializer.fromJson<String>(json['id']),
      antPp: serializer.fromJson<String>(json['antPp']),
      observaciones: serializer.fromJson<String>(json['observaciones']),
      tgCaptacion: serializer.fromJson<String>(json['tgCaptacion']),
      tgFinal: serializer.fromJson<String>(json['tgFinal']),
      fum: serializer.fromJson<DateTime>(json['fum']),
      gestaciones: serializer.fromJson<String>(json['gestaciones']),
      partos: serializer.fromJson<String>(json['partos']),
      abortos: serializer.fromJson<String>(json['abortos']),
      cesareas: serializer.fromJson<String>(json['cesareas']),
      antPPretermino: serializer.fromJson<String>(json['antPPretermino']),
      fechaCaptacion: serializer.fromJson<DateTime>(json['fechaCaptacion']),
      fechaProbableParto: serializer.fromJson<DateTime>(
        json['fechaProbableParto'],
      ),
      rciu: serializer.fromJson<String>(json['rciu']),
      imc: serializer.fromJson<String>(json['imc']),
      clasificacionRiesgo: serializer.fromJson<int>(
        json['clasificacionRiesgo'],
      ),
      personaId: serializer.fromJson<String>(json['personaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'antPp': serializer.toJson<String>(antPp),
      'observaciones': serializer.toJson<String>(observaciones),
      'tgCaptacion': serializer.toJson<String>(tgCaptacion),
      'tgFinal': serializer.toJson<String>(tgFinal),
      'fum': serializer.toJson<DateTime>(fum),
      'gestaciones': serializer.toJson<String>(gestaciones),
      'partos': serializer.toJson<String>(partos),
      'abortos': serializer.toJson<String>(abortos),
      'cesareas': serializer.toJson<String>(cesareas),
      'antPPretermino': serializer.toJson<String>(antPPretermino),
      'fechaCaptacion': serializer.toJson<DateTime>(fechaCaptacion),
      'fechaProbableParto': serializer.toJson<DateTime>(fechaProbableParto),
      'rciu': serializer.toJson<String>(rciu),
      'imc': serializer.toJson<String>(imc),
      'clasificacionRiesgo': serializer.toJson<int>(clasificacionRiesgo),
      'personaId': serializer.toJson<String>(personaId),
    };
  }

  GestanteEntity copyWith({
    String? id,
    String? antPp,
    String? observaciones,
    String? tgCaptacion,
    String? tgFinal,
    DateTime? fum,
    String? gestaciones,
    String? partos,
    String? abortos,
    String? cesareas,
    String? antPPretermino,
    DateTime? fechaCaptacion,
    DateTime? fechaProbableParto,
    String? rciu,
    String? imc,
    int? clasificacionRiesgo,
    String? personaId,
  }) => GestanteEntity(
    id: id ?? this.id,
    antPp: antPp ?? this.antPp,
    observaciones: observaciones ?? this.observaciones,
    tgCaptacion: tgCaptacion ?? this.tgCaptacion,
    tgFinal: tgFinal ?? this.tgFinal,
    fum: fum ?? this.fum,
    gestaciones: gestaciones ?? this.gestaciones,
    partos: partos ?? this.partos,
    abortos: abortos ?? this.abortos,
    cesareas: cesareas ?? this.cesareas,
    antPPretermino: antPPretermino ?? this.antPPretermino,
    fechaCaptacion: fechaCaptacion ?? this.fechaCaptacion,
    fechaProbableParto: fechaProbableParto ?? this.fechaProbableParto,
    rciu: rciu ?? this.rciu,
    imc: imc ?? this.imc,
    clasificacionRiesgo: clasificacionRiesgo ?? this.clasificacionRiesgo,
    personaId: personaId ?? this.personaId,
  );
  GestanteEntity copyWithCompanion(GestanteTableCompanion data) {
    return GestanteEntity(
      id: data.id.present ? data.id.value : this.id,
      antPp: data.antPp.present ? data.antPp.value : this.antPp,
      observaciones:
          data.observaciones.present
              ? data.observaciones.value
              : this.observaciones,
      tgCaptacion:
          data.tgCaptacion.present ? data.tgCaptacion.value : this.tgCaptacion,
      tgFinal: data.tgFinal.present ? data.tgFinal.value : this.tgFinal,
      fum: data.fum.present ? data.fum.value : this.fum,
      gestaciones:
          data.gestaciones.present ? data.gestaciones.value : this.gestaciones,
      partos: data.partos.present ? data.partos.value : this.partos,
      abortos: data.abortos.present ? data.abortos.value : this.abortos,
      cesareas: data.cesareas.present ? data.cesareas.value : this.cesareas,
      antPPretermino:
          data.antPPretermino.present
              ? data.antPPretermino.value
              : this.antPPretermino,
      fechaCaptacion:
          data.fechaCaptacion.present
              ? data.fechaCaptacion.value
              : this.fechaCaptacion,
      fechaProbableParto:
          data.fechaProbableParto.present
              ? data.fechaProbableParto.value
              : this.fechaProbableParto,
      rciu: data.rciu.present ? data.rciu.value : this.rciu,
      imc: data.imc.present ? data.imc.value : this.imc,
      clasificacionRiesgo:
          data.clasificacionRiesgo.present
              ? data.clasificacionRiesgo.value
              : this.clasificacionRiesgo,
      personaId: data.personaId.present ? data.personaId.value : this.personaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GestanteEntity(')
          ..write('id: $id, ')
          ..write('antPp: $antPp, ')
          ..write('observaciones: $observaciones, ')
          ..write('tgCaptacion: $tgCaptacion, ')
          ..write('tgFinal: $tgFinal, ')
          ..write('fum: $fum, ')
          ..write('gestaciones: $gestaciones, ')
          ..write('partos: $partos, ')
          ..write('abortos: $abortos, ')
          ..write('cesareas: $cesareas, ')
          ..write('antPPretermino: $antPPretermino, ')
          ..write('fechaCaptacion: $fechaCaptacion, ')
          ..write('fechaProbableParto: $fechaProbableParto, ')
          ..write('rciu: $rciu, ')
          ..write('imc: $imc, ')
          ..write('clasificacionRiesgo: $clasificacionRiesgo, ')
          ..write('personaId: $personaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    antPp,
    observaciones,
    tgCaptacion,
    tgFinal,
    fum,
    gestaciones,
    partos,
    abortos,
    cesareas,
    antPPretermino,
    fechaCaptacion,
    fechaProbableParto,
    rciu,
    imc,
    clasificacionRiesgo,
    personaId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GestanteEntity &&
          other.id == this.id &&
          other.antPp == this.antPp &&
          other.observaciones == this.observaciones &&
          other.tgCaptacion == this.tgCaptacion &&
          other.tgFinal == this.tgFinal &&
          other.fum == this.fum &&
          other.gestaciones == this.gestaciones &&
          other.partos == this.partos &&
          other.abortos == this.abortos &&
          other.cesareas == this.cesareas &&
          other.antPPretermino == this.antPPretermino &&
          other.fechaCaptacion == this.fechaCaptacion &&
          other.fechaProbableParto == this.fechaProbableParto &&
          other.rciu == this.rciu &&
          other.imc == this.imc &&
          other.clasificacionRiesgo == this.clasificacionRiesgo &&
          other.personaId == this.personaId);
}

class GestanteTableCompanion extends UpdateCompanion<GestanteEntity> {
  final Value<String> id;
  final Value<String> antPp;
  final Value<String> observaciones;
  final Value<String> tgCaptacion;
  final Value<String> tgFinal;
  final Value<DateTime> fum;
  final Value<String> gestaciones;
  final Value<String> partos;
  final Value<String> abortos;
  final Value<String> cesareas;
  final Value<String> antPPretermino;
  final Value<DateTime> fechaCaptacion;
  final Value<DateTime> fechaProbableParto;
  final Value<String> rciu;
  final Value<String> imc;
  final Value<int> clasificacionRiesgo;
  final Value<String> personaId;
  final Value<int> rowid;
  const GestanteTableCompanion({
    this.id = const Value.absent(),
    this.antPp = const Value.absent(),
    this.observaciones = const Value.absent(),
    this.tgCaptacion = const Value.absent(),
    this.tgFinal = const Value.absent(),
    this.fum = const Value.absent(),
    this.gestaciones = const Value.absent(),
    this.partos = const Value.absent(),
    this.abortos = const Value.absent(),
    this.cesareas = const Value.absent(),
    this.antPPretermino = const Value.absent(),
    this.fechaCaptacion = const Value.absent(),
    this.fechaProbableParto = const Value.absent(),
    this.rciu = const Value.absent(),
    this.imc = const Value.absent(),
    this.clasificacionRiesgo = const Value.absent(),
    this.personaId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GestanteTableCompanion.insert({
    this.id = const Value.absent(),
    required String antPp,
    required String observaciones,
    required String tgCaptacion,
    required String tgFinal,
    required DateTime fum,
    required String gestaciones,
    required String partos,
    required String abortos,
    required String cesareas,
    required String antPPretermino,
    required DateTime fechaCaptacion,
    required DateTime fechaProbableParto,
    required String rciu,
    required String imc,
    required int clasificacionRiesgo,
    required String personaId,
    this.rowid = const Value.absent(),
  }) : antPp = Value(antPp),
       observaciones = Value(observaciones),
       tgCaptacion = Value(tgCaptacion),
       tgFinal = Value(tgFinal),
       fum = Value(fum),
       gestaciones = Value(gestaciones),
       partos = Value(partos),
       abortos = Value(abortos),
       cesareas = Value(cesareas),
       antPPretermino = Value(antPPretermino),
       fechaCaptacion = Value(fechaCaptacion),
       fechaProbableParto = Value(fechaProbableParto),
       rciu = Value(rciu),
       imc = Value(imc),
       clasificacionRiesgo = Value(clasificacionRiesgo),
       personaId = Value(personaId);
  static Insertable<GestanteEntity> custom({
    Expression<String>? id,
    Expression<String>? antPp,
    Expression<String>? observaciones,
    Expression<String>? tgCaptacion,
    Expression<String>? tgFinal,
    Expression<DateTime>? fum,
    Expression<String>? gestaciones,
    Expression<String>? partos,
    Expression<String>? abortos,
    Expression<String>? cesareas,
    Expression<String>? antPPretermino,
    Expression<DateTime>? fechaCaptacion,
    Expression<DateTime>? fechaProbableParto,
    Expression<String>? rciu,
    Expression<String>? imc,
    Expression<int>? clasificacionRiesgo,
    Expression<String>? personaId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (antPp != null) 'ant_pp': antPp,
      if (observaciones != null) 'observaciones': observaciones,
      if (tgCaptacion != null) 'tg_captacion': tgCaptacion,
      if (tgFinal != null) 'tg_final': tgFinal,
      if (fum != null) 'fum': fum,
      if (gestaciones != null) 'gestaciones': gestaciones,
      if (partos != null) 'partos': partos,
      if (abortos != null) 'abortos': abortos,
      if (cesareas != null) 'cesareas': cesareas,
      if (antPPretermino != null) 'ant_p_pretermino': antPPretermino,
      if (fechaCaptacion != null) 'fecha_captacion': fechaCaptacion,
      if (fechaProbableParto != null)
        'fecha_probable_parto': fechaProbableParto,
      if (rciu != null) 'rciu': rciu,
      if (imc != null) 'imc': imc,
      if (clasificacionRiesgo != null)
        'clasificacion_riesgo': clasificacionRiesgo,
      if (personaId != null) 'persona_id': personaId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GestanteTableCompanion copyWith({
    Value<String>? id,
    Value<String>? antPp,
    Value<String>? observaciones,
    Value<String>? tgCaptacion,
    Value<String>? tgFinal,
    Value<DateTime>? fum,
    Value<String>? gestaciones,
    Value<String>? partos,
    Value<String>? abortos,
    Value<String>? cesareas,
    Value<String>? antPPretermino,
    Value<DateTime>? fechaCaptacion,
    Value<DateTime>? fechaProbableParto,
    Value<String>? rciu,
    Value<String>? imc,
    Value<int>? clasificacionRiesgo,
    Value<String>? personaId,
    Value<int>? rowid,
  }) {
    return GestanteTableCompanion(
      id: id ?? this.id,
      antPp: antPp ?? this.antPp,
      observaciones: observaciones ?? this.observaciones,
      tgCaptacion: tgCaptacion ?? this.tgCaptacion,
      tgFinal: tgFinal ?? this.tgFinal,
      fum: fum ?? this.fum,
      gestaciones: gestaciones ?? this.gestaciones,
      partos: partos ?? this.partos,
      abortos: abortos ?? this.abortos,
      cesareas: cesareas ?? this.cesareas,
      antPPretermino: antPPretermino ?? this.antPPretermino,
      fechaCaptacion: fechaCaptacion ?? this.fechaCaptacion,
      fechaProbableParto: fechaProbableParto ?? this.fechaProbableParto,
      rciu: rciu ?? this.rciu,
      imc: imc ?? this.imc,
      clasificacionRiesgo: clasificacionRiesgo ?? this.clasificacionRiesgo,
      personaId: personaId ?? this.personaId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (antPp.present) {
      map['ant_pp'] = Variable<String>(antPp.value);
    }
    if (observaciones.present) {
      map['observaciones'] = Variable<String>(observaciones.value);
    }
    if (tgCaptacion.present) {
      map['tg_captacion'] = Variable<String>(tgCaptacion.value);
    }
    if (tgFinal.present) {
      map['tg_final'] = Variable<String>(tgFinal.value);
    }
    if (fum.present) {
      map['fum'] = Variable<DateTime>(fum.value);
    }
    if (gestaciones.present) {
      map['gestaciones'] = Variable<String>(gestaciones.value);
    }
    if (partos.present) {
      map['partos'] = Variable<String>(partos.value);
    }
    if (abortos.present) {
      map['abortos'] = Variable<String>(abortos.value);
    }
    if (cesareas.present) {
      map['cesareas'] = Variable<String>(cesareas.value);
    }
    if (antPPretermino.present) {
      map['ant_p_pretermino'] = Variable<String>(antPPretermino.value);
    }
    if (fechaCaptacion.present) {
      map['fecha_captacion'] = Variable<DateTime>(fechaCaptacion.value);
    }
    if (fechaProbableParto.present) {
      map['fecha_probable_parto'] = Variable<DateTime>(
        fechaProbableParto.value,
      );
    }
    if (rciu.present) {
      map['rciu'] = Variable<String>(rciu.value);
    }
    if (imc.present) {
      map['imc'] = Variable<String>(imc.value);
    }
    if (clasificacionRiesgo.present) {
      map['clasificacion_riesgo'] = Variable<int>(clasificacionRiesgo.value);
    }
    if (personaId.present) {
      map['persona_id'] = Variable<String>(personaId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GestanteTableCompanion(')
          ..write('id: $id, ')
          ..write('antPp: $antPp, ')
          ..write('observaciones: $observaciones, ')
          ..write('tgCaptacion: $tgCaptacion, ')
          ..write('tgFinal: $tgFinal, ')
          ..write('fum: $fum, ')
          ..write('gestaciones: $gestaciones, ')
          ..write('partos: $partos, ')
          ..write('abortos: $abortos, ')
          ..write('cesareas: $cesareas, ')
          ..write('antPPretermino: $antPPretermino, ')
          ..write('fechaCaptacion: $fechaCaptacion, ')
          ..write('fechaProbableParto: $fechaProbableParto, ')
          ..write('rciu: $rciu, ')
          ..write('imc: $imc, ')
          ..write('clasificacionRiesgo: $clasificacionRiesgo, ')
          ..write('personaId: $personaId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PuerperaTableTable extends PuerperaTable
    with TableInfo<$PuerperaTableTable, PuerperaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuerperaTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _antPpMeta = const VerificationMeta('antPp');
  @override
  late final GeneratedColumn<String> antPp = GeneratedColumn<String>(
    'ant_pp',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _observacionesMeta = const VerificationMeta(
    'observaciones',
  );
  @override
  late final GeneratedColumn<String> observaciones = GeneratedColumn<String>(
    'observaciones',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gestacionesMeta = const VerificationMeta(
    'gestaciones',
  );
  @override
  late final GeneratedColumn<String> gestaciones = GeneratedColumn<String>(
    'gestaciones',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _partosMeta = const VerificationMeta('partos');
  @override
  late final GeneratedColumn<String> partos = GeneratedColumn<String>(
    'partos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _abortosMeta = const VerificationMeta(
    'abortos',
  );
  @override
  late final GeneratedColumn<String> abortos = GeneratedColumn<String>(
    'abortos',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cesareasMeta = const VerificationMeta(
    'cesareas',
  );
  @override
  late final GeneratedColumn<String> cesareas = GeneratedColumn<String>(
    'cesareas',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _antPPreterminoMeta = const VerificationMeta(
    'antPPretermino',
  );
  @override
  late final GeneratedColumn<String> antPPretermino = GeneratedColumn<String>(
    'ant_p_pretermino',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoPartoMeta = const VerificationMeta(
    'tipoParto',
  );
  @override
  late final GeneratedColumn<int> tipoParto = GeneratedColumn<int>(
    'tipo_parto',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _personaIdMeta = const VerificationMeta(
    'personaId',
  );
  @override
  late final GeneratedColumn<String> personaId = GeneratedColumn<String>(
    'persona_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES personas_table (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    antPp,
    observaciones,
    gestaciones,
    partos,
    abortos,
    cesareas,
    antPPretermino,
    tipoParto,
    personaId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'puerpera_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PuerperaEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ant_pp')) {
      context.handle(
        _antPpMeta,
        antPp.isAcceptableOrUnknown(data['ant_pp']!, _antPpMeta),
      );
    } else if (isInserting) {
      context.missing(_antPpMeta);
    }
    if (data.containsKey('observaciones')) {
      context.handle(
        _observacionesMeta,
        observaciones.isAcceptableOrUnknown(
          data['observaciones']!,
          _observacionesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_observacionesMeta);
    }
    if (data.containsKey('gestaciones')) {
      context.handle(
        _gestacionesMeta,
        gestaciones.isAcceptableOrUnknown(
          data['gestaciones']!,
          _gestacionesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_gestacionesMeta);
    }
    if (data.containsKey('partos')) {
      context.handle(
        _partosMeta,
        partos.isAcceptableOrUnknown(data['partos']!, _partosMeta),
      );
    } else if (isInserting) {
      context.missing(_partosMeta);
    }
    if (data.containsKey('abortos')) {
      context.handle(
        _abortosMeta,
        abortos.isAcceptableOrUnknown(data['abortos']!, _abortosMeta),
      );
    } else if (isInserting) {
      context.missing(_abortosMeta);
    }
    if (data.containsKey('cesareas')) {
      context.handle(
        _cesareasMeta,
        cesareas.isAcceptableOrUnknown(data['cesareas']!, _cesareasMeta),
      );
    } else if (isInserting) {
      context.missing(_cesareasMeta);
    }
    if (data.containsKey('ant_p_pretermino')) {
      context.handle(
        _antPPreterminoMeta,
        antPPretermino.isAcceptableOrUnknown(
          data['ant_p_pretermino']!,
          _antPPreterminoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_antPPreterminoMeta);
    }
    if (data.containsKey('tipo_parto')) {
      context.handle(
        _tipoPartoMeta,
        tipoParto.isAcceptableOrUnknown(data['tipo_parto']!, _tipoPartoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoPartoMeta);
    }
    if (data.containsKey('persona_id')) {
      context.handle(
        _personaIdMeta,
        personaId.isAcceptableOrUnknown(data['persona_id']!, _personaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_personaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PuerperaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PuerperaEntity(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      antPp:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}ant_pp'],
          )!,
      observaciones:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}observaciones'],
          )!,
      gestaciones:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}gestaciones'],
          )!,
      partos:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}partos'],
          )!,
      abortos:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}abortos'],
          )!,
      cesareas:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}cesareas'],
          )!,
      antPPretermino:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}ant_p_pretermino'],
          )!,
      tipoParto:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}tipo_parto'],
          )!,
      personaId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}persona_id'],
          )!,
    );
  }

  @override
  $PuerperaTableTable createAlias(String alias) {
    return $PuerperaTableTable(attachedDatabase, alias);
  }
}

class PuerperaEntity extends DataClass implements Insertable<PuerperaEntity> {
  final String id;
  final String antPp;
  final String observaciones;
  final String gestaciones;
  final String partos;
  final String abortos;
  final String cesareas;
  final String antPPretermino;
  final int tipoParto;
  final String personaId;
  const PuerperaEntity({
    required this.id,
    required this.antPp,
    required this.observaciones,
    required this.gestaciones,
    required this.partos,
    required this.abortos,
    required this.cesareas,
    required this.antPPretermino,
    required this.tipoParto,
    required this.personaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['ant_pp'] = Variable<String>(antPp);
    map['observaciones'] = Variable<String>(observaciones);
    map['gestaciones'] = Variable<String>(gestaciones);
    map['partos'] = Variable<String>(partos);
    map['abortos'] = Variable<String>(abortos);
    map['cesareas'] = Variable<String>(cesareas);
    map['ant_p_pretermino'] = Variable<String>(antPPretermino);
    map['tipo_parto'] = Variable<int>(tipoParto);
    map['persona_id'] = Variable<String>(personaId);
    return map;
  }

  PuerperaTableCompanion toCompanion(bool nullToAbsent) {
    return PuerperaTableCompanion(
      id: Value(id),
      antPp: Value(antPp),
      observaciones: Value(observaciones),
      gestaciones: Value(gestaciones),
      partos: Value(partos),
      abortos: Value(abortos),
      cesareas: Value(cesareas),
      antPPretermino: Value(antPPretermino),
      tipoParto: Value(tipoParto),
      personaId: Value(personaId),
    );
  }

  factory PuerperaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PuerperaEntity(
      id: serializer.fromJson<String>(json['id']),
      antPp: serializer.fromJson<String>(json['antPp']),
      observaciones: serializer.fromJson<String>(json['observaciones']),
      gestaciones: serializer.fromJson<String>(json['gestaciones']),
      partos: serializer.fromJson<String>(json['partos']),
      abortos: serializer.fromJson<String>(json['abortos']),
      cesareas: serializer.fromJson<String>(json['cesareas']),
      antPPretermino: serializer.fromJson<String>(json['antPPretermino']),
      tipoParto: serializer.fromJson<int>(json['tipoParto']),
      personaId: serializer.fromJson<String>(json['personaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'antPp': serializer.toJson<String>(antPp),
      'observaciones': serializer.toJson<String>(observaciones),
      'gestaciones': serializer.toJson<String>(gestaciones),
      'partos': serializer.toJson<String>(partos),
      'abortos': serializer.toJson<String>(abortos),
      'cesareas': serializer.toJson<String>(cesareas),
      'antPPretermino': serializer.toJson<String>(antPPretermino),
      'tipoParto': serializer.toJson<int>(tipoParto),
      'personaId': serializer.toJson<String>(personaId),
    };
  }

  PuerperaEntity copyWith({
    String? id,
    String? antPp,
    String? observaciones,
    String? gestaciones,
    String? partos,
    String? abortos,
    String? cesareas,
    String? antPPretermino,
    int? tipoParto,
    String? personaId,
  }) => PuerperaEntity(
    id: id ?? this.id,
    antPp: antPp ?? this.antPp,
    observaciones: observaciones ?? this.observaciones,
    gestaciones: gestaciones ?? this.gestaciones,
    partos: partos ?? this.partos,
    abortos: abortos ?? this.abortos,
    cesareas: cesareas ?? this.cesareas,
    antPPretermino: antPPretermino ?? this.antPPretermino,
    tipoParto: tipoParto ?? this.tipoParto,
    personaId: personaId ?? this.personaId,
  );
  PuerperaEntity copyWithCompanion(PuerperaTableCompanion data) {
    return PuerperaEntity(
      id: data.id.present ? data.id.value : this.id,
      antPp: data.antPp.present ? data.antPp.value : this.antPp,
      observaciones:
          data.observaciones.present
              ? data.observaciones.value
              : this.observaciones,
      gestaciones:
          data.gestaciones.present ? data.gestaciones.value : this.gestaciones,
      partos: data.partos.present ? data.partos.value : this.partos,
      abortos: data.abortos.present ? data.abortos.value : this.abortos,
      cesareas: data.cesareas.present ? data.cesareas.value : this.cesareas,
      antPPretermino:
          data.antPPretermino.present
              ? data.antPPretermino.value
              : this.antPPretermino,
      tipoParto: data.tipoParto.present ? data.tipoParto.value : this.tipoParto,
      personaId: data.personaId.present ? data.personaId.value : this.personaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PuerperaEntity(')
          ..write('id: $id, ')
          ..write('antPp: $antPp, ')
          ..write('observaciones: $observaciones, ')
          ..write('gestaciones: $gestaciones, ')
          ..write('partos: $partos, ')
          ..write('abortos: $abortos, ')
          ..write('cesareas: $cesareas, ')
          ..write('antPPretermino: $antPPretermino, ')
          ..write('tipoParto: $tipoParto, ')
          ..write('personaId: $personaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    antPp,
    observaciones,
    gestaciones,
    partos,
    abortos,
    cesareas,
    antPPretermino,
    tipoParto,
    personaId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PuerperaEntity &&
          other.id == this.id &&
          other.antPp == this.antPp &&
          other.observaciones == this.observaciones &&
          other.gestaciones == this.gestaciones &&
          other.partos == this.partos &&
          other.abortos == this.abortos &&
          other.cesareas == this.cesareas &&
          other.antPPretermino == this.antPPretermino &&
          other.tipoParto == this.tipoParto &&
          other.personaId == this.personaId);
}

class PuerperaTableCompanion extends UpdateCompanion<PuerperaEntity> {
  final Value<String> id;
  final Value<String> antPp;
  final Value<String> observaciones;
  final Value<String> gestaciones;
  final Value<String> partos;
  final Value<String> abortos;
  final Value<String> cesareas;
  final Value<String> antPPretermino;
  final Value<int> tipoParto;
  final Value<String> personaId;
  final Value<int> rowid;
  const PuerperaTableCompanion({
    this.id = const Value.absent(),
    this.antPp = const Value.absent(),
    this.observaciones = const Value.absent(),
    this.gestaciones = const Value.absent(),
    this.partos = const Value.absent(),
    this.abortos = const Value.absent(),
    this.cesareas = const Value.absent(),
    this.antPPretermino = const Value.absent(),
    this.tipoParto = const Value.absent(),
    this.personaId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PuerperaTableCompanion.insert({
    this.id = const Value.absent(),
    required String antPp,
    required String observaciones,
    required String gestaciones,
    required String partos,
    required String abortos,
    required String cesareas,
    required String antPPretermino,
    required int tipoParto,
    required String personaId,
    this.rowid = const Value.absent(),
  }) : antPp = Value(antPp),
       observaciones = Value(observaciones),
       gestaciones = Value(gestaciones),
       partos = Value(partos),
       abortos = Value(abortos),
       cesareas = Value(cesareas),
       antPPretermino = Value(antPPretermino),
       tipoParto = Value(tipoParto),
       personaId = Value(personaId);
  static Insertable<PuerperaEntity> custom({
    Expression<String>? id,
    Expression<String>? antPp,
    Expression<String>? observaciones,
    Expression<String>? gestaciones,
    Expression<String>? partos,
    Expression<String>? abortos,
    Expression<String>? cesareas,
    Expression<String>? antPPretermino,
    Expression<int>? tipoParto,
    Expression<String>? personaId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (antPp != null) 'ant_pp': antPp,
      if (observaciones != null) 'observaciones': observaciones,
      if (gestaciones != null) 'gestaciones': gestaciones,
      if (partos != null) 'partos': partos,
      if (abortos != null) 'abortos': abortos,
      if (cesareas != null) 'cesareas': cesareas,
      if (antPPretermino != null) 'ant_p_pretermino': antPPretermino,
      if (tipoParto != null) 'tipo_parto': tipoParto,
      if (personaId != null) 'persona_id': personaId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PuerperaTableCompanion copyWith({
    Value<String>? id,
    Value<String>? antPp,
    Value<String>? observaciones,
    Value<String>? gestaciones,
    Value<String>? partos,
    Value<String>? abortos,
    Value<String>? cesareas,
    Value<String>? antPPretermino,
    Value<int>? tipoParto,
    Value<String>? personaId,
    Value<int>? rowid,
  }) {
    return PuerperaTableCompanion(
      id: id ?? this.id,
      antPp: antPp ?? this.antPp,
      observaciones: observaciones ?? this.observaciones,
      gestaciones: gestaciones ?? this.gestaciones,
      partos: partos ?? this.partos,
      abortos: abortos ?? this.abortos,
      cesareas: cesareas ?? this.cesareas,
      antPPretermino: antPPretermino ?? this.antPPretermino,
      tipoParto: tipoParto ?? this.tipoParto,
      personaId: personaId ?? this.personaId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (antPp.present) {
      map['ant_pp'] = Variable<String>(antPp.value);
    }
    if (observaciones.present) {
      map['observaciones'] = Variable<String>(observaciones.value);
    }
    if (gestaciones.present) {
      map['gestaciones'] = Variable<String>(gestaciones.value);
    }
    if (partos.present) {
      map['partos'] = Variable<String>(partos.value);
    }
    if (abortos.present) {
      map['abortos'] = Variable<String>(abortos.value);
    }
    if (cesareas.present) {
      map['cesareas'] = Variable<String>(cesareas.value);
    }
    if (antPPretermino.present) {
      map['ant_p_pretermino'] = Variable<String>(antPPretermino.value);
    }
    if (tipoParto.present) {
      map['tipo_parto'] = Variable<int>(tipoParto.value);
    }
    if (personaId.present) {
      map['persona_id'] = Variable<String>(personaId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuerperaTableCompanion(')
          ..write('id: $id, ')
          ..write('antPp: $antPp, ')
          ..write('observaciones: $observaciones, ')
          ..write('gestaciones: $gestaciones, ')
          ..write('partos: $partos, ')
          ..write('abortos: $abortos, ')
          ..write('cesareas: $cesareas, ')
          ..write('antPPretermino: $antPPretermino, ')
          ..write('tipoParto: $tipoParto, ')
          ..write('personaId: $personaId, ')
          ..write('rowid: $rowid')
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
  late final $GestanteTableTable gestanteTable = $GestanteTableTable(this);
  late final $PuerperaTableTable puerperaTable = $PuerperaTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    circunscripcionTable,
    cdrTable,
    personasTable,
    gestanteTable,
    puerperaTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'personas_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('gestante_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'personas_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('puerpera_table', kind: UpdateKind.delete)],
    ),
  ]);
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

  static MultiTypedResultKey<$PersonasTableTable, List<PersonasEntity>>
  _personasTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.personasTable,
    aliasName: $_aliasNameGenerator(db.cdrTable.id, db.personasTable.cdrId),
  );

  $$PersonasTableTableProcessedTableManager get personasTableRefs {
    final manager = $$PersonasTableTableTableManager(
      $_db,
      $_db.personasTable,
    ).filter((f) => f.cdrId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_personasTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  Expression<bool> personasTableRefs(
    Expression<bool> Function($$PersonasTableTableFilterComposer f) f,
  ) {
    final $$PersonasTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.personasTable,
      getReferencedColumn: (t) => t.cdrId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonasTableTableFilterComposer(
            $db: $db,
            $table: $db.personasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  Expression<T> personasTableRefs<T extends Object>(
    Expression<T> Function($$PersonasTableTableAnnotationComposer a) f,
  ) {
    final $$PersonasTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.personasTable,
      getReferencedColumn: (t) => t.cdrId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonasTableTableAnnotationComposer(
            $db: $db,
            $table: $db.personasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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
          PrefetchHooks Function({
            bool circunscripcionId,
            bool personasTableRefs,
          })
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
          prefetchHooksCallback: ({
            circunscripcionId = false,
            personasTableRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (personasTableRefs) db.personasTable,
              ],
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
                return [
                  if (personasTableRefs)
                    await $_getPrefetchedData<
                      CdrEntity,
                      $CdrTableTable,
                      PersonasEntity
                    >(
                      currentTable: table,
                      referencedTable: $$CdrTableTableReferences
                          ._personasTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$CdrTableTableReferences(
                                db,
                                table,
                                p0,
                              ).personasTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.cdrId == item.id),
                      typedResults: items,
                    ),
                ];
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
      PrefetchHooks Function({bool circunscripcionId, bool personasTableRefs})
    >;
typedef $$PersonasTableTableCreateCompanionBuilder =
    PersonasTableCompanion Function({
      Value<String> id,
      required String fullName,
      required String ci,
      required String sexo,
      required String raza,
      Value<String?> direccionCi,
      Value<String?> direccionVive,
      Value<String?> telefono,
      required String antPP,
      Value<String?> nivelEscolar,
      Value<String?> profesion,
      required String grupoDispensarial,
      Value<String?> observaciones,
      Value<bool> isController,
      Value<bool> isAvailable,
      required String cdrId,
      Value<int> rowid,
    });
typedef $$PersonasTableTableUpdateCompanionBuilder =
    PersonasTableCompanion Function({
      Value<String> id,
      Value<String> fullName,
      Value<String> ci,
      Value<String> sexo,
      Value<String> raza,
      Value<String?> direccionCi,
      Value<String?> direccionVive,
      Value<String?> telefono,
      Value<String> antPP,
      Value<String?> nivelEscolar,
      Value<String?> profesion,
      Value<String> grupoDispensarial,
      Value<String?> observaciones,
      Value<bool> isController,
      Value<bool> isAvailable,
      Value<String> cdrId,
      Value<int> rowid,
    });

final class $$PersonasTableTableReferences
    extends BaseReferences<_$AppDatabase, $PersonasTableTable, PersonasEntity> {
  $$PersonasTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CdrTableTable _cdrIdTable(_$AppDatabase db) =>
      db.cdrTable.createAlias(
        $_aliasNameGenerator(db.personasTable.cdrId, db.cdrTable.id),
      );

  $$CdrTableTableProcessedTableManager get cdrId {
    final $_column = $_itemColumn<String>('cdr_id')!;

    final manager = $$CdrTableTableTableManager(
      $_db,
      $_db.cdrTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cdrIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$GestanteTableTable, List<GestanteEntity>>
  _gestanteTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.gestanteTable,
    aliasName: $_aliasNameGenerator(
      db.personasTable.id,
      db.gestanteTable.personaId,
    ),
  );

  $$GestanteTableTableProcessedTableManager get gestanteTableRefs {
    final manager = $$GestanteTableTableTableManager(
      $_db,
      $_db.gestanteTable,
    ).filter((f) => f.personaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_gestanteTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PuerperaTableTable, List<PuerperaEntity>>
  _puerperaTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.puerperaTable,
    aliasName: $_aliasNameGenerator(
      db.personasTable.id,
      db.puerperaTable.personaId,
    ),
  );

  $$PuerperaTableTableProcessedTableManager get puerperaTableRefs {
    final manager = $$PuerperaTableTableTableManager(
      $_db,
      $_db.puerperaTable,
    ).filter((f) => f.personaId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_puerperaTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PersonasTableTableFilterComposer
    extends Composer<_$AppDatabase, $PersonasTableTable> {
  $$PersonasTableTableFilterComposer({
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

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ci => $composableBuilder(
    column: $table.ci,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sexo => $composableBuilder(
    column: $table.sexo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get raza => $composableBuilder(
    column: $table.raza,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direccionCi => $composableBuilder(
    column: $table.direccionCi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get direccionVive => $composableBuilder(
    column: $table.direccionVive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get antPP => $composableBuilder(
    column: $table.antPP,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nivelEscolar => $composableBuilder(
    column: $table.nivelEscolar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profesion => $composableBuilder(
    column: $table.profesion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get grupoDispensarial => $composableBuilder(
    column: $table.grupoDispensarial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isController => $composableBuilder(
    column: $table.isController,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnFilters(column),
  );

  $$CdrTableTableFilterComposer get cdrId {
    final $$CdrTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdrId,
      referencedTable: $db.cdrTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  Expression<bool> gestanteTableRefs(
    Expression<bool> Function($$GestanteTableTableFilterComposer f) f,
  ) {
    final $$GestanteTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gestanteTable,
      getReferencedColumn: (t) => t.personaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GestanteTableTableFilterComposer(
            $db: $db,
            $table: $db.gestanteTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> puerperaTableRefs(
    Expression<bool> Function($$PuerperaTableTableFilterComposer f) f,
  ) {
    final $$PuerperaTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.puerperaTable,
      getReferencedColumn: (t) => t.personaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuerperaTableTableFilterComposer(
            $db: $db,
            $table: $db.puerperaTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ci => $composableBuilder(
    column: $table.ci,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sexo => $composableBuilder(
    column: $table.sexo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get raza => $composableBuilder(
    column: $table.raza,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direccionCi => $composableBuilder(
    column: $table.direccionCi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get direccionVive => $composableBuilder(
    column: $table.direccionVive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get antPP => $composableBuilder(
    column: $table.antPP,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nivelEscolar => $composableBuilder(
    column: $table.nivelEscolar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profesion => $composableBuilder(
    column: $table.profesion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get grupoDispensarial => $composableBuilder(
    column: $table.grupoDispensarial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isController => $composableBuilder(
    column: $table.isController,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => ColumnOrderings(column),
  );

  $$CdrTableTableOrderingComposer get cdrId {
    final $$CdrTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdrId,
      referencedTable: $db.cdrTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CdrTableTableOrderingComposer(
            $db: $db,
            $table: $db.cdrTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get ci =>
      $composableBuilder(column: $table.ci, builder: (column) => column);

  GeneratedColumn<String> get sexo =>
      $composableBuilder(column: $table.sexo, builder: (column) => column);

  GeneratedColumn<String> get raza =>
      $composableBuilder(column: $table.raza, builder: (column) => column);

  GeneratedColumn<String> get direccionCi => $composableBuilder(
    column: $table.direccionCi,
    builder: (column) => column,
  );

  GeneratedColumn<String> get direccionVive => $composableBuilder(
    column: $table.direccionVive,
    builder: (column) => column,
  );

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<String> get antPP =>
      $composableBuilder(column: $table.antPP, builder: (column) => column);

  GeneratedColumn<String> get nivelEscolar => $composableBuilder(
    column: $table.nivelEscolar,
    builder: (column) => column,
  );

  GeneratedColumn<String> get profesion =>
      $composableBuilder(column: $table.profesion, builder: (column) => column);

  GeneratedColumn<String> get grupoDispensarial => $composableBuilder(
    column: $table.grupoDispensarial,
    builder: (column) => column,
  );

  GeneratedColumn<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isController => $composableBuilder(
    column: $table.isController,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAvailable => $composableBuilder(
    column: $table.isAvailable,
    builder: (column) => column,
  );

  $$CdrTableTableAnnotationComposer get cdrId {
    final $$CdrTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cdrId,
      referencedTable: $db.cdrTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  Expression<T> gestanteTableRefs<T extends Object>(
    Expression<T> Function($$GestanteTableTableAnnotationComposer a) f,
  ) {
    final $$GestanteTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gestanteTable,
      getReferencedColumn: (t) => t.personaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GestanteTableTableAnnotationComposer(
            $db: $db,
            $table: $db.gestanteTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> puerperaTableRefs<T extends Object>(
    Expression<T> Function($$PuerperaTableTableAnnotationComposer a) f,
  ) {
    final $$PuerperaTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.puerperaTable,
      getReferencedColumn: (t) => t.personaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuerperaTableTableAnnotationComposer(
            $db: $db,
            $table: $db.puerperaTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (PersonasEntity, $$PersonasTableTableReferences),
          PersonasEntity,
          PrefetchHooks Function({
            bool cdrId,
            bool gestanteTableRefs,
            bool puerperaTableRefs,
          })
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
                Value<String> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String> ci = const Value.absent(),
                Value<String> sexo = const Value.absent(),
                Value<String> raza = const Value.absent(),
                Value<String?> direccionCi = const Value.absent(),
                Value<String?> direccionVive = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<String> antPP = const Value.absent(),
                Value<String?> nivelEscolar = const Value.absent(),
                Value<String?> profesion = const Value.absent(),
                Value<String> grupoDispensarial = const Value.absent(),
                Value<String?> observaciones = const Value.absent(),
                Value<bool> isController = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
                Value<String> cdrId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PersonasTableCompanion(
                id: id,
                fullName: fullName,
                ci: ci,
                sexo: sexo,
                raza: raza,
                direccionCi: direccionCi,
                direccionVive: direccionVive,
                telefono: telefono,
                antPP: antPP,
                nivelEscolar: nivelEscolar,
                profesion: profesion,
                grupoDispensarial: grupoDispensarial,
                observaciones: observaciones,
                isController: isController,
                isAvailable: isAvailable,
                cdrId: cdrId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String fullName,
                required String ci,
                required String sexo,
                required String raza,
                Value<String?> direccionCi = const Value.absent(),
                Value<String?> direccionVive = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                required String antPP,
                Value<String?> nivelEscolar = const Value.absent(),
                Value<String?> profesion = const Value.absent(),
                required String grupoDispensarial,
                Value<String?> observaciones = const Value.absent(),
                Value<bool> isController = const Value.absent(),
                Value<bool> isAvailable = const Value.absent(),
                required String cdrId,
                Value<int> rowid = const Value.absent(),
              }) => PersonasTableCompanion.insert(
                id: id,
                fullName: fullName,
                ci: ci,
                sexo: sexo,
                raza: raza,
                direccionCi: direccionCi,
                direccionVive: direccionVive,
                telefono: telefono,
                antPP: antPP,
                nivelEscolar: nivelEscolar,
                profesion: profesion,
                grupoDispensarial: grupoDispensarial,
                observaciones: observaciones,
                isController: isController,
                isAvailable: isAvailable,
                cdrId: cdrId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PersonasTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            cdrId = false,
            gestanteTableRefs = false,
            puerperaTableRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (gestanteTableRefs) db.gestanteTable,
                if (puerperaTableRefs) db.puerperaTable,
              ],
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
                if (cdrId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.cdrId,
                            referencedTable: $$PersonasTableTableReferences
                                ._cdrIdTable(db),
                            referencedColumn:
                                $$PersonasTableTableReferences
                                    ._cdrIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (gestanteTableRefs)
                    await $_getPrefetchedData<
                      PersonasEntity,
                      $PersonasTableTable,
                      GestanteEntity
                    >(
                      currentTable: table,
                      referencedTable: $$PersonasTableTableReferences
                          ._gestanteTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$PersonasTableTableReferences(
                                db,
                                table,
                                p0,
                              ).gestanteTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.personaId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (puerperaTableRefs)
                    await $_getPrefetchedData<
                      PersonasEntity,
                      $PersonasTableTable,
                      PuerperaEntity
                    >(
                      currentTable: table,
                      referencedTable: $$PersonasTableTableReferences
                          ._puerperaTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$PersonasTableTableReferences(
                                db,
                                table,
                                p0,
                              ).puerperaTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.personaId == item.id,
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
      (PersonasEntity, $$PersonasTableTableReferences),
      PersonasEntity,
      PrefetchHooks Function({
        bool cdrId,
        bool gestanteTableRefs,
        bool puerperaTableRefs,
      })
    >;
typedef $$GestanteTableTableCreateCompanionBuilder =
    GestanteTableCompanion Function({
      Value<String> id,
      required String antPp,
      required String observaciones,
      required String tgCaptacion,
      required String tgFinal,
      required DateTime fum,
      required String gestaciones,
      required String partos,
      required String abortos,
      required String cesareas,
      required String antPPretermino,
      required DateTime fechaCaptacion,
      required DateTime fechaProbableParto,
      required String rciu,
      required String imc,
      required int clasificacionRiesgo,
      required String personaId,
      Value<int> rowid,
    });
typedef $$GestanteTableTableUpdateCompanionBuilder =
    GestanteTableCompanion Function({
      Value<String> id,
      Value<String> antPp,
      Value<String> observaciones,
      Value<String> tgCaptacion,
      Value<String> tgFinal,
      Value<DateTime> fum,
      Value<String> gestaciones,
      Value<String> partos,
      Value<String> abortos,
      Value<String> cesareas,
      Value<String> antPPretermino,
      Value<DateTime> fechaCaptacion,
      Value<DateTime> fechaProbableParto,
      Value<String> rciu,
      Value<String> imc,
      Value<int> clasificacionRiesgo,
      Value<String> personaId,
      Value<int> rowid,
    });

final class $$GestanteTableTableReferences
    extends BaseReferences<_$AppDatabase, $GestanteTableTable, GestanteEntity> {
  $$GestanteTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PersonasTableTable _personaIdTable(_$AppDatabase db) =>
      db.personasTable.createAlias(
        $_aliasNameGenerator(db.gestanteTable.personaId, db.personasTable.id),
      );

  $$PersonasTableTableProcessedTableManager get personaId {
    final $_column = $_itemColumn<String>('persona_id')!;

    final manager = $$PersonasTableTableTableManager(
      $_db,
      $_db.personasTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GestanteTableTableFilterComposer
    extends Composer<_$AppDatabase, $GestanteTableTable> {
  $$GestanteTableTableFilterComposer({
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

  ColumnFilters<String> get antPp => $composableBuilder(
    column: $table.antPp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tgCaptacion => $composableBuilder(
    column: $table.tgCaptacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tgFinal => $composableBuilder(
    column: $table.tgFinal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fum => $composableBuilder(
    column: $table.fum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gestaciones => $composableBuilder(
    column: $table.gestaciones,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partos => $composableBuilder(
    column: $table.partos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abortos => $composableBuilder(
    column: $table.abortos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cesareas => $composableBuilder(
    column: $table.cesareas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get antPPretermino => $composableBuilder(
    column: $table.antPPretermino,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaCaptacion => $composableBuilder(
    column: $table.fechaCaptacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaProbableParto => $composableBuilder(
    column: $table.fechaProbableParto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rciu => $composableBuilder(
    column: $table.rciu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imc => $composableBuilder(
    column: $table.imc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get clasificacionRiesgo => $composableBuilder(
    column: $table.clasificacionRiesgo,
    builder: (column) => ColumnFilters(column),
  );

  $$PersonasTableTableFilterComposer get personaId {
    final $$PersonasTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personaId,
      referencedTable: $db.personasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonasTableTableFilterComposer(
            $db: $db,
            $table: $db.personasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GestanteTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GestanteTableTable> {
  $$GestanteTableTableOrderingComposer({
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

  ColumnOrderings<String> get antPp => $composableBuilder(
    column: $table.antPp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tgCaptacion => $composableBuilder(
    column: $table.tgCaptacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tgFinal => $composableBuilder(
    column: $table.tgFinal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fum => $composableBuilder(
    column: $table.fum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gestaciones => $composableBuilder(
    column: $table.gestaciones,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partos => $composableBuilder(
    column: $table.partos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abortos => $composableBuilder(
    column: $table.abortos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cesareas => $composableBuilder(
    column: $table.cesareas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get antPPretermino => $composableBuilder(
    column: $table.antPPretermino,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaCaptacion => $composableBuilder(
    column: $table.fechaCaptacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaProbableParto => $composableBuilder(
    column: $table.fechaProbableParto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rciu => $composableBuilder(
    column: $table.rciu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imc => $composableBuilder(
    column: $table.imc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get clasificacionRiesgo => $composableBuilder(
    column: $table.clasificacionRiesgo,
    builder: (column) => ColumnOrderings(column),
  );

  $$PersonasTableTableOrderingComposer get personaId {
    final $$PersonasTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personaId,
      referencedTable: $db.personasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonasTableTableOrderingComposer(
            $db: $db,
            $table: $db.personasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GestanteTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GestanteTableTable> {
  $$GestanteTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get antPp =>
      $composableBuilder(column: $table.antPp, builder: (column) => column);

  GeneratedColumn<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tgCaptacion => $composableBuilder(
    column: $table.tgCaptacion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tgFinal =>
      $composableBuilder(column: $table.tgFinal, builder: (column) => column);

  GeneratedColumn<DateTime> get fum =>
      $composableBuilder(column: $table.fum, builder: (column) => column);

  GeneratedColumn<String> get gestaciones => $composableBuilder(
    column: $table.gestaciones,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partos =>
      $composableBuilder(column: $table.partos, builder: (column) => column);

  GeneratedColumn<String> get abortos =>
      $composableBuilder(column: $table.abortos, builder: (column) => column);

  GeneratedColumn<String> get cesareas =>
      $composableBuilder(column: $table.cesareas, builder: (column) => column);

  GeneratedColumn<String> get antPPretermino => $composableBuilder(
    column: $table.antPPretermino,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaCaptacion => $composableBuilder(
    column: $table.fechaCaptacion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaProbableParto => $composableBuilder(
    column: $table.fechaProbableParto,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rciu =>
      $composableBuilder(column: $table.rciu, builder: (column) => column);

  GeneratedColumn<String> get imc =>
      $composableBuilder(column: $table.imc, builder: (column) => column);

  GeneratedColumn<int> get clasificacionRiesgo => $composableBuilder(
    column: $table.clasificacionRiesgo,
    builder: (column) => column,
  );

  $$PersonasTableTableAnnotationComposer get personaId {
    final $$PersonasTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personaId,
      referencedTable: $db.personasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonasTableTableAnnotationComposer(
            $db: $db,
            $table: $db.personasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GestanteTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GestanteTableTable,
          GestanteEntity,
          $$GestanteTableTableFilterComposer,
          $$GestanteTableTableOrderingComposer,
          $$GestanteTableTableAnnotationComposer,
          $$GestanteTableTableCreateCompanionBuilder,
          $$GestanteTableTableUpdateCompanionBuilder,
          (GestanteEntity, $$GestanteTableTableReferences),
          GestanteEntity,
          PrefetchHooks Function({bool personaId})
        > {
  $$GestanteTableTableTableManager(_$AppDatabase db, $GestanteTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$GestanteTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$GestanteTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$GestanteTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> antPp = const Value.absent(),
                Value<String> observaciones = const Value.absent(),
                Value<String> tgCaptacion = const Value.absent(),
                Value<String> tgFinal = const Value.absent(),
                Value<DateTime> fum = const Value.absent(),
                Value<String> gestaciones = const Value.absent(),
                Value<String> partos = const Value.absent(),
                Value<String> abortos = const Value.absent(),
                Value<String> cesareas = const Value.absent(),
                Value<String> antPPretermino = const Value.absent(),
                Value<DateTime> fechaCaptacion = const Value.absent(),
                Value<DateTime> fechaProbableParto = const Value.absent(),
                Value<String> rciu = const Value.absent(),
                Value<String> imc = const Value.absent(),
                Value<int> clasificacionRiesgo = const Value.absent(),
                Value<String> personaId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GestanteTableCompanion(
                id: id,
                antPp: antPp,
                observaciones: observaciones,
                tgCaptacion: tgCaptacion,
                tgFinal: tgFinal,
                fum: fum,
                gestaciones: gestaciones,
                partos: partos,
                abortos: abortos,
                cesareas: cesareas,
                antPPretermino: antPPretermino,
                fechaCaptacion: fechaCaptacion,
                fechaProbableParto: fechaProbableParto,
                rciu: rciu,
                imc: imc,
                clasificacionRiesgo: clasificacionRiesgo,
                personaId: personaId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String antPp,
                required String observaciones,
                required String tgCaptacion,
                required String tgFinal,
                required DateTime fum,
                required String gestaciones,
                required String partos,
                required String abortos,
                required String cesareas,
                required String antPPretermino,
                required DateTime fechaCaptacion,
                required DateTime fechaProbableParto,
                required String rciu,
                required String imc,
                required int clasificacionRiesgo,
                required String personaId,
                Value<int> rowid = const Value.absent(),
              }) => GestanteTableCompanion.insert(
                id: id,
                antPp: antPp,
                observaciones: observaciones,
                tgCaptacion: tgCaptacion,
                tgFinal: tgFinal,
                fum: fum,
                gestaciones: gestaciones,
                partos: partos,
                abortos: abortos,
                cesareas: cesareas,
                antPPretermino: antPPretermino,
                fechaCaptacion: fechaCaptacion,
                fechaProbableParto: fechaProbableParto,
                rciu: rciu,
                imc: imc,
                clasificacionRiesgo: clasificacionRiesgo,
                personaId: personaId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$GestanteTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({personaId = false}) {
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
                if (personaId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.personaId,
                            referencedTable: $$GestanteTableTableReferences
                                ._personaIdTable(db),
                            referencedColumn:
                                $$GestanteTableTableReferences
                                    ._personaIdTable(db)
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

typedef $$GestanteTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GestanteTableTable,
      GestanteEntity,
      $$GestanteTableTableFilterComposer,
      $$GestanteTableTableOrderingComposer,
      $$GestanteTableTableAnnotationComposer,
      $$GestanteTableTableCreateCompanionBuilder,
      $$GestanteTableTableUpdateCompanionBuilder,
      (GestanteEntity, $$GestanteTableTableReferences),
      GestanteEntity,
      PrefetchHooks Function({bool personaId})
    >;
typedef $$PuerperaTableTableCreateCompanionBuilder =
    PuerperaTableCompanion Function({
      Value<String> id,
      required String antPp,
      required String observaciones,
      required String gestaciones,
      required String partos,
      required String abortos,
      required String cesareas,
      required String antPPretermino,
      required int tipoParto,
      required String personaId,
      Value<int> rowid,
    });
typedef $$PuerperaTableTableUpdateCompanionBuilder =
    PuerperaTableCompanion Function({
      Value<String> id,
      Value<String> antPp,
      Value<String> observaciones,
      Value<String> gestaciones,
      Value<String> partos,
      Value<String> abortos,
      Value<String> cesareas,
      Value<String> antPPretermino,
      Value<int> tipoParto,
      Value<String> personaId,
      Value<int> rowid,
    });

final class $$PuerperaTableTableReferences
    extends BaseReferences<_$AppDatabase, $PuerperaTableTable, PuerperaEntity> {
  $$PuerperaTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PersonasTableTable _personaIdTable(_$AppDatabase db) =>
      db.personasTable.createAlias(
        $_aliasNameGenerator(db.puerperaTable.personaId, db.personasTable.id),
      );

  $$PersonasTableTableProcessedTableManager get personaId {
    final $_column = $_itemColumn<String>('persona_id')!;

    final manager = $$PersonasTableTableTableManager(
      $_db,
      $_db.personasTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_personaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PuerperaTableTableFilterComposer
    extends Composer<_$AppDatabase, $PuerperaTableTable> {
  $$PuerperaTableTableFilterComposer({
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

  ColumnFilters<String> get antPp => $composableBuilder(
    column: $table.antPp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gestaciones => $composableBuilder(
    column: $table.gestaciones,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partos => $composableBuilder(
    column: $table.partos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abortos => $composableBuilder(
    column: $table.abortos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cesareas => $composableBuilder(
    column: $table.cesareas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get antPPretermino => $composableBuilder(
    column: $table.antPPretermino,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tipoParto => $composableBuilder(
    column: $table.tipoParto,
    builder: (column) => ColumnFilters(column),
  );

  $$PersonasTableTableFilterComposer get personaId {
    final $$PersonasTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personaId,
      referencedTable: $db.personasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonasTableTableFilterComposer(
            $db: $db,
            $table: $db.personasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuerperaTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PuerperaTableTable> {
  $$PuerperaTableTableOrderingComposer({
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

  ColumnOrderings<String> get antPp => $composableBuilder(
    column: $table.antPp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gestaciones => $composableBuilder(
    column: $table.gestaciones,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partos => $composableBuilder(
    column: $table.partos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abortos => $composableBuilder(
    column: $table.abortos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cesareas => $composableBuilder(
    column: $table.cesareas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get antPPretermino => $composableBuilder(
    column: $table.antPPretermino,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tipoParto => $composableBuilder(
    column: $table.tipoParto,
    builder: (column) => ColumnOrderings(column),
  );

  $$PersonasTableTableOrderingComposer get personaId {
    final $$PersonasTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personaId,
      referencedTable: $db.personasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonasTableTableOrderingComposer(
            $db: $db,
            $table: $db.personasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuerperaTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PuerperaTableTable> {
  $$PuerperaTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get antPp =>
      $composableBuilder(column: $table.antPp, builder: (column) => column);

  GeneratedColumn<String> get observaciones => $composableBuilder(
    column: $table.observaciones,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gestaciones => $composableBuilder(
    column: $table.gestaciones,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partos =>
      $composableBuilder(column: $table.partos, builder: (column) => column);

  GeneratedColumn<String> get abortos =>
      $composableBuilder(column: $table.abortos, builder: (column) => column);

  GeneratedColumn<String> get cesareas =>
      $composableBuilder(column: $table.cesareas, builder: (column) => column);

  GeneratedColumn<String> get antPPretermino => $composableBuilder(
    column: $table.antPPretermino,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tipoParto =>
      $composableBuilder(column: $table.tipoParto, builder: (column) => column);

  $$PersonasTableTableAnnotationComposer get personaId {
    final $$PersonasTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.personaId,
      referencedTable: $db.personasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonasTableTableAnnotationComposer(
            $db: $db,
            $table: $db.personasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuerperaTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PuerperaTableTable,
          PuerperaEntity,
          $$PuerperaTableTableFilterComposer,
          $$PuerperaTableTableOrderingComposer,
          $$PuerperaTableTableAnnotationComposer,
          $$PuerperaTableTableCreateCompanionBuilder,
          $$PuerperaTableTableUpdateCompanionBuilder,
          (PuerperaEntity, $$PuerperaTableTableReferences),
          PuerperaEntity,
          PrefetchHooks Function({bool personaId})
        > {
  $$PuerperaTableTableTableManager(_$AppDatabase db, $PuerperaTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PuerperaTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$PuerperaTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PuerperaTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> antPp = const Value.absent(),
                Value<String> observaciones = const Value.absent(),
                Value<String> gestaciones = const Value.absent(),
                Value<String> partos = const Value.absent(),
                Value<String> abortos = const Value.absent(),
                Value<String> cesareas = const Value.absent(),
                Value<String> antPPretermino = const Value.absent(),
                Value<int> tipoParto = const Value.absent(),
                Value<String> personaId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PuerperaTableCompanion(
                id: id,
                antPp: antPp,
                observaciones: observaciones,
                gestaciones: gestaciones,
                partos: partos,
                abortos: abortos,
                cesareas: cesareas,
                antPPretermino: antPPretermino,
                tipoParto: tipoParto,
                personaId: personaId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String antPp,
                required String observaciones,
                required String gestaciones,
                required String partos,
                required String abortos,
                required String cesareas,
                required String antPPretermino,
                required int tipoParto,
                required String personaId,
                Value<int> rowid = const Value.absent(),
              }) => PuerperaTableCompanion.insert(
                id: id,
                antPp: antPp,
                observaciones: observaciones,
                gestaciones: gestaciones,
                partos: partos,
                abortos: abortos,
                cesareas: cesareas,
                antPPretermino: antPPretermino,
                tipoParto: tipoParto,
                personaId: personaId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PuerperaTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({personaId = false}) {
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
                if (personaId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.personaId,
                            referencedTable: $$PuerperaTableTableReferences
                                ._personaIdTable(db),
                            referencedColumn:
                                $$PuerperaTableTableReferences
                                    ._personaIdTable(db)
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

typedef $$PuerperaTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PuerperaTableTable,
      PuerperaEntity,
      $$PuerperaTableTableFilterComposer,
      $$PuerperaTableTableOrderingComposer,
      $$PuerperaTableTableAnnotationComposer,
      $$PuerperaTableTableCreateCompanionBuilder,
      $$PuerperaTableTableUpdateCompanionBuilder,
      (PuerperaEntity, $$PuerperaTableTableReferences),
      PuerperaEntity,
      PrefetchHooks Function({bool personaId})
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
  $$GestanteTableTableTableManager get gestanteTable =>
      $$GestanteTableTableTableManager(_db, _db.gestanteTable);
  $$PuerperaTableTableTableManager get puerperaTable =>
      $$PuerperaTableTableTableManager(_db, _db.puerperaTable);
}
