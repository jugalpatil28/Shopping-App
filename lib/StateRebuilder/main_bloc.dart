import 'package:devasthan_flutter_app/StateRebuilder/connected_bloc.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class MainBloc extends StatesRebuilder
    with ConnectedBloc, AuthenticationBloc, Read, Listen, Watch {}

MainBloc mainBloc = MainBloc();
