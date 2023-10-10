BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "inquilinos" (
	"id"	INTEGER NOT NULL UNIQUE,
	"valoraluguel"	INTEGER NOT NULL,
	"pessoacodigo"	INTEGER,
	"imovelcodigo"	INTEGER,
	"datacadastro"	TEXT,
	"dataalteracao"	TEXT,
	"situacao"	TEXT,
	FOREIGN KEY("imovelcodigo") REFERENCES "imoveis"("id") ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY("pessoacodigo") REFERENCES "pessoas"("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "FK_IMOVEL" PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "desconto" (
	"id"	INTEGER NOT NULL UNIQUE,
	"descricao"	TEXT,
	"valor"	REAL,
	"referencia"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "servicos" (
	"id"	INTEGER NOT NULL UNIQUE,
	"descricao"	TEXT,
	"dataInicio"	TEXT NOT NULL,
	"dataFim"	TEXT,
	"valor"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "inquilinos_contas" (
	"id"	INTEGER NOT NULL UNIQUE,
	"inquilinocodigo"	INTEGER,
	"contacodigo"	INTEGER,
	"valorInquilino"	REAL,
	"fatorDivisor"	REAL,
	"dataVencimento"	TEXT,
	"dataPagamento"	TEXT,
	FOREIGN KEY("inquilinocodigo") REFERENCES "inquilinos_contas"("id") ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY("contacodigo") REFERENCES "contas_imoveis"("id") ON UPDATE CASCADE ON DELETE SET NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "imoveis" (
	"id"	INTEGER NOT NULL UNIQUE,
	"nomefantasia"	TEXT NOT NULL,
	"endereco"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "contas_imoveis" (
	"id"	INTEGER NOT NULL UNIQUE,
	"tipocodigo"	INTEGER NOT NULL,
	"valor"	REAL NOT NULL,
	"imovelcodigo"	INTEGER,
	"ano"	INTEGER NOT NULL,
	"mes"	INTEGER NOT NULL,
	"dataVencimento"	TEXT NOT NULL,
	"observacoes"	TEXT,
	FOREIGN KEY("tipocodigo") REFERENCES "tipocontas"("id") ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY("imovelcodigo") REFERENCES "imoveis"("id") ON UPDATE CASCADE ON DELETE SET NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tipocontas" (
	"id"	INTEGER NOT NULL UNIQUE,
	"codigo"	INTEGER NOT NULL,
	"descricao"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "pessoas" (
	"id"	INTEGER NOT NULL UNIQUE,
	"nome"	TEXT NOT NULL,
	"cpf"	TEXT,
	"profissão"	TEXT,
	"telefone_celular"	TEXT,
	"telefone_fixo"	TEXT,
	"telefone_trabalho"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "inquilinos" ("id","valoraluguel","pessoacodigo","imovelcodigo","datacadastro","dataalteracao","situacao") VALUES (1,330,1,1,NULL,NULL,'A'),
 (2,550,3,1,NULL,NULL,'A'),
 (3,440,4,1,NULL,NULL,'A'),
 (4,600,5,1,NULL,NULL,'A'),
 (5,550,6,1,NULL,NULL,'A');
INSERT INTO "imoveis" ("id","nomefantasia","endereco") VALUES (1,'Alameda P2',NULL);
INSERT INTO "tipocontas" ("id","codigo","descricao") VALUES (1,1000,'Água - Saneago'),
 (2,1001,'Energia - Equatorial');
INSERT INTO "pessoas" ("id","nome","cpf","profissão","telefone_celular","telefone_fixo","telefone_trabalho") VALUES (1,'Agmar',NULL,NULL,NULL,NULL,NULL),
 (3,'Branca',NULL,NULL,NULL,NULL,NULL),
 (4,'Ezequias',NULL,NULL,NULL,NULL,NULL),
 (5,'Igor',NULL,NULL,NULL,NULL,NULL),
 (6,'Paulo',NULL,NULL,NULL,NULL,NULL);
COMMIT;
