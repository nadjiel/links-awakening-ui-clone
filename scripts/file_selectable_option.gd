extends SelectableOption

@export var file_selection_icon_scene: PackedScene

@export var icon_parent: Node

@export var default_icon_visibility: bool = true

var icon_node: Node

func _ready() -> void:
	if default_icon_visibility == false:
		call_deferred("hide_icon")
	
	was_selected.connect(show_icon)
	was_unselected.connect(hide_icon)

func icon_is_shown() -> bool:
	return icon_node != null

func show_icon() -> void:
	if not selected:
		return
	if icon_is_shown():
		return
	if file_selection_icon_scene == null:
		return
	if icon_parent == null:
		return
	
	icon_node = file_selection_icon_scene.instantiate()
	
	icon_parent.add_child(icon_node)
	icon_parent.move_child(icon_node, 0)

func hide_icon() -> void:
	if not icon_is_shown():
		return
	if icon_parent == null:
		return
	
	icon_parent.remove_child(icon_node)
	icon_node.queue_free()
