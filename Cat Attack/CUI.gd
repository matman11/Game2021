extends CanvasLayer

var coins = 0 

func _ready():
	$CoinCounter.text = String(coins)
