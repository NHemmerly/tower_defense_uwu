class_name InvSlot
extends Panel

@export var tower_item: TowerRes
var mouse_in: bool = false	

signal tower_selected(tower_item: TowerRes)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if tower_item:
		$ItemSprite.texture = tower_item.turret

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	mouse_in = true	

func _on_mouse_exited() -> void:
	mouse_in = false

func _on_gui_input(event: InputEvent) -> void:
	if mouse_in && Input.is_action_just_pressed("click"):
		get_viewport().set_input_as_handled()
		tower_selected.emit(tower_item)
