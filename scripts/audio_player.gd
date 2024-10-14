
class_name AudioPlayer
extends AudioStreamPlayer

@export var streams: Array[AudioStream] = []

func play_stream(
	stream_to_play: AudioStream,
	from_position: float = 0.0
) -> void:
	stream = stream_to_play
	play(from_position)

func play_stream_with_id(
	index: int,
	from_position: float = 0.0
) -> void:
	play_stream(streams[index], from_position)

func play_global_stream(
	stream_to_play: AudioStream,
	from_position: float = 0.0
) -> void:
	GlobalAudioPlayer.play_stream(stream_to_play, from_position)

func play_global_stream_with_id(
	index: int,
	from_position: float = 0.0
) -> void:
	play_global_stream(streams[index], from_position)
