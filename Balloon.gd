extends Area3D

@export var clicks_to_pop : int = 5 ## Amount of clicks it takes to pop the balloon
@export var size_increase : float = 0.1
@export var score_to_give : int = 1


func _on_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		scale += Vector3.ONE * size_increase
		clicks_to_pop -= 1
		
	if clicks_to_pop < 1:
		$"/root/Main".increase_score(score_to_give)
		queue_free()
