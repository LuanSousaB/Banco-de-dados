CREATE TABLE Agencia (
    nome VARCHAR(100) PRIMARY KEY,
    cidade VARCHAR(100) NOT NULL
);

CREATE TABLE Cliente (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL
);

CREATE TABLE Conta (
    numero INT PRIMARY KEY,
    saldo DECIMAL(12,2) NOT NULL,
    data_ultimo_acesso DATE,
    tipo VARCHAR(20) CHECK (tipo IN ('Poupanca', 'Corrente')),
    nome_agencia VARCHAR(100) NOT NULL,
    FOREIGN KEY (nome_agencia) REFERENCES Agencia(nome)
);

CREATE TABLE Cliente_Conta (
    codigo_cliente INT,
    numero_conta INT,
    PRIMARY KEY (codigo_cliente, numero_conta),
    FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo),
    FOREIGN KEY (numero_conta) REFERENCES Conta(numero)
);

CREATE TABLE Conta_Poupanca (
    numero_conta INT PRIMARY KEY,
    taxa_juros DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (numero_conta) REFERENCES Conta(numero)
);

CREATE TABLE Conta_Corrente (
    numero_conta INT PRIMARY KEY,
    FOREIGN KEY (numero_conta) REFERENCES Conta(numero)
);

CREATE TABLE Saque (
    id_saque INT PRIMARY KEY,
    valor DECIMAL(12,2) NOT NULL,
    data DATE NOT NULL,
    numero_conta INT NOT NULL,
    FOREIGN KEY (numero_conta) REFERENCES Conta_Corrente(numero_conta)
);