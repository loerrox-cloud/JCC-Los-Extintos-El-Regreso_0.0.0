class_name Carta extends Node2D

@export var Nombre: String = "Nombre"
@export var Descripcion: String = "Ataque"
@export var Vida: int = 50
@export var Coste: int = 1
@export var CartaSprite: Node2D
@export var CALLE: int = 2


@onready var NombreLabel: Label = $NombreLabel
@onready var CosteLabel: Label = $Coste/CosteLabel
@onready var VidaLabel: Label = $Vida/VidaLabel
@onready var DescripcionLabel: Label = $Descripcion/DescripcionLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		set_values(Coste, Vida, Nombre, Descripcion)
	
func set_values(Coste: int, Vida: int, Nombre: String, Descripcion: String): 
	CosteLabel.set_text(str(Coste))
	VidaLabel.set_text(str(Vida))
	NombreLabel.set_text(Nombre) 
	DescripcionLabel.set_text(Descripcion) 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
