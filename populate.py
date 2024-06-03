# Script for generating random data for the database
import random
import sys

def populate_motoristas(amount: int):
    nome = ["João", "Maria", "José", "Ana", "Pedro", "Lucas", "Mariana", "Paulo", "Carlos", "Fernanda", "Rafael", "Gabriela", "Luiz", "Juliana", "Ricardo", "Amanda", "Marcos", "Camila", "Antônio", "Patrícia", "Felipe", "Isabela", "Gustavo", "Natália", "Rafaela"]
    sobrenome = ["Silva", "Santos", "Oliveira", "Souza", "Pereira", "Carvalho", "Costa", "Ferreira", "Rodrigues", "Almeida", "Nascimento", "Lima", "Araújo", "Melo", "Barros", "Cardoso", "Gomes", "Martins", "Rocha", "Ribeiro", "Alves", "Monteiro", "Mendes", "Moreira", "Batista"]

    print("INSERT INTO Motoristas VALUES")
    for _ in range(amount):
        matricula = random.randint(10000, 99999)
        cpf = random.randint(11111111111, 99999999999)
        nome_completo = random.choice(nome) + " " + random.choice(sobrenome)
        data_nascimento = f"{random.randint(1950, 2004)}-{random.randint(1, 12)}-{random.randint(0, 28)}"

        print(f"('{matricula}', '{cpf}', '{nome_completo}', '{data_nascimento}'),")


def populate_viagens():
    dates = ['2024-06-01', '2024-06-02', '2024-06-03', '2024-06-04', '2024-06-05', '2024-06-06', '2024-06-07', '2024-06-08', '2024-06-09', '2024-06-10', '2024-06-11', '2024-06-12', '2024-06-13', '2024-06-14', '2024-06-15', '2024-06-16', '2024-06-17', '2024-06-18', '2024-06-19', '2024-06-20', '2024-06-21', '2024-06-22', '2024-06-23', '2024-06-24', '2024-06-25', '2024-06-26', '2024-06-27', '2024-06-28', '2024-06-29', '2024-06-30']
    horarios_u75 = ["07:20", "08:00", "08:40", "09:20", "10:00", "10:40", "11:20", "12:00", "12:40", "13:20", "14:00", "14:40", "15:20", "16:00", "16:40", "17:20", "18:00", "18:40", "19:20", "20:00", "20:40", "21:20", "22:00", "22:40"]
    horarios_u80 = ["07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00"]
    horarios_u95 = ["07:00", "07:35", "08:10", "08:45", "09:20", "09:55", "10:30", "11:05", "11:40", "12:15", "12:50", "13:25", "14:00", "14:35", "15:10", "15:45", "16:20", "16:55", "17:30", "18:05", "18:40", "19:15", "19:50", "20:25", "21:00", "21:35", "22:10", "22:45"]
    horarios_c05 = ["07:00", "07:10", "07:20", "07:30", "07:40", "07:50", "08:00", "08:10", "08:20", "08:30", "08:40", "08:50", "09:00", "09:10", "09:20", "09:30", "09:40", "09:50", "10:00", "10:10", "10:20", "10:30", "10:40", "10:50", "11:00", "11:10", "11:20", "11:30", "11:40", "11:50", "12:00", "12:10", "12:20", "12:30", "12:40", "12:50", "13:00", "13:10", "13:20", "13:30", "13:40", "13:50", "14:00", "14:10", "14:20", "14:30", "14:40", "14:50", "15:00", "15:10", "15:20", "15:30", "15:40", "15:50", "16:00", "16:10", "16:20", "16:30", "16:40", "16:50", "17:00", "17:10", "17:20", "17:30", "17:40", "17:50", "18:00", "18:10", "18:20", "18:30", "18:40", "18:50", "19:00", "19:10", "19:20", "19:30", "19:40", "19:50", "20:00", "20:10", "20:20", "20:30", "20:40", "20:50", "21:00", "21:10", "21:20", "21:30", "21:40", "21:50", "22:00", "22:10", "22:20", "22:30", "22:40", "22:50"]
    horarios_c10 = ["07:00", "07:20", "07:40", "08:00", "08:20", "08:40", "09:00", "09:20", "09:40", "10:00", "10:20", "10:40", "11:00", "11:20", "11:40", "12:00", "12:20", "12:40", "13:00", "13:20", "13:40", "14:00", "14:20", "14:40", "15:00", "15:20", "15:40", "16:00", "16:20", "16:40", "17:00", "17:20", "17:40", "18:00", "18:20", "18:40", "19:00", "19:20", "19:40", "20:00", "20:20", "20:40", "21:00", "21:20", "21:40", "22:00"]
    horarios_c20 = ["07:00", "07:25", "07:50", "08:15", "08:40", "09:05", "09:30", "09:55", "10:20", "10:45", "11:10", "11:35", "12:00", "12:25", "12:50", "13:15", "13:40", "14:05", "14:30", "14:55", "15:20", "15:45", "16:10", "16:35", "17:00", "17:25", "17:50", "18:15", "18:40", "19:05", "19:30", "19:55", "20:20", "20:45", "21:10", "21:35", "22:00"]
    horarios_i105 = ["07:00", "08:20", "09:40", "11:00", "12:20", "13:40", "15:00", "16:20", "17:40", "19:00", "20:20", "21:40"]
    horarios_i130 = ["07:00", "09:00", "11:00", "13:00", "15:00", "17:00", "19:00", "21:00"]
    horarios_i150 = ["07:00", "08:35", "10:10", "11:45", "13:20", "14:55", "16:30", "18:05", "19:40", "21:15"]
    indexed_id = ["U75_id", "U80_id", "U95_id", "C05_id", "C10_id", "C20_id", "I105_id", "I130_id", "I150_id"]

    print("INSERT INTO Viagens VALUES")
    for date in dates:
        for l_id, linha in enumerate([horarios_u75, horarios_u80, horarios_u95, horarios_c05, horarios_c10, horarios_c20, horarios_i105, horarios_i130, horarios_i150]):
            for horario in linha:
                print(f"('{date} {horario}:00', {indexed_id[l_id]}),")


def populate_onibus(amount: int):
    letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    marcas = ["Volvo", "Mercedes", "Scania", "Iveco", "Marcopolo", "Volksbus"]
    modelos = ["SPRINTER", "W9", "DW7", "THUNDER", "GRAN MIDI", "FOZ", "MB28", "APACHE U", "ESORE", "GRANVIA", "TORINO", "CAMPIONE"]

    print("INSERT INTO Onibus VALUES")
    for _ in range(amount):
        placa = random.choice(letras) + random.choice(letras) + random.choice(letras) + "-" + str(random.randint(1000, 9999))
        marca = random.choice(marcas)
        modelo = random.choice(modelos)
        print(f"('{placa}', '{marca}', '{modelo}'),")


def main():
    args = sys.argv[1:]

    if args[0] == "motoristas":
        populate_motoristas(25)
    elif args[0] == "viagens":
        populate_viagens()
    elif args[0] == "onibus":
        populate_onibus(30)
    else:
        print("Invalid arguments")


if __name__ == "__main__":
    main()