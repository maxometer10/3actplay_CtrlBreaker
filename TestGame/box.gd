extends RigidBody2D

var dragging = false
var dragStartPosition = Vector2()
var launchPower = 500  # Adjust this value for the desired launch strength
var launchDirection = Vector2()


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if Input.is_action_pressed("left click"):
		dragging = true
		dragStartPosition = event.position - global_position
		set_process(true)
		
	else:
		dragging = false
		set_process(false)
#		launchDirection = (global_position - get_global_mouse_position()).normalized()
#		RigidBody2D.apply_impulse(Vector2.ZERO, launchDirection * launchPower)

func _process(_delta):
	if dragging:
		global_position = get_global_mouse_position() - dragStartPosition 
