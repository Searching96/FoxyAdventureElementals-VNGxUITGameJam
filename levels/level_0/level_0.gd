class_name Level0
extends Node

static var player: Player = null

func _ready() -> void:
	await GameManager.level_ready

	if AudioManager:
		AudioManager.play_music("ambience_beach")

	GameManager.logger.debug("Level 0 ready")

	player = $Player

	call_deferred("start_dialogue")

func start_dialogue():
	Dialogic.start("level_0")
