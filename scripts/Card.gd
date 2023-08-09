@tool #this allow for card stats to update even in editor
extends Node2D
class_name Card

@export var atk : int
@export var def : int
@export var stamina: int

@onready var Sword = $Icons/Sword
@onready var Shield = $Icons/Shield
@onready var Flask = $Icons/Flask
func _choose_icon() -> void:
	Sword.hide()
	Shield.hide()
	Flask.hide()
	if atk > 0:
		Sword.show()
		$Value.text = str(atk)
		$BackGround.color = Color(0.5,0.15,0)
	elif def > 0:
		Shield.show()
		$BackGround.color = Color(0,0.15,0.4)
		$Value.text = str(def)
	else:
		Flask.show()
		$BackGround.color = Color(0,0.3,0)
		$Value.text = ""
	
	if stamina > 0: #this way the "+" is explicit for positive numbers, just for estethic ahaha
		$Stamina.text = "+" + str(stamina)
	else:
		$Stamina.text = str(stamina)

func _ready() -> void:
	_choose_icon()

func _process(delta) -> void:
	if Engine.is_editor_hint(): 
		_choose_icon()
