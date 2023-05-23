// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerDTOAdapter extends TypeAdapter<CustomerDTO> {
  @override
  final int typeId = 1;

  @override
  CustomerDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerDTO(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      dateOfBirth: fields[2] as String?,
      phoneNumber: fields[3] as String?,
      email: fields[4] as String?,
      bankAcountNumber: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerDTO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.dateOfBirth)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.bankAcountNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
