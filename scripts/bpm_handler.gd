extends Node
class_name MusicHandler

signal on_beat

var beat_num = 1
@export var music:Array[AudioStreamMP3]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bpmtimer:Timer = Timer.new()
	bpmtimer.wait_time = 0.429
	bpmtimer.autostart = true
	bpmtimer.timeout.connect(beat)
	
	add_child(bpmtimer)
	musicing(0)

func musicing(index:int) -> void:
	var cur_music = music.get(index)
	var music_player:AudioStreamPlayer = AudioStreamPlayer.new()
	add_child(music_player)
	
	
	music_player.stream = cur_music
	music_player.play()
	cur_music.bpm = 140
	music_player.volume_linear = 0.3
	
	await music_player.finished
	
	if music.get(index + 1) == null:
		musicing(index)
		return
	
	musicing(index + 1)
	

func beat() -> void:
	on_beat.emit()
	beat_num += 1
	if beat_num == 4:
		beat_num = 0
