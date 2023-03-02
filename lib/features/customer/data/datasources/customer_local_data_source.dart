import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/customer.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<CustomerLocalDataSource>(onMissingStub: OnMissingStub.returnDefault)
])
abstract class CustomerLocalDataSource {
  Future<List<Customer>> getCustomers();

  Future<Customer?> getCustomerById(String id);

  Future<Customer> addCustomer(Customer customer);

  Future<Customer> editCustomer(Customer customer);

  Future<void> deleteCustomer(String email);
}

class CustomerLocalDataSourceImpl implements CustomerLocalDataSource {
  Box<Customer>? _box;
  final String _key = "customer";

  Future<void> _init() async {
    if (_box == null) {
      Hive.registerAdapter(CustomerAdapter());
      _box = await Hive.openBox<Customer>(_key);
    }
  }

  @override
  Future<Customer> addCustomer(Customer customer) async {
    await _init();
    await _box?.put(customer.email, customer);
    return customer;
  }

  @override
  Future<void> deleteCustomer(String email) async {
    await _init();
    await _box?.delete(email);
  }

  @override
  Future<Customer> editCustomer(Customer customer) async {
    await _init();
    await _box?.put(customer.email, customer);
    return customer;
  }

  @override
  Future<Customer?> getCustomerById(String id) async {
    await _init();
    return _box?.get(id);
  }

  @override
  Future<List<Customer>> getCustomers() async {
    await _init();
    return _box!.values.toList();
  }
}
