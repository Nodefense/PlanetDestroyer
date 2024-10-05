"""
Copyright (C) 2024 Leonardo Bandeira

This file is part of PlanetDestroyer.

PlanetDestroyer is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License,
or (at your option) any later version.

PlanetDestroyer is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with PlanetDestroyer.
If not, see <https://www.gnu.org/licenses/>. 
"""

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
