#!/bin/sh

convert -colorspace Gray -density 300 img/out.ps -background white -flatten -units pixelsperinch img/out.png