extends Node
class_name Character

@export_category("stats")
@export var max_health : int
@export var defence : int
@export var max_stamina : int
@export_category("nodes")
@export var deck : Deck
@export var opponent : Node
var hand: Array[Card]

@onready var cur_health := max_stamina
@onready var cur_stamina := max_stamina

func _ready() -> void:
	deck.Owner = self
	
func take_damage(damage_value: int) -> void:
	if defence >= damage_value:
		defence -= damage_value
	elif defence > 0:
		damage_value -= defence
		defence = 0
		cur_health -= damage_value
	else: 
		cur_health -= damage_value
		#we could avoid the repetition of this line by using 
		#else:
		#	if defence > 0:
		#		damage_value -= defence
		#		defence = 0
		#	health -= damage_value
		#instead of the "elif...else" pattern.
		#but i find it a little harder to read. if you prefer that sintax,
		#change it. feel free to delete this comment after you read it

func gain_defence(defence_value: int) -> void:
	defence += defence_value

func change_stamina(stamina_value:int) -> void:
	cur_stamina += stamina_value
	if cur_stamina > max_stamina:
		cur_stamina = max_stamina
		
func use_card(card:Card) -> void:
	if card.atk > 0:
		opponent.take_damage(card.atk)
	elif card.def > 0:
		gain_defence(card.def)
	change_stamina(card.stamina)

func _choose_card_from_hand() -> void:
	pass
