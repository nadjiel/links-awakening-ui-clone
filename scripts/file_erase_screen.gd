extends Navigator

@onready var selections: VOptionGroup = $Margin/Selections

@onready var go_back: HBoxContainer = $Margin/Selections/GoBack

@onready var popup: HOptionGroup = $Margin/Selections/Popup

func show_popup() -> void:
	selections.focus_next()
	go_back.visible = false
	popup.visible = true
