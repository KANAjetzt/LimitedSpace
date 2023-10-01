extends PanelContainer


@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var label_winner_time: Label = %LabelWinnerTime


func fade_in() -> void:
	label_winner_time.text = label_winner_time.text % Global.current_time
	animation_player.play("fade_in")
