import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil Profissional',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget contato(IconData icone, String texto) {
    return ListTile(
      leading: Icon(
        icone,
        color: Colors.redAccent,
      ),
      title: Text(texto),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: const Text('Perfil Profissional'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // espaçamento interno de 20 pixels em todos os lados
        padding: const EdgeInsets.all(20),

        // organiza os elementos de cima pra baixo (verticalmente)
        child: Column(
          // centraliza todos os widgets filhos horizontalmente dentro da coluna
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Foto de perfil: usa dois CircleAvatar sobrepostos para criar uma moldura circular
            const CircleAvatar(
              radius: 60, // tamanho do circulo externo (moldura)
              backgroundColor: Colors.redAccent, // cor na moldura
              child: CircleAvatar(
                radius: 56, // tamanho do circulo interno (imagem)
                // busca a imagem de perfil diretamente de uma URL externa
                backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/227260760?s=400&u=48b9cebef10784775741d343a68806a6d36d5773&v=4'),
              ),
            ),

            // sizedBox cria um espaço vazio vertical de 15 pixels para separar a foto do nome
            const SizedBox(height: 15),

            // 2. Nome e Idade: widgets de texto com estilização diferenciada
            const Text(
              'Gustavo Silva Dias',
              textAlign: TextAlign.center, // centraliza o texto
              style: TextStyle(
                fontSize: 26, // fonte maior
                fontWeight: FontWeight.bold, // negrito 
              ),
            ),

            const Text(
              '16 anos - Mongaguá, SP',
              style: TextStyle(
                fontSize: 16, // fonte menor
                color: Colors.blueGrey, // cor suave
              ),
            ),

            const SizedBox(height: 20),

            // 3. contatos: seção delimitada por linhas divisórias (Divider)
            const Divider(), // linha horizontal separadora
            // chamadas ao método auxiliar para construir cada linha de contato
            contato(
              Icons.email,
              'aluno@etec.sp.gov.br'
            ),

            contato(
              Icons.phone,
              '(13) 99999-9999'
            ),

            contato(
              Icons.web,
              '@gustavosilvadias07@gmail.com'
            ),

            const Divider(),
            const SizedBox(height: 20),

            // 4. Resumo profissional: Usa align para garantir que o titulo ficque à esquerda
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Resumo Profissional',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              'Cursando Desenvolvimento de dados, Com uma base em python.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16
              ),
            ),

            const SizedBox(height: 25),

            // 5. objetivo segue o mesmo padrao visual do resumo para manter consistencia
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Objetivo',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Criar uma carreira com foco em novas tecnologias visando data science',
              textAlign: TextAlign.justify,
              // italico para enfase
              style: TextStyle(
                fontSize: 16, fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
      ),

      // 6. barra inferior
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
      ),

      // 7. botao flutuante (acao principal)
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          // acao ao clicar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Bem-vindo ao perfil!'),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}