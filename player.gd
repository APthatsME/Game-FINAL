extends CharacterBody2D
 
var speed = 250

func _physics_process(_delta):
	velocity = Input.get_vector("ui_left","ui_right","ui_up","ui_down") * speed
	move_and_slide()
	# Get the viewport size
	var viewport_size = get_viewport_rect().size

	# Clamp the player's position within the viewport
	position.x = clamp(position.x, 0, viewport_size.x)
	position.y = clamp(position.y, 0, viewport_size.y)


func end_game():
	get_tree().change_scene_to_file("res://gameover.tscn")
