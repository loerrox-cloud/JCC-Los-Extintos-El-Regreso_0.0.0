extends Node2D
@onready var Carta: PackedScene = preload("res://Escenas/cartasss/CartaEscena.tscn")
@onready var CartaBuff: PackedScene = preload("res://Escenas/cartasss/CartaBuff.tscn")
# @onready var spawn = $CanvasLayer/Spawn <- Esto era para generar cartas en un sitio fijo de la pantalla 
@onready var hand: Hand = $CanvasLayer/Mano

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float): #-> void:
	pass

func _on_button_button_down():
	var Carta = Carta.instantiate() #dfnfngfjgnjfn
	hand.add_card(Carta)
	#Carta.set_values(7, 90, "Manolo", "golpetaso")
	

func _on_button_2_button_down() -> void:
	var Carta = Carta.instantiate()
	hand.add_card(Carta)


func _on_button_3_button_down() -> void:
	var Carta = CartaBuff.instantiate()
	hand.add_card(Carta)
	#Carta.set_values(7, 90, "Tiktaalik", "Golpe") 


func _on_button_4_button_down() -> void:
	var Carta = Carta.instantiate()
	hand.add_card(Carta)
	#Carta.set_values(3, 10, "Argentavis", "Arañazo")
