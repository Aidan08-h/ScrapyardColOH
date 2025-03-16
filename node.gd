extends Node

const PLAYER = preload("res://Scenes/player.tscn")

var peer=ENetMultiplayerPeer.new()

func on_host_pressed():
	peer.create_server(25565)
	multiplayer.multiplayer_peer=peer
	
	multiplayer.peer_connected.connect(
		func(pid):
			print("Peer" + str(pid) + "Has Joined The Game!")
			add_player()
	)
	
	add_player()

func on_join_pressed():
	peer.create_client("localhost",25565)
	multiplayer.multiplayer_peer=peer

func add_player():
	var player = PLAYER.instantiate()
	add_child(player)
