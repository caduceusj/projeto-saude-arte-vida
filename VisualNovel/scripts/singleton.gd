extends Node

var checkpoint_scene = "res://VisualNovel/cenas/visual_novel.tscn"
var dialogue_checkpoint = "inicio"
var feedback:String = ""
var cena1_background = "res://VisualNovel/sprites/background1_neonatal.png"
var cena2_background = "res://VisualNovel/sprites/background2_neonatal.png"

var character1 = "res://VisualNovel/sprites/enfermeira1.png"
var character2 = "" #random

var mae_sprites = [
	"res://VisualNovel/sprites/mae1.png",
	"res://VisualNovel/sprites/mae2.png",
	"res://VisualNovel/sprites/mae3.png",
	"res://VisualNovel/sprites/mae4.png",
]

var casos = [
	"[center]HOSPITAL INFANTIL[/center]
[center]UTI Neonatal[/center]

Paciente: Maria Alice Silva
Prontuário: 123456
Leito: 01
Peso Atual: 1200g

Prescrição:
	
01. Incubadora aquecida para temperatura axialr 36, 5-37,5º C

- Horário: Em Uso
——————————————————————
02. Oximetria de pulso contínua

- Horário: Em Uso
——————————————————————
03. Cabeceira elevada em 30ª

- Horário: Atenção
——————————————————————
04. CPAP Nasal: FiO2 40%, PEEP 6mmHg

- Horário: Atenção
——————————————————————
05. Dieta zero, registrar resíduo gástrico em balança hídrico

- Horário: 12h 15h 18h 21h 24h 03h 06h 09h
——————————————————————
06. Oxacilina (50mg/1ml) ​fazer 0,6 ml  + 9,4 ml  SF 0,9%  , 8/8 horas,  EV,  em 30 minutos  D0/7

- Horário: 08h 16h 24h
——————————————————————
07. Amicacina ( 5 mg/ml), fazer 3,6 ml + 1,4 ml SF 0,9%, EV, 24h. D0/7

- Horário: 20h
——————————————————————
08. Hidratação Venosa para 24h
SG 10% —-------------99,3 ml 
NaCl 0,9% —----------19,5 ml
KCL 19,1%------------1,2
Volume Total —------ 120ml
Velocidade de infusão em BIC:5 ml/h
(VIG 6,9 Concentração de glicose menor que 12,5%)

- Horário: 8h30
——————————————————————
09. Dobutamina (12,5mg/ml) fazer 24 ml, EV,  Velocidade de infusão em BIC:0,3 ml/h  

- Horário: 10h30",

# Caso 2

"CASO 2",

# Caso 3

"CASO 3",

# Caso 4

"CASO 4",

# Caso 5

"[center]HOSPITAL INFANTIL[/center]
[center]UTI Neonatal[/center]

Paciente: João Pedro Araújo
Prontuário: 22345678
Leito: 02
Peso Atual: 4500g

Prescrição:
	
01. Incubadora aquecida para temperatura axilar 36, 5-37,5º C

- Horário: Em uso
——————————————————————
02. Oximetria de pulso contínua

- Horário: Em uso
——————————————————————
03. Cabeceira elevada em 30º

- Horário: Atenção
——————————————————————
04. CPAP Nasal: FiO2 30%, PEEP 6 mmHg

- Horário: Atenção
——————————————————————
05. Dieta zero, SOG aberta

- Horário: Atenção
——————————————————————
06. Glicemia capilar 1 hora de vida, 3 horas de vida, 6/6 horas

- Horário: 6h 8h 14h 20h 02h
——————————————————————
07. Hidratação Venosa para 24h
SG 5% —--------------443 ml 
NaCl 20% —----------3,4 ml
KCL 19,1%------------3,6
Volume Total —------450 ml
Velocidade de infusão em BIC:18,8 ml/h
(VIG 3,4 Concentração de glicose menor que 12,5%)

- Horário: 9h",

# Caso 6

"CASO 6",

# Caso 7

"CASO 7",

# Caso 8

"CASO 8",
]
