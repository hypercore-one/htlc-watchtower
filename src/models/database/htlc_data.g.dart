// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'htlc_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHtlcDataCollection on Isar {
  IsarCollection<HtlcData> get htlcDatas => this.collection();
}

const HtlcDataSchema = CollectionSchema(
  name: r'HtlcData',
  id: -3690085823987074464,
  properties: {
    r'creationTime': PropertySchema(
      id: 0,
      name: r'creationTime',
      type: IsarType.long,
    ),
    r'expirationTime': PropertySchema(
      id: 1,
      name: r'expirationTime',
      type: IsarType.long,
    ),
    r'hashlock': PropertySchema(
      id: 2,
      name: r'hashlock',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.string,
    ),
    r'preimage': PropertySchema(
      id: 4,
      name: r'preimage',
      type: IsarType.string,
    ),
    r'recipient': PropertySchema(
      id: 5,
      name: r'recipient',
      type: IsarType.string,
    ),
    r'sender': PropertySchema(
      id: 6,
      name: r'sender',
      type: IsarType.string,
    )
  },
  estimateSize: _htlcDataEstimateSize,
  serialize: _htlcDataSerialize,
  deserialize: _htlcDataDeserialize,
  deserializeProp: _htlcDataDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _htlcDataGetId,
  getLinks: _htlcDataGetLinks,
  attach: _htlcDataAttach,
  version: '3.1.0',
);

int _htlcDataEstimateSize(
  HtlcData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.hashlock.length * 3;
  bytesCount += 3 + object.id.length * 3;
  {
    final value = object.preimage;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.recipient.length * 3;
  bytesCount += 3 + object.sender.length * 3;
  return bytesCount;
}

void _htlcDataSerialize(
  HtlcData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.creationTime);
  writer.writeLong(offsets[1], object.expirationTime);
  writer.writeString(offsets[2], object.hashlock);
  writer.writeString(offsets[3], object.id);
  writer.writeString(offsets[4], object.preimage);
  writer.writeString(offsets[5], object.recipient);
  writer.writeString(offsets[6], object.sender);
}

HtlcData _htlcDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HtlcData(
    creationTime: reader.readLong(offsets[0]),
    expirationTime: reader.readLong(offsets[1]),
    hashlock: reader.readString(offsets[2]),
    id: reader.readString(offsets[3]),
    preimage: reader.readStringOrNull(offsets[4]),
    recipient: reader.readString(offsets[5]),
    sender: reader.readString(offsets[6]),
  );
  return object;
}

P _htlcDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _htlcDataGetId(HtlcData object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _htlcDataGetLinks(HtlcData object) {
  return [];
}

void _htlcDataAttach(IsarCollection<dynamic> col, Id id, HtlcData object) {}

extension HtlcDataQueryWhereSort on QueryBuilder<HtlcData, HtlcData, QWhere> {
  QueryBuilder<HtlcData, HtlcData, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HtlcDataQueryWhere on QueryBuilder<HtlcData, HtlcData, QWhereClause> {
  QueryBuilder<HtlcData, HtlcData, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HtlcDataQueryFilter
    on QueryBuilder<HtlcData, HtlcData, QFilterCondition> {
  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> creationTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition>
      creationTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> creationTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> creationTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> expirationTimeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expirationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition>
      expirationTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expirationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition>
      expirationTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expirationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> expirationTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expirationTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashlock',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hashlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hashlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hashlock',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hashlock',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashlock',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> hashlockIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hashlock',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'preimage',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'preimage',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preimage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preimage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preimage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preimage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preimage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preimage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preimage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preimage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preimage',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> preimageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preimage',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recipient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recipient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recipient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recipient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recipient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recipient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recipient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recipient',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> recipientIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recipient',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition>
      recipientIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recipient',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sender',
        value: '',
      ));
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterFilterCondition> senderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sender',
        value: '',
      ));
    });
  }
}

extension HtlcDataQueryObject
    on QueryBuilder<HtlcData, HtlcData, QFilterCondition> {}

extension HtlcDataQueryLinks
    on QueryBuilder<HtlcData, HtlcData, QFilterCondition> {}

extension HtlcDataQuerySortBy on QueryBuilder<HtlcData, HtlcData, QSortBy> {
  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByCreationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByExpirationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationTime', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByExpirationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationTime', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByHashlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashlock', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByHashlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashlock', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByPreimage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preimage', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByPreimageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preimage', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByRecipient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipient', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortByRecipientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipient', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortBySender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> sortBySenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.desc);
    });
  }
}

extension HtlcDataQuerySortThenBy
    on QueryBuilder<HtlcData, HtlcData, QSortThenBy> {
  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByCreationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByExpirationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationTime', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByExpirationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationTime', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByHashlock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashlock', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByHashlockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashlock', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByPreimage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preimage', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByPreimageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preimage', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByRecipient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipient', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenByRecipientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipient', Sort.desc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenBySender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.asc);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QAfterSortBy> thenBySenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sender', Sort.desc);
    });
  }
}

extension HtlcDataQueryWhereDistinct
    on QueryBuilder<HtlcData, HtlcData, QDistinct> {
  QueryBuilder<HtlcData, HtlcData, QDistinct> distinctByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationTime');
    });
  }

  QueryBuilder<HtlcData, HtlcData, QDistinct> distinctByExpirationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expirationTime');
    });
  }

  QueryBuilder<HtlcData, HtlcData, QDistinct> distinctByHashlock(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashlock', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QDistinct> distinctByPreimage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preimage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QDistinct> distinctByRecipient(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recipient', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HtlcData, HtlcData, QDistinct> distinctBySender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sender', caseSensitive: caseSensitive);
    });
  }
}

extension HtlcDataQueryProperty
    on QueryBuilder<HtlcData, HtlcData, QQueryProperty> {
  QueryBuilder<HtlcData, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<HtlcData, int, QQueryOperations> creationTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationTime');
    });
  }

  QueryBuilder<HtlcData, int, QQueryOperations> expirationTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expirationTime');
    });
  }

  QueryBuilder<HtlcData, String, QQueryOperations> hashlockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashlock');
    });
  }

  QueryBuilder<HtlcData, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HtlcData, String?, QQueryOperations> preimageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preimage');
    });
  }

  QueryBuilder<HtlcData, String, QQueryOperations> recipientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipient');
    });
  }

  QueryBuilder<HtlcData, String, QQueryOperations> senderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sender');
    });
  }
}
