extends StaticBody3D


signal inside_detected


func _on_area_3d_body_entered(body: Node3D) -> void:
	inside_detected.emit()
