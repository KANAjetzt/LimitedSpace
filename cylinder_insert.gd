class_name InsertCylinder
extends RigidBody3D


@export var sfx: Array[AudioStream]

var is_mouse_inside := false
var camera: Camera3DOrbit

@onready var sfx_player: AudioStreamPlayer3D = %AudioStreamPlayer3D


func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	if Input.is_action_pressed("grab"):
		var intersect_position := Global.mouse_pos_3d
		var direction_to_cursor := position.direction_to(intersect_position)

		state.apply_central_force(direction_to_cursor * 10)


func play_random_sfx() -> void:
	sfx_player.stream = sfx.pick_random()
	sfx_player.pitch_scale = randf_range(0.8, 1.2)
	sfx_player.play()

func _on_mouse_entered() -> void:
	is_mouse_inside = true


func _on_mouse_exited() -> void:
	is_mouse_inside = false


func _on_body_entered(body: Node) -> void:
	play_random_sfx()
