@tool
class_name Carta extends Node2D

signal mouse_entered(card: Carta)
signal mouse_exited(card: Carta)

@export var Nombre: String = "Nombre"
@export var Descripcion: String = "Ataque"
@export var Vida: int = 50
@export var Coste: int = 1
@export var CartaSprite: Sprite2D
@export var Defensa: int = 3
@export var Velocidad: int = 2
@export var Rareza: String = "Plata"
@export var Terreno: String = "Terrestre"
@export var Periodo: String = "Paleozoico"
@export var Ataque: int = 10
@export var CALLE: int = 2
@export var AURA: int = 7

@export var max_font_size: int = 24 # estos dos para ajustar tamaño del nombre
@export var min_font_size: int = 10


@onready var NombreLabel: Label = $NombreLabel
@onready var CosteLabel: Label = $Coste/CosteLabel
@onready var VidaLabel: Label = $Vida/VidaLabel
@onready var DescripcionLabel: Label = $Descripcion/DescripcionLabel
@onready var base_sprite: Sprite2D = $CartaBaseSprite
@onready var VelocidadLabel: Label = $Velocidad/VelocidadLabel
@onready var RarezaLabel: Label = $Rareza/RarezaLabel
@onready var TerrenoLabel: Label = $Terreno/TerrenoLabel
@onready var PeriodoLabel: Label = $Periodo/PeriodoLabel
@onready var DefensaLabel: Label = $Defensa/DefensaLabel
@onready var AtaqueLabel: Label = $Ataque/AtaqueLabel



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_values(Nombre, Coste, Vida, Ataque, Defensa, Velocidad, Rareza, Terreno, Periodo, Descripcion)
	await get_tree().create_timer(0.3).timeout #Espera 1 segundo
	print(NombreLabel.text.length())
	if int(NombreLabel.text.length()) > 12 :
		print("si")
		$NombreLabel.scale = Vector2(0.35, 0.35)
	
func set_values(Nombre: String, Coste: int, Vida: int, Ataque: int, Defensa: int, Velocidad: int, Rareza: String, Terreno: String, Periodo: String, Descripcion: String): 
	CosteLabel.set_text(str(Coste))
	VidaLabel.set_text(str(Vida))
	NombreLabel.set_text(Nombre) 
	DescripcionLabel.set_text(Descripcion)
	VelocidadLabel.set_text(str(Velocidad))
	RarezaLabel.set_text(Rareza)
	TerrenoLabel.set_text(Terreno)
	DefensaLabel.set_text(str(Defensa))
	AtaqueLabel.set_text(str(Ataque))
	PeriodoLabel.set_text(str(Periodo))
	

func highlight():
	base_sprite.set_modulate(Color(1, 0.5, 0.1, 1)) 

func unhighlight():
	base_sprite.set_modulate(Color(1, 1, 1, 1)) 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_up"):
		#print("hola")
		
	pass

func prueba1():
	#print("touched : " + Nombre)
	pass

#func _on_area_2d_mouse_entered(carta: Carta):
	mouse_entered.emit(self)
	#highlight()

#func _on_area_2d_mouse_exited(carta: Carta):
	mouse_exited.emit(self)
	#unhighlight()
	
	# 	INTENTO DE PROGRAMACION DE COLISIONES:
	
	#var movimiento: float = 200.0	 
#func _physics_process(delta: float) -> void:
	#var direccion := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var movimiento = direccion * Velocidad
#	move_and_slide()
 

#func _ajustar_tamano_texto() -> void:
	var fuente = $NombreLabel
	var tamano_actual = max_font_size 
	
# Obtenemos el ancho disponible del Label
	var ancho_disponible = fuente.x
	
	if ancho_disponible <= 0:
		return
		
# Reducimos el tamaño de la fuente en bucle mientras el texto sea más ancho que el espacio
	var tamano_texto = fuente.get_string_size(fuente, HORIZONTAL_ALIGNMENT_LEFT, -1, tamano_actual).x
	
	while tamano_texto > ancho_disponible and tamano_actual > min_font_size:
		tamano_actual -= 1
#		add_theme_font_size_override(fuente, tamano_actual)
#		tamano_texto = fuente.get_string_size(text, HORIZONTAL_ALIGNMENT_LEFT, -1, tamano_actual).x
