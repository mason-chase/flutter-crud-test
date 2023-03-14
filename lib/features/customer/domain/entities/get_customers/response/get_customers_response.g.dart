// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomersResponse _$GetCustomersResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustomersResponse(
      (json['customers'] as List<dynamic>)
          .map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
