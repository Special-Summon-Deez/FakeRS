extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Drop")
	await get_tree().create_timer(1).timeout
	queue_free()

