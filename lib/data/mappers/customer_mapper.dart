import '../../domain/entities/customer_entity.dart';
import '../dtos/customer/customer_dto.dart';

class CustomerMapper {
  static CustomerEntity mapDtoToEntity(
    final CustomerDto dto,
  ) =>
      CustomerEntity(
        firstName: dto.firstName,
        id: dto.id!,
        lastName: dto.lastName,
        dateOfBirth: dto.dateOfBirth,
        phoneNumber: dto.phoneNumber,
        email: dto.email,
        bankAccountNumber: dto.bankAccountNumber,
      );
}
