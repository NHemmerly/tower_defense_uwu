extends Control

@export var tower_inv: TowerInv
signal hold_new_tower(tower_item: TowerRes)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setup_bar() -> void:
	var new_slot = load("res://ui/inv_slot.tscn")
	for tower in tower_inv.towers:
		var new_tower = new_slot.instantiate()
		new_tower.tower_item = tower
		print(new_tower.tower_item)
		$MarginContainer/Panel/ScrollContainer/bar.add_child(new_tower)
		new_tower.tower_selected.connect(_on_tower_selected)
		
func _on_tower_selected(new_tower: TowerRes):
	hold_new_tower.emit(new_tower)
		
