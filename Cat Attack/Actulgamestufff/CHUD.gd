extends CanvasLayer

var coins = 0 

func _ready():
	$CoinCounter.text = String(coins)


func _on_coin_coin_collected():
	coins = coins + 1
	_ready()
