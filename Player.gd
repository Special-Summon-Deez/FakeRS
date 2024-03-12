extends CharacterBody2D


const SPEED = 100.0
var direction : Vector2 = Vector2.ZERO

@export var inv:Inv
@onready var animation_tree : AnimationTree = $AnimationTree

func _ready():
	animation_tree.active = true

func _process(delta):
	update_animation_tree()

func _physics_process(delta):
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("Walkleft","Walkright","Walkup","Walkdown").normalized()
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func update_animation_tree():
	if velocity == Vector2.ZERO:
		animation_tree["parameters/conditions/Idle"] = true
		animation_tree["parameters/conditions/Walking"] = false
	else:
		animation_tree["parameters/conditions/Idle"] = false
		animation_tree["parameters/conditions/Walking"] = true
		
	if direction != Vector2.ZERO:
		animation_tree["parameters/Idle/blend_position"] = direction
		animation_tree["parameters/Walking/blend_position"] = direction
		
func collect(item):
	inv.Insert(item)
