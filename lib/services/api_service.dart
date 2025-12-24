import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/api_config.dart';
import '../models/models.dart';

class ApiService {
  // Singleton pattern
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  
  late Dio _dio;
  String? _token;
  bool _isInitialized = false;

  ApiService._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ));

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!_isInitialized) {
            await _loadToken();
            _isInitialized = true;
          }
          if (_token != null) {
            options.headers['Authorization'] = 'Bearer $_token';
            print('Request with token: ${_token?.substring(0, 30)}...');
          } else {
            print('Request without token');
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<void> _loadToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('auth_token');
      if (_token != null) {
        print('Token loaded from storage: ${_token?.substring(0, 30)}...');
      } else {
        print('No token found in storage');
      }
    } catch (e) {
      print('Error loading token: $e');
    }
  }

  Future<void> _saveToken(String token) async {
    _token = token;
    _isInitialized = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);
      print('Token saved: ${token.substring(0, 30)}...');
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  Future<void> clearToken() async {
    _token = null;
    _isInitialized = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
      print('Token cleared');
    } catch (e) {
      print('Error clearing token: $e');
    }
  }

  // Check if user is logged in
  bool get isLoggedIn => _token != null;
  
  String? get currentToken => _token;

  // Login
  Future<LoginResponse> login(String username, String password) async {
    try {
      final response = await _dio.post(
        ApiConfig.login,
        data: {
          'username': username,
          'password': password,
        },
      );

      final loginResponse = LoginResponse.fromJson(response.data);
      await _saveToken(loginResponse.token);
      return loginResponse;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw 'Username atau password salah';
      }
      throw 'Gagal login: ${e.message}';
    }
  }

  // Get all data siswa
  Future<List<DataSiswa>> getDataSiswa() async {
    try {
      if (!_isInitialized) {
        await _loadToken();
        _isInitialized = true;
      }
      
      print('Fetching students...');
      
      final response = await _dio.get(ApiConfig.dataSiswa);
      print('Students fetched successfully: ${response.data.length} students');
      return (response.data as List)
          .map((json) => DataSiswa.fromJson(json))
          .toList();
    } on DioException catch (e) {
      print('Error fetching students: ${e.response?.statusCode} - ${e.message}');
      if (e.response?.statusCode == 401) {
        await clearToken();
        throw 'Sesi berakhir. Silakan login kembali.';
      }
      throw 'Gagal mengambil data siswa: ${e.message}';
    }
  }

  // Get single data siswa by ID
  Future<DataSiswa> getDataSiswaById(int id) async {
    try {
      final response = await _dio.get('${ApiConfig.dataSiswa}/$id');
      return DataSiswa.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await clearToken();
        throw 'Sesi berakhir. Silakan login kembali.';
      }
      throw 'Gagal mengambil detail siswa: ${e.message}';
    }
  }


}
