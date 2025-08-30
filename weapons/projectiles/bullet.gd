class_name Bullet
extends Area2D

@export var data: BulletData
@export var target: Entity
@export var sprite: Sprite2D
@export var damage: float

var direction: Vector2
var target_died: bool = false

signal hit_enemy(entity: Entity)

func _ready() -> void:
	Events.connect("entity_died", _on_target_died)
	sprite.texture = data.sprite

func _physics_process(delta: float) -> void:
	hone_target(delta)

func hone_target(delta) -> void:
	if !target_died && target != null:
		direction = target.global_position - global_position
	position += data.speed * direction * delta
	
func set_target(ent) -> void:
	if ent:
		target = ent
		

func _on_hit_enemy(entity: Entity) -> void:
	print("nicew")
	if entity == target:
		entity.health.damage(damage)
		queue_free()
	elif target_died:
		entity.health.damage(damage)
		queue_free()
		
func _on_target_died(entity: Entity) -> void:
	if entity == target:
		target_died = true


func _on_body_entered(body: Node2D) -> void:
	print("nicew")
	if body is Entity && body == target:
		body.health.damage(damage)
		queue_free()
	elif target_died and body.is_in_group("enemies"):
		body.health.damage(damage)
		queue_free()
