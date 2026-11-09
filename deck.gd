extends Node2D
@onready var Carta: PackedScene = preload("res://Escenas/cartasss/CartaEscena.tscn")
@onready var CartaBuff: PackedScene = preload("res://Escenas/cartasss/CartaBuff.tscn")
@onready var CartaDef: PackedScene = preload("res://Escenas/cartasss/CartaDef.tscn")
@onready var EntradaTexto: LineEdit = $LineEdit
var text_file_path = "res://cartas.txt" 
var text_content = get_text_file_content(text_file_path) 
var text_content_parts: PackedStringArray = text_content.split("\n")
var text_content_parts_criaturas: PackedStringArray = text_content.split("Criatura")
var Listado: Array = []

var NombreCarta = "Aegirocassis" # La carta por defecto



# @onready var spawn = $CanvasLayer/Spawn <- Esto era para generar cartas en un sitio fijo de la pantalla 
@onready var hand: Hand = $CanvasLayer/Mano

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#EntradaTexto.text_submitted.connect(_on_line_edit_text_submitted) # en el ultimo paréntesis se pone la función que se quiera ejecutar cuando se pulse enter en el cuadro de escribir texto
	bucle_contador_Criaturas()
	pass
	# Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float): #-> void:
	pass

func _on_button_button_down():
	var NombreCarta = EntradaTexto.text
	
	var Carta = Carta.instantiate()
	hand.add_card(Carta)
	var IndiceCriatura = text_content_parts.find(NombreCarta) 
	Carta.set_values(text_content_parts[IndiceCriatura+0], int(text_content_parts[IndiceCriatura+1]), int(text_content_parts[IndiceCriatura+2]), int(text_content_parts[IndiceCriatura+3]), int(text_content_parts[IndiceCriatura+4]), int(text_content_parts[IndiceCriatura+5]), text_content_parts[IndiceCriatura+6], text_content_parts[IndiceCriatura+7], text_content_parts[IndiceCriatura+8], str(text_content_parts[IndiceCriatura+9]) + "\n" + str(text_content_parts[IndiceCriatura+10]) + "\n" + str(text_content_parts[IndiceCriatura+11]) )       
	

	#print(NombreCarta.length())
	
	
func _on_button_2_button_down() -> void:
	var Carta = CartaDef.instantiate()
	#Carta.set_values("Jeff", 2, int(text_content_parts[8])+1, int(text_content_parts[9])+3, int(text_content_parts[10]), int(text_content_parts[11]), "plat", "vuelador", "Paleozoiko", "Atake \n Defenza")
	hand.add_card(Carta)


func _on_button_3_button_down() -> void:
	pass
	
	#var Carta = CartaBuff.instantiate()
	#hand.add_card(Carta)
	#Carta.set_values(7, 90, "Tiktaalik", "Golpe") 


func _on_button_4_button_down() -> void:
	var NumeroAleatorio = randi_range(1,int(text_content_parts_criaturas.size()-2)) # Numero aleatorio entre 1 el total de integrantes en el grupo. Me pregunto que pasara cuando llegue a cero, si no pasa nada mejor
	
	var NombreCarta = Listado[NumeroAleatorio]
	var Carta = Carta.instantiate()
	hand.add_card(Carta)
	var IndiceCriatura = text_content_parts.find(NombreCarta)
	Carta.set_values(text_content_parts[IndiceCriatura+0], int(text_content_parts[IndiceCriatura+1]), int(text_content_parts[IndiceCriatura+2]), int(text_content_parts[IndiceCriatura+3]), int(text_content_parts[IndiceCriatura+4]), int(text_content_parts[IndiceCriatura+5]), text_content_parts[IndiceCriatura+6], text_content_parts[IndiceCriatura+7], text_content_parts[IndiceCriatura+8], str(text_content_parts[IndiceCriatura+9]) + "\n" + str(text_content_parts[IndiceCriatura+10]) + "\n" + str(text_content_parts[IndiceCriatura+11]) )
	
	pass
	
	
	
func bucle_contador_Criaturas() -> void:

	#print(text_content_parts_criaturas.size()-1)
	#print(NumeroAleatorio)
	
	var ConteoCriaturas = 1
	while ConteoCriaturas < text_content_parts_criaturas.size():
		ConteoCriaturas += 1
		Listado.append(text_content_parts[text_content_parts.find("Criatura " + str(ConteoCriaturas) + ":")+1])
	


func get_text_file_content(filePath):  # Función para leer archivo .txt
	var file = FileAccess.open(filePath, FileAccess.READ)
	var content = file.get_as_text()
	return content


	
