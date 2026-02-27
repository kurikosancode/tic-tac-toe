extends Node

@onready var player := AudioStreamPlayer.new()
var playlist: Array[AudioStream]
var index: int = 0

func _ready() -> void:
	var music_path = FileManager.get_files_in_folder(Constants.MUSIC_PATH)
	for path in music_path:
		if path.ends_with(Constants.MP3_EXTENSION):
			playlist.append(load(path))
		
	add_child(player)
	player.finished.connect(_on_finished)
	playlist.shuffle()
	play_song()

func play_song():
	var song = playlist[index]
	player.stream = song
	player.play()
	print("Now Playing: ", song)

func _on_finished():
	index = (index + 1) % playlist.size()
	play_song()
