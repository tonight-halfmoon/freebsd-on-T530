#!/usr/bin/env python
from datetime import datetime
import time
sleep_time=2

def poiz_fun():
                                with open("/tmp/oz.out", "a") as file:
                                                                dt= datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                                                                file.write(dt)
                                                                file.write("\n")
def py_start():
	poiz_fun()


if __name__ == "__main__":
    # execute only if run as a script
    py_start()

