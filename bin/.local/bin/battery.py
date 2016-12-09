#!/usr/bin/env python
base = "/sys/class/power_supply/BAT0/"
import colorsys

def pct():
    return int(open(base + "charge_now").read().strip()) / int(open(base + "charge_full").read().strip())

def charging():
    return "Dis" not in open(base + "status").read()

c = charging()
p = round(pct() * 100)
if p > 100:
    p = 100

dt = "+" if c else "-"
print("{}%{}".format(p, dt))
print(p)
r, g, b = colorsys.hsv_to_rgb((p * 1.2) / 360, 0.99, 0.99)
print("#%02x%02x%02x" % (int(r*256), int(g*256), int(b*256)))
