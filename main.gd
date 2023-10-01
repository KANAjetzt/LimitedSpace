extends Node3D


@onready var orbit_camera: Camera3DOrbit = %OrbitCamera
@onready var cylinder_insert: InsertCylinder = %Cylinder_Insert
@onready var cursor_point: Node3D = %CursorPoint
@onready var music: AudioStreamPlayer = $Music
@onready var button_mute: TextureButton = %ButtonMute
@onready var label_time: Label = %LabelTime
@onready var win_screen: PanelContainer = %WinScreen
@onready var win_sfx: AudioStreamPlayer = %WinSFX



var mute_icon := preload("res://assets/textures/ui/Mute.png")
var unmute_icon := preload("res://assets/textures/ui/UnMute.png")

func _ready() -> void:
	cursor_point.camera = orbit_camera


func _process(delta: float) -> void:
	Global.current_time = seconds2hhmmss(Time.get_ticks_msec() / 1000)
	label_time.text = Global.current_time


func seconds2hhmmss(total_seconds: float) -> String:
	#total_seconds = 12345
	var seconds:float = fmod(total_seconds , 60.0)
	var minutes:int   =  int(total_seconds / 60.0) % 60
	var hhmmss_string:String = "%02d:%02d" % [minutes, seconds]
	return hhmmss_string


func _on_button_mute_pressed() -> void:
	if music.playing:
		music.stop()
		button_mute.texture_normal = unmute_icon
	else:
		music.play()
		button_mute.texture_normal = mute_icon


func _on_box_inside_detected() -> void:
	win_screen.fade_in()
	win_sfx.play()
