class_name Logger
extends RefCounted

enum Level { DEBUG, INFO, WARN, ERROR }

var min_level: Level = Level.DEBUG

func log(message: String, level: Level = Level.INFO) -> void:
	push_error("Logger.log() is abstract. Implement in subclass.")

func debug(message: String) -> void: log(message, Level.DEBUG)
func info(message: String) -> void: log(message, Level.INFO)
func warn(message: String) -> void: log(message, Level.WARN)
func error(message: String) -> void: log(message, Level.ERROR)
