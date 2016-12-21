from logging import getLogger, StreamHandler, DEBUG, INFO

log = getLogger(__name__)
log.setLevel(INFO)
handler = StreamHandler()
handler.setLevel(INFO)
log.addHandler(handler)

