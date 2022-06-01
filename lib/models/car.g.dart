// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarAdapter extends TypeAdapter<Car> {
  @override
  final int typeId = 2;

  @override
  Car read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Car(
      id: fields[0] as int?,
      brand: fields[3] as String?,
      chassisNumber: fields[1] as String?,
      createDate: fields[4] as String?,
      firstCarTag: fields[5] as int?,
      fourthCarTag: fields[8] as int?,
      ownerNationalCode: fields[2] as String?,
      secondCarTag: fields[6] as String?,
      thirdCarTag: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Car obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chassisNumber)
      ..writeByte(2)
      ..write(obj.ownerNationalCode)
      ..writeByte(3)
      ..write(obj.brand)
      ..writeByte(4)
      ..write(obj.createDate)
      ..writeByte(5)
      ..write(obj.firstCarTag)
      ..writeByte(6)
      ..write(obj.secondCarTag)
      ..writeByte(7)
      ..write(obj.thirdCarTag)
      ..writeByte(8)
      ..write(obj.fourthCarTag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
