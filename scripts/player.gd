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
