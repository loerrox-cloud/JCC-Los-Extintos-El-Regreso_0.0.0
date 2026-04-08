@tool
class_name Carta extends Node2D

signal mouse_entered(carta: Carta)
signal mouse_exited(carta: Carta)

@export var Nombre: String = "Nombre"
@export var Descripcion: String = "Ataque"
@export var Vida: int = 50
@export var Coste: int = 1
@export var CartaSprite: Sprite2D
@export var CALLE: int = 2


@onready var NombreLabel: Label = $NombreLabel
@onready var CosteLabel: Label = $Coste/CosteLabel
@onready var VidaLabel: Label = $Vida/VidaLabel
@onready var DescripcionLabel: Label = $Descripcion/DescripcionLabel
@onready var base_sprite: Sprite2D = $CartaBaseSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		set_values(Coste, Vida, Nombre, Descripcion)
	
func set_values(Coste: int, Vida: int, Nombre: String, Descripcion: String): 
	CosteLabel.set_text(str(Coste))
	VidaLabel.set_text(str(Vida))
	NombreLabel.set_text(Nombre) 
	DescripcionLabel.set_text(Descripcion) 

func highlight():
	base_sprite.set_modulate(Color(1, 0.5, 0.1, 1)) 

func unhighlight():
	base_sprite.set_modulate(Color(1, 1, 1, 1)) 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func prueba1():
	#print("touched : " + Nombre)
	pass

func _on_area_2d_mouse_entered(carta: Carta):
	mouse_entered.emit(self)
	#highlight()

func _on_area_2d_mouse_exited(carta: Carta):
	mouse_exited.emit(self)
	#unhighlight()
