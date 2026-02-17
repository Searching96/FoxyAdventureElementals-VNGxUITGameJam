class_name ConsoleLogger
extends Logger

func log(message: String, level: Level = Level.INFO) -> void:
	if level < min_level: return
	match level:
		Level.DEBUG: print("[DEBUG] %s" % message)
		Level.INFO:  print("[INFO] %s" % message)
		Level.WARN:  push_warning("[WARN] %s" % message)
		Level.ERROR: push_error("[ERROR] %s" % message)
