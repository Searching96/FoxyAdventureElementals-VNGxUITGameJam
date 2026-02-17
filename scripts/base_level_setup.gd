class_name BaseLevelSetup
extends Node

## Base class for level scripts that share common setup logic.
## Override level_number in subclasses. Set play_audio = false to skip audio.

@export var level_number: int = -1
@export var music_id: String = "music_background"
@export var ambience_id: String = "ambience_forest"
@export var ambience_volume: float = -10.0
@export var play_audio: bool = true

func _ready() -> void:
	if level_number < 0:
		push_error("BaseLevelSetup: level_number not set!")
		return
	GameManager.current_level = level_number

	if play_audio and AudioManager:
		AudioManager.play_music(music_id)
		AudioManager.play_ambience(ambience_id, ambience_volume)

	_setup_player_skills()

func _setup_player_skills() -> void:
	var skill_names: Array[String] = [
		"Stun Shot", "Thunderbolt", "Heal Over Time",
		"Thousand Swords", "Comet Rain"
	]
	var player = get_tree().get_first_node_in_group("player")
	if not player:
		push_error("BaseLevelSetup: No player found in group 'player'")
		return
	(player as Player).collect_blade()
	(player as Player).collect_wand()
	for i in skill_names.size():
		var skill = SkillDatabase.get_skill_by_name(skill_names[i])
		if skill:
			SkillTreeManager.unlock_skill(skill_names[i])
			SkillTreeManager.equip_skill(i, skill_names[i])
