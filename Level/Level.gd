extends Node

var player_score = 0
var enemy_score = 0

func _on_Left_body_entered(body):
	score_achieved("enemy_score")

func _on_Right_body_entered(body):
	score_achieved("player_score")

func _process(delta):
	$PlayerScore.text = str(player_score)
	$EnemyScore.text = str(enemy_score)
	$CountdownLabel.text = str(int($CountdownTimer.time_left+1))

func _on_CountdownTImer_timeout():
	get_tree().call_group("BallGroup", "restart_ball")
	$CountdownLabel.visible = false

func score_achieved(scorer):
	$Ball.position = Vector2(640, 360)
	if(scorer == "player_score"):
		player_score += 1
	if(scorer == "enemy_score"):
		enemy_score += 1
	get_tree().call_group("BallGroup", "stop_ball")
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$ScoreSound.play()
	$Player.position.x = 30
	$Enemy.position.x = 1280 - 30
