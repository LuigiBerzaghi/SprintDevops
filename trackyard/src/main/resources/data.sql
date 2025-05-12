-- Inserir 5 pátios
INSERT INTO PATIOS (id_patio, nome, telefone, endereco) VALUES
    (5, 'Pátio Master Mottu SP', '11-4444-5555', 'Rua Antiga, 789, São Paulo, SP'),
    (6, 'Pátio Mottu RJ Sul', '21-3333-4444', 'Av. Atlântica, 456, Rio de Janeiro, RJ'),
    (7, 'Pátio Mottu BH Norte', '31-2222-3333', 'Rua Minas, 123, Belo Horizonte, MG'),
    (8, 'Pátio Mottu Piauí', '52-5555-6666', 'Rua Linda, 101, Cidade do Piauí'),
    (9, 'Pátio Mottu Recife', '81-7777-8888', 'Av. Boa Viagem, 202, Recife, PE');

-- Inserir 5 motos, associando a pátios
INSERT INTO MOTOS (id_moto, modelo, placa) VALUES
    ('MOTO005', 'Mottu Sport 110i', 'CBA-0219'),
    ('MOTO006', 'Mottu pop', 'XYZ-5678'),
    ('MOTO007', 'Mottu-E', 'DEF-9012'),
    ('MOTO008', 'Mottu Sport 110i', 'GHI-3456'),
    ('MOTO009', 'Mottu pop', 'JKL-7890');