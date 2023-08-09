extends Node2D
class_name Deck
signal cards_ended


var card_list : Array[Card]
@onready var card_count := len(card_list)
var Owner : Character

func create_deck() -> void:
	for card in get_children():
		if card is Card:
			card_list.append(card)
	shuffle()
func _ready():
	create_deck()

func shuffle() -> void:
	randomize()
	card_list.shuffle()

func draw(number_of_cards := 1) -> void:
	for __ in range(number_of_cards):
		if card_count > 0:
			Owner.hand.append(card_list.pop_front())
			card_count -= 1
		else:
			cards_ended.emit()


func _on_child_entered_tree(node):
	create_deck()
