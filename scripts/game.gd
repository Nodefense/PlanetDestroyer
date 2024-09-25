extends Node2D

var rng = RandomNumberGenerator.new()
@onready var obstacle = $Obstacle
var lanes = [16, 50, 81, 112, 143]
@onready var timer = $Timer
@onready var time = $Time
@onready var score_left = $ScoreLeft
@onready var level_label = $Level
var score = 0
var level_score = 5
@export var time_left: float = 10
var obstacle_scene = preload("res://scenes/obstacle.tscn")
var level = 1

func new_level(level):
	time_left = 10 + level*1.5
	level_score += 3
	level_label.text = "Level " + str(level)

func _ready():
	timer.start()




func _process(delta):
	time_left -= delta
	if time_left <= 0:
		if score < level_score:
			game_over()
	if score >= level_score:
		level += 1
		new_level(level)
		score = 0
	time.text = "Time left: " + str(floor(time_left)) + "s"
	score_left.text = "Score left: " + str(level_score-score)
	print(score)

func game_over():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	# Display game over screen or restart


func _on_timer_timeout():
	var obstacle = obstacle_scene.instantiate()
	obstacle.position.x = lanes[rng.randi_range(0,4)]
	obstacle.position.y = -50
	add_child(obstacle)
