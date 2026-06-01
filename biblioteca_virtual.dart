import 'dart:io';

class Livro {
  String titulo;
  String autor;
  int anoPublicacao;
  String genero;

  Livro(this.titulo, this.autor, this.anoPublicacao, this.genero);

  void exibirInformacoes() {
    print('\nTítulo: $titulo');
    print('Autor: $autor');
    print('Ano de Publicação: $anoPublicacao');
    print('Gênero: $genero');
    print('--------------------------');
  }
}

class Biblioteca {
  List<Livro> livros = [];

  void cadastrarLivro() {
    print('\n=== CADASTRO DE LIVRO ===');

    stdout.write('Título: ');
    String titulo = stdin.readLineSync()!;

    stdout.write('Autor: ');
    String autor = stdin.readLineSync()!;

    stdout.write('Ano de publicação: ');
    int ano = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    stdout.write('Gênero: ');
    String genero = stdin.readLineSync()!;

    livros.add(Livro(titulo, autor, ano, genero));

    print('\nLivro cadastrado com sucesso!');
  }

  void removerLivro() {
    if (livros.isEmpty) {
      print('\nNenhum livro cadastrado.');
      return;
    }

    stdout.write('\nDigite o título do livro: ');
    String titulo = stdin.readLineSync()!;

    int quantidadeAntes = livros.length;

    livros.removeWhere(
      (livro) => livro.titulo.toLowerCase() == titulo.toLowerCase(),
    );

    if (livros.length < quantidadeAntes) {
      print('Livro removido com sucesso!');
    } else {
      print('Livro não encontrado.');
    }
  }

  void listarLivros() {
    if (livros.isEmpty) {
      print('\nNenhum livro cadastrado.');
      return;
    }

    print('\n===== LIVROS CADASTRADOS =====');

    for (var livro in livros) {
      livro.exibirInformacoes();
    }
  }
}

void main() {
  Biblioteca biblioteca = Biblioteca();

  int opcao;

  do {
    print('\n========== BIBLIOTECA VIRTUAL ==========');
    print('1 - Cadastrar Livro');
    print('2 - Remover Livro');
    print('3 - Listar Livros');
    print('0 - Sair');
    print('========================================');

    stdout.write('Escolha uma opção: ');

    opcao = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    switch (opcao) {
      case 1:
        biblioteca.cadastrarLivro();
        break;

      case 2:
        biblioteca.removerLivro();
        break;

      case 3:
        biblioteca.listarLivros();
        break;

      case 0:
        print('\nEncerrando o sistema...');
        break;

      default:
        print('\nOpção inválida!');
    }
  } while (opcao != 0);
}
