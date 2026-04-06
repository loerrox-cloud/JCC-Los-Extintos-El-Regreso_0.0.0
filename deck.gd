extends Node2D
@onready var Carta: PackedScene = preload("res://Escenas/cartasss/CartaEscena.tscn")
@onready var CartaBuff: PackedScene = preload("res://Escenas/cartasss/CartaBuff.tscn")
@onready var spawn = $CanvasLayer/Spawn
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down():
	var Carta = Carta.instantiate() #dfnfngfjgnjfn
	spawn.add_child(Carta)
	Carta.set_values(7, 90, "Manolo", "golpetaso")
	

func _on_button_2_button_down() -> void:
	var Carta = Carta.instantiate()
	spawn.add_child(Carta)


func _on_button_3_button_down() -> void:
	var Carta = CartaBuff.instantiate()
	spawn.add_child(Carta)
	Carta.set_values(7, 90, "Tiktaalik", "Golpe") 


func _on_button_4_button_down() -> void:
	var Carta = Carta.instantiate()
	spawn.add_child(Carta)
	Carta.set_values(3, 10, "Argentavis", "Arañazo")
