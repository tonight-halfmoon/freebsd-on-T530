#!/usr/bin/env bash
from datetime import datetime

def oiz_fun():
  with open("/tmp/oz.out", "a") as file:
    dt = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    file.write(dt)
    file.write("\n")

def oiz_start():
  oiz_fun()

if __name__ == "__main__":
  # execute only if run as a script
  oiz_start()
