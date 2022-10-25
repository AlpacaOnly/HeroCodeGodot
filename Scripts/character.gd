extends KinematicBody2D

var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	var velocity=Vector2()
	if Input.is_action_pressed("up"):
		velocity.y-=speed 
	if Input.is_action_pressed("down"):
		velocity.y+=speed
	if Input.is_action_pressed("left"):
		velocity.x-=speed 
	if Input.is_action_pressed("right"):
		velocity.x+=speed
	move_and_slide(velocity)
	
	position.x =clamp (position.x,0,10000)
	position.y =clamp (position.y,0,10000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
