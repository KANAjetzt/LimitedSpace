class_name CursorPointer
extends Node3D


const RAY_LENGTH := 1000.0

var camera: Camera3DOrbit


func _physics_process(delta: float) -> void:
	var intersect_dict := screen_point_to_ray()

	if not intersect_dict.is_empty():
		Global.mouse_pos_3d = intersect_dict.position
		global_position = intersect_dict.position
		look_at(global_position * 2, intersect_dict.normal)


func screen_point_to_ray() -> Dictionary:
	var space_state := get_world_3d().direct_space_state
	var mouse_position := get_viewport().get_mouse_position()
	var ray_origin := camera.project_ray_origin(mouse_position)
	var ray_end := ray_origin + camera.project_ray_normal(mouse_position) * RAY_LENGTH
	var query := PhysicsRayQueryParameters3D.create(ray_origin, ray_end)
	var intersect := space_state.intersect_ray(query)

	return intersect
