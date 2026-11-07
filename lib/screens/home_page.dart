import 'package:flutter/material.dart';
import 'detalle_sala_page.dart';

class SalaMuseo {
  final String titulo;
  final String imagen;
  final String descripcion;
  final String coordenadas;
  final String sitioWeb;

  const SalaMuseo({
    required this.titulo,
    required this.imagen,
    required this.descripcion,
    required this.coordenadas,
    required this.sitioWeb,
  });
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<SalaMuseo> opcionesMuseo = [
      const SalaMuseo(
        titulo: 'Museo de Arte del Rio',
        imagen: 'https://www.marthadebayle.com/wp-content/uploads/2023/04/museos-mas-importantes-del-mundo.jpg',
        descripcion: 'Obras maestras de pintura clásica.',
        coordenadas: '4.6097° N, 74.0817° W',
        sitioWeb: 'https://museodeartedelrio.example.com',
      ),
      const SalaMuseo(
        titulo: 'Museo Historia Andina',
        imagen: 'https://images.pexels.com/photos/460736/pexels-photo-460736.jpeg?cs=srgb&dl=pexels-pixabay-460736.jpg&fm=jpg',
        descripcion: 'Biodiversidad de la cordillera.',
        coordenadas: '4.6584° N, 74.0936° W',
        sitioWeb: 'https://museohistoriaandina.example.com',
      ),
      const SalaMuseo(
        titulo: 'Museo del Altiplano',
        imagen: 'https://th.bing.com/th/id/R.ba29336c194666cb14e4edd5eaf219f5?rik=5mLm9mbv8FQ%2fHA&pid=ImgRaw&r=0',
        descripcion: 'Vestigios y artefactos ancestrales.',
        coordenadas: '5.5353° N, 73.3678° W',
        sitioWeb: 'https://museoaltiplano.example.com',
      ),
      const SalaMuseo(
        titulo: 'Casa del Patrimonio',
        imagen: 'https://www.opinion.com.bo/media/opinion/images/2020/03/31/2020033121123758364.jpg',
        descripcion: 'Tradiciones y arquitectura colonial.',
        coordenadas: '4.7110° N, 74.0721° W',
        sitioWeb: 'https://patrimoniolocal.example.com',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar museos o salas...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            const SizedBox(height: 16),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Salas disponibles',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${opcionesMuseo.length} museos',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[700],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

     
            Expanded(
              child: GridView.builder(
                itemCount: opcionesMuseo.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.82, 
                ),
                itemBuilder: (context, index) {
                  final sala = opcionesMuseo[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalleSalaPage(
                            nombreSala: sala.titulo,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16), 
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16), 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                            SizedBox(
                              height: 85, 
                              width: double.infinity,
                              child: Image.network(
                                sala.imagen,
                                fit: BoxFit.cover,
                              ),
                            ),
                          
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sala.titulo,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          sala.descripcion,
                                          style: TextStyle(
                                            fontSize: 9.5,
                                            color: Colors.grey[600],
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on, size: 10, color: Colors.deepPurple),
                                            const SizedBox(width: 2),
                                            Expanded(
                                              child: Text(
                                                sala.coordenadas,
                                                style: const TextStyle(fontSize: 9, color: Colors.grey),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            const Icon(Icons.language, size: 10, color: Colors.blue),
                                            const SizedBox(width: 2),
                                            Expanded(
                                              child: Text(
                                                'Visitar sitio',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.blue[700],
                                                  decoration: TextDecoration.underline,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}