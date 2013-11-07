Objective
=========

Temporarily (with configurable timeout) switch from a default handler for the laptop lid-clonsing event to a special one. In this case switching from suspend as the 
default to just turn off the screen on the next lid-closing event.


Use Case
========

I, for myself, like to simply close the lid to put my thinkpad into suspend so I can just take it with me or put it away. But sometimes I only want to close the lid 
without suspending the laptop (eg while using the TP as a tablet to carry a lot of things with me :P). In these situations require an easy to use method to switch the 
behaviour. This means for me, no comand lines, some graphical UI elements to click or multi-button "short"cuts to press - I want my laptop to read my mind, and thus this 
is not possible (nor desirable), I chose a one button solution: the Think™Vantage™ Button™ (only on genuine™ Think™Pads™ by Lenovo™)


Explanation
===========

Prerequisites
-------------

I run my TP with arch linux - yea, this means systemd!! POETTERIIING!!!1elf - and I have acpid installed and bootet at runtime.


ThinkVantage Button
-------------------

I have some modules for thinkpad foo installed (unfortunately I forgot which). I use acpid to handle the ThinkVantage button press.

/sys/devices/platform/thinkpad_acpi/hotkey_mask contains the mask for the thinkpad keys. The following bit has to be set to enable ThinkVantage button press: 0x00800000 (do something like this: $oldval & 0x00800000 > $devfile)
Here is a perl script to set this value:
perl -e 'printf "%#x", '$(< hotkey_mask)' | 0x00800000,'> hotkey_mask

Important: It seems this has to be set not only on each boot but even on each resume of a suspend!

Note: Maybe the correct mask varies on different thinkpad models. One easy way to find out is watching acpi_listen and pressing the desired button while playing with the 
bitmask in hotkey_mask


Lid-closing event
-----------------

Again I use acpid to trigger the action for the lid-closing event.

In the file /etc/acpi/events/lidclose acpid is told wich action to execute on lid closing; in /etc/acpi/lidclose.sh this is event is handled and it is evaluated it the button was pressed.


Greetings
=========

Thanks to strohi for the idea for this ;-)
