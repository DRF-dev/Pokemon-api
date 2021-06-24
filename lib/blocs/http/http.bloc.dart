import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/blocs/http/http.event.dart';
import 'package:pokemon/blocs/http/http.state.dart';

class HttpBloc extends Bloc<HttpEvents, HttpState> {
  HttpBloc() : super(HttpEmptyState());

  @override
  Stream<HttpState> mapEventToState(HttpEvents event) async* {
    if (event is GetPokemons) {}
    yield HttpEmptyState();
  }
}
