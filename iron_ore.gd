extends Node2D

@export var item:InvItem

var state = "Empty"
var player_in_area: bool = false
var player:CharacterBody2D = null
var oreSprite = preload("res://Scenes/iron_ore_sprite.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	state = "Empty"
	$Spawn.start()

func _process(delta):
	if(state == "Empty"):
		$AnimatedSprite2D.play("EmptyOre")
	else:
		$AnimatedSprite2D.play("IronOre")
		if(player_in_area):
			if Input.is_action_just_pressed("Interact"):
				mineOre()
	
			
# Called every frame. 'delta' is the elapsed time since the previous frame.

func mineOre():
	print("You mine some Iron Ore.")
	state = "Empty"
	var oreSpawn = oreSprite.instantiate()
	oreSpawn.global_position = $Marker2D.global_position
	get_parent().add_child(oreSpawn)
	player.collect(item)
	$Spawn.start()

func _on_minable_area_body_entered(body):
	player_in_area = true
	player = body

func _on_spawn_timeout():
	state = "IronOre"


func _on_minable_area_body_exited(body):
	player_in_area = false
