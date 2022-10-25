extends Camera2D

onready var zoomfactor= 1 #насколько далеко отдаляется камера
onready var zoomspeed = 20 #скорость отдаления
onready var zoomstep=0.03 #насколько сильно отдаление камеры при прокрутке колеса мыши
onready var factorstep=0.01 #насколько быстро отдаление будет прекращаться

func _ready():
	pass # Replace with function body.

func _process(delta):
	zoom.x = lerp(zoom.x, zoomfactor* zoom.x, zoomspeed*delta)
	zoom.y = lerp(zoom.y, zoomfactor* zoom.y, zoomspeed*delta)
	
	zoom.x = clamp(zoom.x, 0.5, 2)
	zoom.y = clamp(zoom.y, 0.5, 2)
	
	if zoomfactor > 1:
		zoomfactor-=factorstep
	elif zoomfactor<1:
		zoomfactor+=factorstep

func _input(event):
	
	if event is InputEventMouseButton:
		
		if event.button_index==BUTTON_WHEEL_UP:
			zoomfactor-=zoomstep
		elif event.button_index==BUTTON_WHEEL_DOWN:
			zoomfactor+=zoomstep
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
