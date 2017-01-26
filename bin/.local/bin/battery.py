#!/usr/bin/env python
prefix = "/sys/class/power_supply/BAT0"

import colorsys
import sys

def int_from_file(name):
    with open("{}/{}".format(prefix, name)) as f:
        return int(f.read().strip())

def in_file(name, test):
    with open("{}/{}".format(prefix, name)) as f:
        return test in f.read()

def hours_to_h2m(hours):
    h = int(hours)
    m = int((hours - h) * 60)
    return "{}h{}m".format(h, str(m).zfill(2))

def pct():
    return int_from_file("charge_now") / int_from_file("charge_full")

def charging():
    return not in_file("status", "Dis")

is_prompt = (len(sys.argv) > 1 and sys.argv[1] == "prompt")

c = charging()
p = round(pct() * 100)
if p > 100:
    p = 100

dt = ("+" if c else "-") if p < 100 else ""
try:
    rs = hours_to_h2m(int_from_file("charge_now") / int_from_file("current_now"))
except:
    rs = ""

if is_prompt:
    color = "232"
    print("%F{{{}}}{}%%{}%f".format(color, p, dt))
else:
    print("{}%{}{}{}".format(p, dt, " " if rs else "", rs))
    print(p)
    r, g, b = colorsys.hsv_to_rgb((p * 1.2) / 360, 0.99, 0.99)
    print("#%02x%02x%02x" % (int(r*256), int(g*256), int(b*256)))
