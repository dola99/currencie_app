// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencie_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyItemModelAdapter extends TypeAdapter<CurrencyItemModel> {
  @override
  final int typeId = 1;

  @override
  CurrencyItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyItemModel(
      countryId: fields[0] as String?,
      counrtyName: fields[1] as String?,
      currencyId: fields[2] as String?,
      currenceyName: fields[3] as String?,
      currenceySymbol: fields[4] as String?,
      flagUrl: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyItemModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.countryId)
      ..writeByte(1)
      ..write(obj.counrtyName)
      ..writeByte(2)
      ..write(obj.currencyId)
      ..writeByte(3)
      ..write(obj.currenceyName)
      ..writeByte(4)
      ..write(obj.currenceySymbol)
      ..writeByte(5)
      ..write(obj.flagUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
