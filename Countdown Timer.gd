extends Node
class_name Countdown

@onready var label = $Label
@onready var timer = $Timer
@onready var animated_sprite = $AnimatedSprite2D2
var current_animation = ""

func _ready():
	self.visible = false

func time_left():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]

func _process(_delta):
	label.text = "%02d:%02d" % time_left()
	check_for_sprite_change()

func _on_Timer_timeout():
	get_tree().change_scene_to_file("res://win.tscn")

func _on_player_detection_body_entered(body):
	self.visible = true
	timer.start()

func check_for_sprite_change():
	var time_left = int(timer.time_left)
	
	# Set the correct animations based on time left
	if time_left <= 60 and time_left > 50 and current_animation != "Alarmed":
		animated_sprite.play("Alarmed")
		current_animation = "Alarmed"
		
	elif time_left <= 50 and time_left > 40 and current_animation != "Angry":
		animated_sprite.play("Angry")
		current_animation = "Angry"
		
	elif time_left <= 40 and time_left > 30 and current_animation != "Furious":
		animated_sprite.play("Furious")
		current_animation = "Furious"
	elif time_left <= 30 and time_left > 10 and current_animation != "Unamused":
		animated_sprite.play("Unamused")
		current_animation = "Unamused"


