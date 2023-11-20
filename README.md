# Teste vaga flutter

<p align="center">Um aplicativo, em flutter, para atender aos requisitos, das imagens de exemplo.</p>



<!--ts-->
* [Tela de Login](#tela-de-login)
    * [A tela deve ter](#a-tela-deve-ter)
    * [Como tela deve se comportar](#como-tela-deve-se-comportar)
* [Tela de captura de informações](#tela-de-captur-de-informações)
    * [A tela deve ter](#a-tela-deve-ter)
    * [Como tela deve se comportar](#como-tela-deve-se-comportar)
* [Como executar](#como-executar)
* [Tecnologias](#tecnologias)
<!--te-->


### Tela de Login

Uma tela de autenticação onde o usuario é obrigadoa digitar seu login e senha.

<image src="assets/image/login.jpeg">


#### A tela deve ter

- [x] um campo de usuário;
- [x] Um campo de senha;
- [x] Um label descrito "Politica de privacidade".


#### Como tela deve se comportar

- [x] Verificar e alertar se ambos os campos de Login e senha estão preenchidos.
    - [x] O campo senha não pode ter menos que dois caracteres.
    - [x] O campo senha não pode ter caracteres especiais, sendo apenas possível informar 'a' até 'Z' e '0' até '9'.
- [x] Ambos os campos não podem ultrapassar 20 caracteres.
- [x] Ambos os campos não podem terminar com o caractere de espaço no final.
- [x] Se ambas as informações esƟveram preenchidas deve ir para a próxima tela.
- [x] Ao tocar no label "PolíƟca de privacidade" uma página web direcionada para o google.com.br deve ser aberta.

###### Observações:
Não é necessário validar as informações em uma API Externa, mas caso seja feito um mockAPI contará como diferencial.


### Tela de captura de informações

A tela deve salvar as informações digitadas pelo usuário em um card, listando essas informações salvas e dando a opção de editar ou excluir. Essas informações não podem ser perdidas ao fechar o app, ou seja, ao abrir a tela as informações salvas anteriormente devem ser mostradas na ordem.

<image src="assets/image/info.jpeg">


#### A tela deve ter

- [x] Um card principal e central 
- [x] Um campo de texto 

#### Como a tela deve se comportar 

- [x] O foco da digitação deve estar o tempo todo no campo de "Digite seu texto" e não pode ser perdido ao interagir com a tela.
- [x] Ao acionar o "enter" o campo tem que verificar se a informação foi preenchida.
- [x] O Card principal deve receber a informação digitada do campo.
- [x] As informações precisam ser salvas e lidas utilizando a biblioteca shared_preference (https://pub.dev/packages/shared_preferences)
- [x] O Icone de excluir deve abrir um pop-up confirmando a ação.
- [x] Obrigatório a utilização do plugin MOBX para a construção da tela. 

### Pré-requisitos

Antes de começar Certifique-se de ter: 
* Um emulador instalado ou um dispositivo android conectado.


### Como executar



1. clone o repisitório:
   ```sh
   git clone https://github.com/MizzaelCosta/teste_vaga_flutter.git
   ```
   
2. instale as dependencias:
 
   ```sh
   flutter pub get
   ```
   
3. execute:
   ```sh
   flutter run
   ```   


### Tecnologias

- [MobX](https://pub.dev/packages/mobx)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)
- [Provider](https://pub.dev/packages/provider)
- [Url Launcher](https://pub.dev/packages/provider)
- [Validatorless](https://pub.dev/packages/validatorless)

### Autor
---

<a>
 <img style="border-radius: 50%;" src="https://avatars.githubusercontent.com/u/72561989?s=400&u=f9a922042904c9576e93d5a85b8334e426c34466&v=4" width="100px;" alt=""/>
 <br />
 <sub><b>Mizzael Costa</b></sub></a>


Feito por mim. 👋🏽 Entre em contato!

[![Linkedin Badge](https://img.shields.io/badge/-Linkedin-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/carlosmcosta/)](https://www.linkedin.com/in/carlosmcosta/) 
[![Gmail Badge](https://img.shields.io/badge/mizzaelcosta@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:mizzaelcosta@gmail.com)](mailto:mizzaelcosta@gmail.com)