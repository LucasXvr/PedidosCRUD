# **PedidosCRUD**

Projeto desenvolvido para uma avaliação técnica como desenvolvedor Delphi. Este sistema de gerenciamento de pedidos permite realizar cadastro e gestão de pedidos, produtos e pessoas, utilizando operações de **CRUD** e integração com banco de dados.

---

## **Funcionalidades**

- **Cadastro de Pessoas**  
  Registra clientes e funcionários do sistema.
- **CRUD Completo**  
  Permite a criação, leitura, atualização e exclusão de registros.

- **Consumo de API**  
  Integração com a API **ViaCEP** para preenchimento automático de endereço, cidade e estado a partir do CEP.

---

## **Tecnologias Utilizadas**

- **Delphi**: Ambiente de desenvolvimento principal.
- **SQLite**: Banco de dados utilizado para consultas e manipulação de informações.
- **Git**: Para versionamento do código e controle de mudanças.

---

## **Como Rodar o Projeto**

1. **Clone o repositório**  
   Utilize o comando abaixo no terminal para clonar o repositório:

   ```bash
   git clone https://github.com/LucasXvr/PedidosCRUD.git
   ```

2. **Configuração Inicial**

   - Certifique-se de que você possui o **Delphi** instalado no sistema.
   - O banco de dados SQLite será automaticamente configurado ao executar o projeto.

3. **Execute o projeto**  
   Abra o arquivo `PedidosCRUD.dpr` no Delphi e clique em "Run" para iniciar.

---

## **Estrutura do Projeto**

```plaintext
project/
├── Win32/
│   ├── Debug/
│   ├── Release/
├── src/
│   ├── Classes/
│   │   ├── uCepService.pas  # Classe para consumo da API ViaCEP
│   │   ├── uLogin.pas       # Classe para controle de login
│   │   ├── uPessoa.pas      # Classe para gerenciar pessoas
│   ├── DataModules/
│   │   ├── uDmConexao.pas   # Módulo de conexão com SQLite
│   ├── Forms/
│   │   ├── uFrmCadPessoa.pas  # Formulário de cadastro de pessoas
│   │   ├── uFrmLogin.pas      # Formulário de login
│   │   ├── uFrmPedidos.pas    # Formulário para pedidos
│   ├── Interfaces/
│   │   ├── uILogin.pas       # Interface para controle de login
├── PedidosCRUD.dpr           # Arquivo principal do projeto
├── README.md                 # Documentação do projeto
└── .gitignore                # Arquivos ignorados no Git
```

---

## **Estrutura do Banco de Dados (SQLite)**

O projeto utiliza uma tabela para gerenciar as informações de pessoas cadastradas.  
**SQL para criação da tabela:**

```sql
CREATE TABLE Pessoas (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Nome TEXT NOT NULL,
  CPF TEXT NOT NULL,
  CEP TEXT NOT NULL,
  Endereco TEXT,
  Cidade TEXT,
  Estado TEXT
);
```

---

## **Funcionalidades Extras**

- **Preenchimento Automático de Endereço**  
  Ao inserir um **CEP**, o sistema consome a API ViaCEP para preencher automaticamente os campos de endereço, cidade e estado.

---

## **Licença**

Este projeto foi desenvolvido para fins de avaliação técnica e não possui uma licença específica.
