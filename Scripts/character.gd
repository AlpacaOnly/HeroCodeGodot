extends KinematicBody2D

onready var animation_tree=$AnimationTree
onready var animation_player=$AnimationPlayer
onready var state_machine=animation_tree.get("parameters/playback")
var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	animation_player.playback_speed = 200
	var velocity=Vector2()
	if Input.is_action_pressed("up"):
		velocity.y-=speed 
		state_machine.travel("walk_up")
	if Input.is_action_pressed("down"):
		velocity.y+=speed
		state_machine.travel("walk_down")
	if Input.is_action_pressed("left"):
		velocity.x-=speed 
		state_machine.travel("walk_left")
	if Input.is_action_pressed("right"):
		velocity.x+=speed
		state_machine.travel("walk_right")
	if Input.is_action_just_released("up"):
		velocity.y-=speed 
		state_machine.travel("idle_up")
	if Input.is_action_just_released("down"):
		velocity.y-=speed 
		state_machine.travel("idle_down")
	if Input.is_action_just_released("left"):
		velocity.y-=speed 
		state_machine.travel("idle_left")
	if Input.is_action_just_released("right"):
		velocity.y-=speed 
		state_machine.travel("idle_right")
	move_and_slide(velocity)
	
	position.x =clamp (position.x,0,10000)
	position.y =clamp (position.y,0,10000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
