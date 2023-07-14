import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tdt2/screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class Survey3PageState extends StatefulWidget {
  static const routeName = '/fourth-screen';
  _SurveyPageState createState() => _SurveyPageState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survey App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<Survey3PageState> {
  int _questionIndex = 0;
  //var questions; // variable local para las preguntas
  List<double> _ratings = [];

  Future<void> _submitAnswer(double rating) async {
    final url = Uri.parse(
        'https://tdt-oy5qrz33qq-tl.a.run.app/api/respuesta'); // Reemplaza con la URL correcta de tu API
    final headers = {
      'Content-Type': 'application/json'
    }; // Opcional, depende de las necesidades de tu API

    final jsonData = {
      'respuesta_n':
          rating, // Asegúrate de ajustar el nombre del campo según el modelo de respuesta en tu API
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(jsonData),
    );

    if (response.statusCode == 200) {
      print('Solicitud enviada correctamente');
      print(response.body);
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
    setState(() {
      _ratings.add(rating);
      _questionIndex++;
    });
    // if (_questionIndex >= questions.length) {
    //sendDataToApi();
    //}
  }

  void _goBack() {
    setState(() {
      _questionIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      '¿En qué medida las prácticas de laboratorio te ayudaron a comprender los conceptos teóricos de la asignatura?',
      '¿Qué tan útiles te resultaron las prácticas de laboratorio para aplicar los conocimientos adquiridos en situaciones reales?',
      '¿Cómo calificarías la calidad de la enseñanza y la capacidad del docente para impartir la asignatura en el laboratorio?',
      '¿En qué medida el docente te motivó y fomentó tu interés por la asignatura en el laboratorio?',
      '¿Cómo calificarías la limpieza y el mantenimiento del laboratorio?',
      '¿Cómo calificarías la disponibilidad y accesibilidad de los recursos necesarios para la realización de las prácticas de laboratorio?',
    ];

    if (_questionIndex < questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Pregunta ${_questionIndex + 1}'),
          leading: _questionIndex > 0
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _goBack,
                )
              : null,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_questionIndex + 1) / questions.length,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_questionIndex == 0)
                      const Text(
                        'Seccion asignatura',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 35,
                        ),
                      ),
                    // Título para las dos preguntas siguientes
                    if (_questionIndex == 2)
                      const Text(
                        'Sección docentes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 35,
                        ),
                      ),
                    // Pregunta

                    // Título para las últimas dos preguntas
                    if (_questionIndex == questions.length - 2)
                      const Text(
                        'Sección otros aspectos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 35,
                        ),
                      ),
                    Text(
                      questions[_questionIndex],
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    RatingBar.builder(
                        initialRating: 0.0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 50,
                        unratedColor: Colors.grey[300],
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        onRatingUpdate: (value) async {
                          await _submitAnswer(value);
                        }),
                    const SizedBox(height: 32),
                    //ElevatedButton(
                    //  child: const Text('Cancelar'),
                    //  onPressed: () {
                    //    Navigator.push(
                    //      context,
                    //      MaterialPageRoute(builder: (context) => CancelPage()),
                    //    );
                    //  },
                    //),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Encuesta completada'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Gracias por responder la encuesta',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                'Calificaciones: ${_ratings.toString()}',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
  }
}

class CancelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '¿Seguro que desea cancelar la encuesta?',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text('Cancel'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
