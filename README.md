# fase_6

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# P r o j e t o A u t o m a c a o F a s e 6 F l u t t e r 
 
---------------------------------------------------------------------
Testes:

validação do botão "Setiings";

Validação título da tela Preferencia do usuário;

validação do botão "voltar";

validação do texto: "Aparência";

validação do DropDown;

validação das opções do dropdown: claro, escuro e sistema


---------------------------------------------------------------------

Keys:

shopping_list.page
add uma key no tittle appBar "key: Key('tittle')"
add uma key no FloatingActionButton "key: Key('btnAdd')"

empty_shopping_list.page
add uma key na imagem "key: Key('image')"


add_shopping_list.page:
add uma key no TextField "key: Key('input')"
add uma key dentro do return TextButton _buildCancelButton "key: Key('BtnVoltar')"
add uma key dentro do return TextButton _buildCreateButton "key: Key('BtnCriar')"

card_shopping_cart.widget
add uma key dentro do return Card "key: Key('card')"

item_list.page
add uma key dentro do floatingActionButton "key: Key('adicionar')"
add uma key dentro do botÃ£o atualizar "key: Key('atualizar')"

add_item_list
add uma key dentro do TextFormField que corresponde ao nome do item "key: Key('inputitem')"
add uma key dentro do TextFormField que corresponde ao valor do item "key: Key('inputvalor')"
add uma key dentro do Align "key: Key('BtnAdicionar')"

item_tile.widget
add uma key dentro do child: Checkbox "key: Key('checkbox')"

Foi adicionada uma ValueKey ao botão "Settings"
page: shopping_list.page.dart
	"btnSettings"

Foi adicionada uma ValueKey ao dropDownButton
page: congig_user.page.dart
	"userThemeSelector"

Foi adicionada uma ValueKey na appBar "Preferencias do usuário"
page: config_user.page.dart
	"userSettings"

Foi adicionada uma Valuekey na opção 'Sistema' do dropDown
page: config_user.page.dart
 
