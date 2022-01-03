# Uma API para grades curriculares

Esse projeto realiza a dmininstração de uma grade curricular, com funções simples, como:
* Adicionar alunos e disciplinas
* Adicionar dependências de disciplinas (alunos precisam completar certas disicplinas antes de cursar outras)
* Aprovar um aluno em uma disicplina
* Gerar relatórios para os alunos, informando quais disciplinas podem cursar com base nas suas aprovações.

O projeto utiliza algoritmos simples para trabalhar com grafos e impedir dependências circulares, além de gerar imagens das grades de um curso. Para erar as grades, consome de uma API externa.

## Build 
O servidor pode ser preparado e iniciado a partir da dockerfile

## Docs
A workspace do insomnia gerada ao longo do desenvolvimento do projeto pode ser importada deste aquivo [docs/inisomnia_docs](https://github.com/mendoncas/audo_api/blob/master/docs/insomnia_docs.json)
As rotas da aplicação também estão descritas na [wiki](https://github.com/mendoncas/audo_api/wiki)
