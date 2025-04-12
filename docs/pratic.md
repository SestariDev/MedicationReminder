Requisitos Funcionais

RF001
Login

O aplicativo deve possuir uma tela de Login. O usuário deverá fornecer as credenciais para autenticação no aplicativo: email e senha. A tela deve conter os campos para informar as credenciais, bem como, uma imagem que representa o logotipo da aplicação. Além disso, é necessário um botão para "entrar" no aplicativo.
O aplicativo deve verificar se o usuário entrou com um e-mail válido e se os campos de email e senha não estão vazios.
Na tela de login, o usuário poderá acessar as funcionalidades de Cadastro de Usuário e Esqueceu a senha?

RF002
Cadastro de Usuário

O aplicativo deve permitir o cadastro de novos usuários. O cadastro deve conter no mínimo os seguintes campos: nome, e-mail, número de telefone, senha e confirmação de senha. Outros campos também podem ser adicionados de acordo com os objetivos do projeto.
A tela de cadastro deve garantir que todos os campos foram devidamente preenchidos.

RF003
Esqueceu a senha

O usuário poderá recuperar a sua senha através dessa funcionalidade. Para isso, será necessário fornecer o e-mail de cadastro.

RF004
Sobre

O aplicativo deve possuir uma tela com informações sobre o projeto. A tela sobre deve apresentar dados sobre o projeto, tais como: objetivo do aplicativo e os nomes dos integrantes da equipe.
A equipe poderá determinar em qual parte do aplicativo o usuário poderá ter acesso a tela sobre.

RF005
Outras funcionalidades

O aplicativo será composto pelas seguintes funcionalidades obrigatórias:
Login, Cadastro de Usuário, Esqueceu a Senha e Sobre.
Adicionalmente, o aplicativo deve conter funcionalidades específicas de acordo com o tema escolhido. Cada funcionalidade específica deverá ser implementada em uma interface gráfica. O aplicativo deve conter no mínimo 5 (cinco) funcionalidades específicas.
Importante: Cada funcionalidade específica deve ser implementada em um arquivo separado, podendo ser do tipo Stateless ou Stateful.
O uso de outros tipos de widgets, e plugins, é permitido sendo de responsabilidade da equipe.

RF006
Caixa de Diálogo

O aplicativo deve exibir mensagens em caixas de diálogos:
AlertDialog
SnackBar
A escolha do tipo de caixa de diálogo pode ser definida pela equipe.

RF007
Listagem de dados

O aplicativo deve utilizar o widget ListView ou GridView para apresentar uma lista de dados. O ListView é uma lista rolável de widgets organizados linearmente, sendo um dos widgets de rolagem mais usados. O GridView exibe uma lista de elementos em duas dimensões, no formato de grade.
Nesta etapa do projeto podem ser utilizados dados estáticos para demonstrar o funcionamento do widget.

Requisitos Não-Funcionais
O aplicativo deve ser desenvolvido com o Flutter SDK.
O aplicativo deve realizar o gerenciamento de estado.
O design deve ser intuitivo e fácil de usar, com botões e controles claramente identificáveis, seguindo as especificações do Material Design.
A navegação deve ser fluida e seguir as especificações do Material Design.
