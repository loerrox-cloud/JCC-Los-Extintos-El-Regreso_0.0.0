@tool
class_name Hand extends Node2D

@export var card_angle: float = 1000 
@export var hand_radius: int = 100
@export var angle_limit: float = 25
@export var max_card_spread_angle: float = 10

@onready var carta = $Carta
@onready var colission_shape: CollisionShape2D = $DebugShape

var hand: Array = []
var touched: Array = []
var highlight_index: int = -1


func add_card(card: Node2D):
	hand.push_back(card)
	add_child(card)
	#card.mouse_entered.connect(_handle_card_touched)
	#card.mouse_exited.connect(_handle_card_untouched)
	reposition_cards()
	
func remove_card(index: int) -> Node2D:
	var removing_card = hand[index]
	hand.remove_at(index)
	remove_child(removing_card)
	reposition_cards()
	return removing_card

func reposition_cards():
	var card_spread = min(angle_limit / hand.size(), max_card_spread_angle)
	var current_angle = -(card_spread * hand.size() - 1 )/2 - 90
	for card in hand :
		_update_card_transform(card, current_angle)
		current_angle += card_spread
	
func get_card_position (angle_in_deg: float) -> Vector2:
	var x: float = hand_radius * cos(deg_to_rad(angle_in_deg))
	var y: float = hand_radius * sin(deg_to_rad(angle_in_deg))
	return Vector2(int(x), int(y))
	
func _update_card_transform(card: Node2D, angle_in_drag: float):
	card.set_position(get_card_position(angle_in_drag))
	card.set_rotation(deg_to_rad(angle_in_drag + 90))
	
	
func _handle_card_touched(card):
	touched.push_back(card)
	
	var card_index = hand.find(Carta) # Esto de aquí a abajo parece que no va aquí o no es necesario
	if highlight_index < card_index:
		highlight_index = card_index
		print("touched : " + carta.Buff)
	
func _handle_card_untouched():
	var card_index = hand.find(Carta)
	if highlight_index == card_index: # Esto de aquí a abajo parece que no va aquí o no es necesario
		highlight_index = -1
		print("untouched : " + carta.Nombre)
		hand[highlight_index].unhighlight()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	for card in hand:
		card.unhighlight()
		
		
	if !touched.is_empty():
		var highest_touched_index: int = -1
		
		for touched_card in touched:
			highest_touched_index = max(highest_touched_index, hand.find(touched_card))  
		
		if highest_touched_index >= 0 && highest_touched_index < hand.size(): 
			hand[highest_touched_index].highlight()
		
	if highlight_index >= 0 && highlight_index < hand.size() -1: 
		hand[highlight_index].highlight()
	
	if (colission_shape.shape as CircleShape2D).radius != hand_radius:
		(colission_shape.shape as CircleShape2D).set_radius(hand_radius)  
		
	carta.set_position(get_card_position(card_angle))
	carta.set_rotation(deg_to_rad(card_angle + 90))
