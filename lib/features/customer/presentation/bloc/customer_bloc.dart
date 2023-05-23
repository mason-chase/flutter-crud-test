import 'package:mc_crud_test/features/customer/domain/entities/customer.dart';
import 'package:stream_bloc/stream_bloc.dart';
import '../../domain/usecases/add_customer_usecase.dart';
import '../../domain/usecases/delete_customer_usecase.dart';
import '../../domain/usecases/edit_customer_usecase.dart';
import '../../domain/usecases/get_customer_by_id_usecase.dart';
import '../../domain/usecases/get_customers_usecase.dart';
import 'customer_event.dart';
import 'customer_state.dart';

class CustomerBloc extends StreamBloc<CustomerEvent, CustomerState> {
  late final AddCustomerUseCase addCustomer;
  late final DeleteCustomerUseCase deleteCustomer;
  late final EditCustomerUseCase editCustomer;
  late final GetCustomerByIdUseCase getCustomerById;
  late final GetCustomersUseCase getCustomers;

  CustomerBloc({
    required AddCustomerUseCase addCustomerUseCase,
    required DeleteCustomerUseCase deleteCustomerUseCase,
    required EditCustomerUseCase editCustomerUseCase,
    required GetCustomerByIdUseCase getCustomerByIdUseCase,
    required GetCustomersUseCase getCustomersUseCase,
  })  : addCustomer = addCustomerUseCase,
        deleteCustomer = deleteCustomerUseCase,
        editCustomer = editCustomerUseCase,
        getCustomerById = getCustomerByIdUseCase,
        getCustomers = getCustomersUseCase,
        super(const CustomerState.initial(false));

  @override
  Stream<CustomerState> mapEventToStates(CustomerEvent event) => event.when(
        addCustomer: _onAddCustomer,
        deleteCustomer: _onDeleteCustomer,
        editCustomer: _onEditCustomer,
        getCustomerById: _onGetCustomerById,
        getCustomers: _onGetCustomers,
      );

  Stream<CustomerState> _onAddCustomer(Customer customerModel) async* {
    try {
      yield const CustomerState.initial(true);
      var result = await addCustomer(params: customerModel);

      yield result.fold(
        (failure) => CustomerState.error(failure.message, false),
        (data) => CustomerState.successAdded(data, false),
      );
    } catch (e) {
      if (!isClosed) {
        yield CustomerState.error(e.toString(), false);
      }
    }
  }

  Stream<CustomerState> _onDeleteCustomer(String id) async* {
    try {
      yield const CustomerState.initial(true);
      var result = await deleteCustomer(params: id);

      yield result.fold(
        (failure) => CustomerState.error(failure.message, false),
        (data) => const CustomerState.successDeleted(false),
      );
    } catch (e) {
      if (!isClosed) {
        yield CustomerState.error(e.toString(), false);
      }
    }
  }

  Stream<CustomerState> _onEditCustomer(Customer customer) async* {
    try {
      yield const CustomerState.initial(true);
      var result = await editCustomer(params: customer);

      yield result.fold(
        (failure) => CustomerState.error(failure.message, false),
        (data) => CustomerState.successEdited(data, false),
      );
    } catch (e) {
      if (!isClosed) {
        yield CustomerState.error(e.toString(), false);
      }
    }
  }

  Stream<CustomerState> _onGetCustomerById(String id) async* {
    try {
      yield const CustomerState.initial(true);
      var result = await getCustomerById(params: id);

      yield result.fold(
        (failure) => CustomerState.error(failure.message, false),
        (data) => CustomerState.successGetById(data, false),
      );
    } catch (e) {
      if (!isClosed) {
        yield CustomerState.error(e.toString(), false);
      }
    }
  }

  Stream<CustomerState> _onGetCustomers() async* {
    try {
      yield const CustomerState.initial(true);
      var result = await getCustomers(params: null);

      yield result.fold(
        (failure) => CustomerState.error(failure.message, false),
        (data) => CustomerState.successGetCustomers(data, false),
      );
    } catch (e) {
      if (!isClosed) {
        yield CustomerState.error(e.toString(), false);
      }
    }
  }
}
