// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditCardAdapter extends TypeAdapter<CreditCard> {
  @override
  final int typeId = 4;

  @override
  CreditCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditCard(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[4] as String,
    )..userId = fields[3] as int;
  }

  @override
  void write(BinaryWriter writer, CreditCard obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cardNum)
      ..writeByte(1)
      ..write(obj.expiryDate)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.holderName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
