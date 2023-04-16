import 'package:flutter/material.dart';
import '../model/feriado_model.dart';
import '../service/http_service.dart';

class FeriadosPage extends StatefulWidget {
  const FeriadosPage({super.key});

  @override
  State<FeriadosPage> createState() => _FeriadosPageState();
}

class _FeriadosPageState extends State<FeriadosPage> {
  final HttpService httpService = HttpService();
  List<Feriado> feriados = [];
  Future<List<Feriado>>? _future;

  @override
  void initState() {
    super.initState();
    _future = httpService.getFeriados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feriados nacionais"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              _future = httpService.getFeriados();
            });
          }),
      body: SizedBox(
        child: FutureBuilder<List<Feriado>>(
          future: _future,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              feriados = snapshot.data!;
              return Expanded(
                  child: ListView.builder(
                      itemCount: feriados.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(feriados[index].name),
                          subtitle: Text(feriados[index].date),
                        );
                      }));
            }
          },
        ),
      ),
    );
  }
}
