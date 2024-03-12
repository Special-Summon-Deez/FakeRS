extends Control

@onready var Inventory = preload("res://Resources/Player_Inventory.tres")
@onready var slots = $Control/NinePatchRect/GridContainer.get_children()


var is_open:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.offset_left *= 3
	$Control.offset_top *= 3
	$Control.scale *= 3
	
	
	Inventory.update.connect(update_slots)
	close()
	update_slots()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Inventory"):
		if is_open:
			close()
		else:
			open()
		
func update_slots():
	for i in range(min(Inventory.slots.size(),slots.size())):
		slots[i].update(Inventory.slots[i])

func open():
	is_open = true
	visible = true
	
func close():
	is_open = false
	visible = false
