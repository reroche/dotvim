#!/bin/bash

song=$(spotify-cli --status)
if [ "$song" != "spotify is off" ]
then
  echo "♫ $song"
else
  echo ""
fi
