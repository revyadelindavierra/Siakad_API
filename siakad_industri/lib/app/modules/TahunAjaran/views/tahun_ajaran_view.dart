import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siakad_industri/app/modules/TahunAjaran/controllers/tahun_ajaran_controller.dart';

class TahunAjaranView extends GetView<TahunAjaranController> {
  const TahunAjaranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TAHUN AJARAN'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () {
            // Cek apakah data sudah dimuat
            if (!controller.isLoaded.value) {
              return Center(child: CircularProgressIndicator());
            }

            // Cek apakah data kosong
            if (controller.TahunAjaran.value.data == null ||
                controller.TahunAjaran.value.data!.isEmpty) {
              return Center(child: Text('Data kosong.'));
            }

            // Menampilkan ListView dari data tahun ajaran
            return ListView.builder(
              itemCount: controller.TahunAjaran.value.data?.length ?? 0,
              itemBuilder: (context, index) {
                final element = controller.TahunAjaran.value.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          element.name ?? 'N/A',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Last Update: ${element.sLastUpdate ?? 'N/A'}'),
                        SizedBox(height: 8),
                        Text('Display Name: ${element.displayName ?? 'N/A'}'),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.getTahunAjaran();
            },
            child: Icon(Icons.refresh),
            backgroundColor: Colors.red,
          ),
          SizedBox(height: 10),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
