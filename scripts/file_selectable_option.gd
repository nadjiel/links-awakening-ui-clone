extends SelectableOption

@export var file_selection_icon_scene: PackedScene

@export var icon_parent: Node

var icon_node: Node

func _ready() -> void:
	selected.connect(_on_selected)
	unselected.connect(_on_unselected)

func _on_selected() -> void:
	if file_selection_icon_scene == null:
		return
	if icon_parent == null:
		return
	
	icon_node = file_selection_icon_scene.instantiate()
	
	icon_parent.add_child(icon_node)
	icon_parent.move_child(icon_node, 0)

func _on_unselected() -> void:
	if icon_parent == null:
		return
	if icon_node == null:
		return
	
	icon_parent.remove_child(icon_node)
	icon_node.queue_free()
