extends Area2D


var rng = RandomNumberGenerator.new()
var lanes = [17, 51, 82, 113, 144]
var current_lane = rng.randi_range(0,4)
@onready var game = $".."
@onready var obstacle = $"."
var speed = 100
@onready var animation_player = $AnimationPlayer

	
func _process(delta):
	position.x = lanes[current_lane]
	position.y += speed*delta
	speed = 100*(1.1**(game.level))


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("penis")
	game.score += 1
	animation_player.play("destroy")
