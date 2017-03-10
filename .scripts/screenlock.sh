ICON=$HOME/.local/share/screenlock.png
TMPBG=/tmp/screen.png
scrot /tmp/screen.png

# Blur high to low
BLURTYPE="0x5"
#BLURTYPE="0x2"
#BLURTYPE="5x2"
#BLURTYPE="2x8"
#BLURTYPE="2x3"

convert $TMPBG -blur $BLURTYPE $TMPBG
convert $TMPBG $ICON -gravity center -composite -matte $TMPBG
i3lock -u -f -i $TMPBG
