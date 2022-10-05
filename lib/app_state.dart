import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _concelhos = prefs.getStringList('ff_concelhos') ?? _concelhos;
  }

  late SharedPreferences prefs;

  List<String> _concelhos = [
    'Porto',
    'Lisboa',
    'Aveiro',
    'Gondomar',
    'Vila Nova de Gaia',
    'Matosinhos',
    'Águeda'
  ];
  List<String> get concelhos => _concelhos;
  set concelhos(List<String> _value) {
    _concelhos = _value;
    prefs.setStringList('ff_concelhos', _value);
  }

  void addToConcelhos(String _value) {
    _concelhos.add(_value);
    prefs.setStringList('ff_concelhos', _concelhos);
  }

  void removeFromConcelhos(String _value) {
    _concelhos.remove(_value);
    prefs.setStringList('ff_concelhos', _concelhos);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
