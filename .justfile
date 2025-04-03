d := "macos"

[working-directory: 'example']
example:
  dashmon -d {{d}}


# The playground runs on web only
[working-directory: 'playground']
playground:
  dashmon -d chrome

