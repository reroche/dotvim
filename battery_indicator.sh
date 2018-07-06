#!/bin/bash

charging=$(acpi | cut -c 12-19)
percentage=$(acpi| grep -oP "(\d+(\.\d+)?(?=%))")

if [ "$charging" == "Charging" ]
then
  echo "⚡$percentage%"
else
  echo "$percentage%"
fi
