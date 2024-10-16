import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:siakad_industri/app/data/models/model_tahunajaran.dart';
import '../../data/services/constant.dart';

class RepositoryTahunAJaran {
  RepositoryTahunAJaran();

  Future<ModelTahunAjaran> loadMapel() async {
	addCookies();
	String url = CORS_ANYWHERE + DOMAIN;
	var res = http.Request(
  	'GET',
  	Uri.parse('$url/send_request?model=moklet.mapel'),
	);
	res.headers.addAll(defaultHeader);
	http.StreamedResponse response = await res.send();
	try {
  	if (response.statusCode == 200) {//200 itu sukses,400 ga ketemu, 500 iku hack
    	var jsonString = await response.stream.bytesToString();
    	return ModelTahunAjaran.fromJson(jsonDecode(jsonString));
  	} else {
    	return ModelTahunAjaran(
        	isError: true, data: [], message: 'Gagal Bad Request');
  	}
	} catch (e) {
  	print(e);
  	return ModelTahunAjaran(isError: true, data: [], message: 'Gagal Catch');
	}
  }
}
