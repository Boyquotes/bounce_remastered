extends KinematicBody2D

export (int) var speed = 800
export (int) var jump_speed = -1200

export (int) var GRAVITY = 1200

const UP = Vector2(0,-1)

var velocity = Vector2()

func get_input():
    velocity.x = 0
    if is_on_floor() and Input.is_action_just_pressed('ui_up'):
        velocity.y = jump_speed
    if Input.is_action_pressed('ui_right'):
        velocity.x += speed
    if Input.is_action_pressed('ui_left'):
        velocity.x -= speed

func _physics_process(delta):
    velocity.y += delta * GRAVITY
    get_input()
    velocity = move_and_slide(velocity, UP)

    var collision = move_and_collide(velocity * delta)
    if collision:
        velocity = velocity.bounce(collision.normal)
