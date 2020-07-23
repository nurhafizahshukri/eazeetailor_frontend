
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/class.dart';

class DataService {

  // Live server on Firebase
  // static const String baseUrl =
  //     'http://us-central1-eazeetailor.cloudfunctions.net/api';

  // server on json
  static const String baseUrl =
      'http://192.168.1.7:3000';


  Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future delete(String endpoint) async {
    final response = await http.delete('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return; // jsonDecode(response.body);
    }
    throw response;
  }

 Future<List<Members>> getMembersList() async {
    final listJson = await get('members');

    return (listJson as List)
        .map((itemJson) => Members.fromJson(itemJson))
        .toList();
  }

  Future<Members> updatesize({String id, Members members}) async {
    final json = await patch('members/$id', data: members);
    return Members.fromJson(json);
  }

   Future<Members> createSize({Members members}) async {
    final json = await post('members', data: members);
    return Members.fromJson(json);
  }

  Future deleteMembers({String id}) async {
    await delete('members/$id');
  }

  Future<List<Appointment>> getAppointmentList() async {
    final listJson = await get('appointment');

    return (listJson as List)
        .map((itemJson) => Appointment.fromJson(itemJson))
        .toList();
  }

  Future<Appointment> createAppointment({Appointment appointments}) async {
    final json = await post('appointment', data: appointments);
    return Appointment.fromJson(json);
  }

   Future deleteAppointment({String id}) async {
    await delete('appointment/$id');
  }

  
}

final dataService = DataService();
