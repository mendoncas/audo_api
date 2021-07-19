# Rotas para Estudante
## GET /student
Retorna todos os estudantes no sistema

### Response:
```
{
  "students": [
    {
      "id": 1,
      "name": "Ricardo",
      "created_at": "2021-07-18T20:14:03.240Z",
      "updated_at": "2021-07-18T20:14:03.240Z"
    }
  ]
}
```
## GET /student/recommendation/:student_id
Retorna uma recomendação de disciplinas a serem cursadas, com base nas disciplinas já completas de um estudante. As disciplinas são ordenadas por semestre. Requer o ID do estudante no path

### Response
```
[
  {
    "id": 8,
    "name": "Português",
    "description": null,
    "created_at": "2021-07-18T20:49:14.952Z",
    "updated_at": "2021-07-18T20:49:14.952Z",
    "semester_id": 1
  },
  {
    "id": 2,
    "name": "Física",
    "description": null,
    "created_at": "2021-07-18T19:33:53.628Z",
    "updated_at": "2021-07-18T19:33:53.628Z",
    "semester_id": 2
  },
  {
    "id": 3,
    "name": "Álgebra",
    "description": null,
    "created_at": "2021-07-18T19:34:07.127Z",
    "updated_at": "2021-07-18T19:34:07.127Z",
    "semester_id": 2
  }
]
```
## POST /student
Cadastra um novo estudante no sistema

### Request
```
{
	"name":"Ricardo"
}
```
### Response
```
{
  "message": "Estudante criado com sucesso!",
  "student": {
    "id": 1,
    "name": "Ricardo",
    "created_at": "2021-07-18T20:14:03.240Z",
    "updated_at": "2021-07-18T20:14:03.240Z"
  }
}
```


# Rotas para Disciplinas

## POST /discipline 
Adiciona uma nova disciplina à grade.
Requer o nome da dsciplina, que deve ser único e o ID do semestre ao qual será adicionada

### Request
```
{
	"name":"Português",
	"semester_id":1,
    "description": "Língua Portuguesa"
}
```

### Response
```
{
  "message": "Disciplina criada com sucesso!",
  "discipline": {
    "id": 8,
    "name": "Português",
    "description": "Língua Portuguesa",
    "created_at": "2021-07-18T20:49:14.952Z",
    "updated_at": "2021-07-18T20:49:14.952Z",
    "semester_id": 1
  }
}
```

## GET /discipline/graph
Redireciona à api do graphviz, que constrói um gráfico a partir da grade curricular

## GET /discipline/index
Retorna todas as disciplinas cadastradas no sistema

### Response
```
{
  "disciplines": [
    {
      "id": 1,
      "name": "Matemática",
      "description": null,
      "created_at": "2021-07-18T19:33:34.886Z",
      "updated_at": "2021-07-18T19:33:34.886Z",
      "semester_id": 1
    },
    {
      "id": 2,
      "name": "Física",
      "description": null,
      "created_at": "2021-07-18T19:33:53.628Z",
      "updated_at": "2021-07-18T19:33:53.628Z",
      "semester_id": 2
    },
    {
      "id": 3,
      "name": "Álgebra",
      "description": null,
      "created_at": "2021-07-18T19:34:07.127Z",
      "updated_at": "2021-07-18T19:34:07.127Z",
      "semester_id": 2
    }
  ]
}
```

## PUT /discipline/:discipline_id
Altera informaões de uma disciplina já cadastrada

### Request
```
{
	"name":"geometria",
	"description":"formas são importantes"
}
```
### Response
```
{
  "message": "Dependência atualizada com sucesso!",
  "changes": {
    "name": "geometria",
    "description": "formas são importantes"
  }
}
```

# Rotas para Disciplinas Completas
## POST /completed_discipline
Registra que um aluno foi aprovado em uma disciplina.
Requer o ID de um aluno cadastrado e o da disciplina a ser completa.
Previne que um aluno complete uma disciplina sem completar suas depenências.

### Request
```
{
	"student_id":1,
	"discipline_id":1
}
```

### Response
```
{
  "message": "Disciplina completa com sucesso!",
  "completed_discipline": {
    "id": 1,
    "student_id": 1,
    "discipline_id": 1,
    "created_at": "2021-07-18T20:14:33.561Z",
    "updated_at": "2021-07-18T20:14:33.561Z"
  }
}
```
## GET /completed_discipline/:student_id
Retorna as disciplinas completas por um estudante.
Requer ID do estudante no path

### Response
```
[
  {
    "id": 1,
    "student_id": 1,
    "discipline_id": 1,
    "created_at": "2021-07-18T20:14:33.561Z",
    "updated_at": "2021-07-18T20:14:33.561Z"
  }
]
```

# Rotas para Semestre
Adiciona um novo semestre

### Response
```
{
  "message": "Semestre criado com sucesso!",
  "semester": {
    "id": 4,
    "name": "",
    "created_at": "2021-07-18T19:33:18.142Z",
    "updated_at": "2021-07-18T19:33:18.142Z"
  }
}
```