
class_name NavigatableUI
extends Control

signal focus_changed(new_focus: bool)
signal focused
signal unfocused

@export var focus: bool = false:
	set = set_focus

@export var children: Array[NavigatableUI] = []

@export var previous_navigatable: NavigatableUI

@export var next_navigatable: NavigatableUI

func unfocus_children() -> void:
	for child: NavigatableUI in children:
		child.set_focus(false)

func set_focus(new_value: bool) -> void:
	var old_value: bool = focus
	
	focus = new_value
	
	if old_value != new_value:
		focus_changed.emit(new_value)
		
		if new_value == true:
			focused.emit()
		else:
			unfocused.emit()

func make_focused() -> void:
	focus = true

func unfocus() -> void:
	focus = false

func focus_previous() -> void:
	if previous_navigatable == null:
		return
	
	focus = false
	previous_navigatable.focus = true

func focus_next() -> void:
	if next_navigatable == null:
		return
	
	focus = false
	next_navigatable.focus = true
