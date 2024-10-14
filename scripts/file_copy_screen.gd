extends Navigator

@onready var to_column: VOptionGroup = $Margin/Options/FileTable/ToColumn

@onready var go_back: HBoxContainer = $Margin/Options/GoBack

@onready var popup: HOptionGroup = $Margin/Options/Popup

func show_popup() -> void:
	to_column.focus_next()
	go_back.visible = false
	popup.visible = true
