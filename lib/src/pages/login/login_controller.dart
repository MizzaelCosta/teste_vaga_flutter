class LoginController {
  LoginController();

  String? login({required String user, required String password}) {
    //TODO: implementar validação de usuário
    //para substituir verificação simples.
    //(usar json_rest_server)

    const error = 'Use Usuário: admin e Senha: 123.';

    if (user == 'admin' && password == '123') {
      return null;
    }

    return error;
  }
}
