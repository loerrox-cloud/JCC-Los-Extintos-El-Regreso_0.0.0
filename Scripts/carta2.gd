class_name carta extends Node2D

@export var Buff: String = "NombreBuff"
@export var Coste: int = 1
@export var CartaSprite: Sprite2D


@onready var BuffLabel: Label = $BuffLabel
@onready var CosteLabel: Label = $Coste/CosteLabel
@onready var VidaLabel: Label = $Vida/VidaLabel
@onready var DescripcionLabel: Label = $Descripcion/DescripcionLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		set_values(Coste, Buff)
	
func set_values(Coste: int, Buff: String): 
	CosteLabel.set_text(str(Coste))
	BuffLabel.set_text(Buff) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
