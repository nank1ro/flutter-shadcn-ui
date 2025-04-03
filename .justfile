d := "macos"

example: (_run "example")

playground: (_run "playground")

_run dir:
  cd {{dir}} && dashmon -d {{d}}

