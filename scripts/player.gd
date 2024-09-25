extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var lanes = [16, 50, 81, 112, 143]
var current_lane = rng.randi_range(0,4)
const speed = 0
@onready var obstacle = $"."
@onready var game = $".."

func _ready():
	position.x = lanes[current_lane]

func _input(event):
	if event.is_action_pressed("key_left"):
		if current_lane > 0:
			current_lane -= 1
			position.x = lanes[current_lane]
	elif event.is_action_pressed("key_right"):
		if current_lane < lanes.size() - 1:
			current_lane += 1
			position.x = lanes[current_lane]

func _physics_process(delta):
	position.y -= speed * delta
