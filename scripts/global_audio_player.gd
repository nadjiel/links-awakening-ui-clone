extends AudioStreamPlayer

func play_stream(stream_to_play: AudioStream, from_position: float = 0.0) -> void:
	stream = stream_to_play
	play(from_position)
