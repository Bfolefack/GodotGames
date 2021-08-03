extends Label


var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file
var save_data = {"highscore": 0} #variable to store data

# Called when the node enters the scene tree for the first time.
func _ready():
	if not savegame.file_exists(save_path):
		create_save()
	
func save(high_score):    
   save_data["highscore"] = high_score #data to save
   savegame.open(save_path, File.WRITE) #open file to write
   savegame.store_var(save_data) #store the data
   savegame.close() # close the file

func read_savegame():
   savegame.open(save_path, File.READ) #open the file
   save_data = savegame.get_var() #get the value
   savegame.close() #close the file
   return save_data["highscore"] #return the value

func create_save():
   savegame.open(save_path, File.WRITE)
   savegame.store_var(save_data)
   savegame.close()

func _process(delta: float) -> void:
	if get_tree().get_root().get_child(0).get_node("Game").get_node("Player").lives < 0:
		if get_tree().get_root().get_child(0).get_node("GUI").get_node("Score").score > read_savegame():
			save(get_tree().get_root().get_child(0).get_node("GUI").get_node("Score").score)
		text = String(read_savegame()) 
