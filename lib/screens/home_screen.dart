  // HomeScreen
  import 'package:flutter/material.dart';

  class HomeScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Tienda de Ropa',
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ],
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:
                  0.7, // Ajusta la relación de aspecto para una vista más atractiva
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              final products = [
                {
                  'name': 'Camiseta',
                  'image': 'assets/camiseta.jpg',
                  'price': 19.99,
                  'description':
                      'Una camiseta cómoda y moderna, perfecta para cualquier ocasión.'
                },
                {
                  'name': 'Pantalón',
                  'image': 'assets/pantalon.jpg',
                  'price': 49.99,
                  'description':
                      'Pantalón de mezclilla de alta calidad y duradero, con un precio excelente.'
                },
                {
                  'name': 'Zapatos',
                  'image': 'assets/zapatos.jpg',
                  'price': 89.99,
                  'description':
                      'Zapatos elegantes y duraderos, color negro de diferentes tallas.'
                },
                {
                  'name': 'Chaqueta',
                  'image': 'assets/chaqueta.jpg',
                  'price': 69.99,
                  'description':
                      'Chaqueta resistente al agua, ideal para el clima frío.'
                },
                {
                  'name': 'Gorra',
                  'image': 'assets/gorra.jpg',
                  'price': 14.99,
                  'description':
                      'Gorra casual, perfecta para un look relajado y moderno.'
                },
                {
                  'name': 'Vestido',
                  'image': 'assets/vestido.jpg',
                  'price': 39.99,
                  'description':
                      'Vestido elegante para ocasiones especiales, disponible en varios colores.'
                },
                {
                  'name': 'Bufanda',
                  'image': 'assets/bufanda.jpg',
                  'price': 12.99,
                  'description':
                      'Bufanda de lana suave, perfecta para mantenerte caliente en invierno.'
                },
                {
                  'name': 'Guantes',
                  'image': 'assets/guantes.jpg',
                  'price': 9.99,
                  'description':
                      'Guantes cómodos y cálidos, disponibles en varios tamaños.'
                },
                {
                  'name': 'Sombrero',
                  'image': 'assets/sombrero.jpg',
                  'price': 24.99,
                  'description':
                      'Sombrero elegante para complementar tu outfit, ideal para eventos formales.'
                },
                {
                  'name': 'Mochila',
                  'image': 'assets/mochila.jpg',
                  'price': 59.99,
                  'description':
                      'Mochila espaciosa y resistente, perfecta para viajes o uso diario.'
                },
              ];

              final product = products[index];
              return _buildProductItem(
                context,
                product['name'] as String, // Conversión explícita a String
                product['image'] as String, // Conversión explícita a String
                product['price'] as double, // Conversión explícita a double
                product['description'] as String, // Conversión explícita a String
              );
            },
          ),
        ),
      );
    }

    Widget _buildProductItem(BuildContext context, String name, String image,
        double price, String description) {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/details',
              arguments: {
                'name': name,
                'image': image,
                'price': price,
                'description': description
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  '\$$price',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
