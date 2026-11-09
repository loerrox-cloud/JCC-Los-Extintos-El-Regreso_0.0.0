extends Node2D

signal mouse_entered(carta: Carta)
signal mouse_exited(carta: Carta)

@onready var base_sprite: Sprite2D = $CartaBaseSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func highlight():
	base_sprite.set_modulate(Color(1, 0.5, 0.1, 1)) 

func unhighlight():
	base_sprite.set_modulate(Color(1, 1, 1, 1)) 

#func _on_mouse_entered(carta: Carta):
	mouse_entered.emit(self)# Replace with function body.


#func _on_mouse_exited(carta: Carta):
	mouse_exited.emit(self) # Replace with function body.
