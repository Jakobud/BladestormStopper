# BladestormStopper

A World of Warcraft Addon that will automatically (or manually) remove the Ravager's Bladestorm buff when you gain it.

### Why?

In the Scarlet Monestary Armory, Herod drops his weapon, the Ravager 2-handed axe. It has a chance-on-hit proc called **Bladestorm** that makes your character spin in circles for several seconds, hitting all nearby enemies in 360&deg;. While this does good damage when multiple enemies are nearby, sometimes it's better to not have this buff:

* Bladestorm will break all nearby CC'ed enemies (sheep, seduction, freezing trap, etc)
* The buff roots you in place until the channeled spell is complete. You cannot move toward other enemies, LOS enemies or "run out of fire".
* If you are fighting only a single enemy, the dps from Bladestorm is most likely too low, especially since spells like Windfury will not proc.

### Installation

Install in your `World of Warcraft/Interface/Addons` directory. The directory structure should look like this:

    Interface
      Addons
        BladestormStopper
          BladestormStopper.toc
          Core.lua
          Locale-enUS.lua
          Libs
          README.md
          icon.tga

When you download this code from GitHub as a zip file, the zipped directory will be called `BladestormStopper-master`. Simply remove `-master` from the directory name.

### Commands

    /bladestormstopper
    /bss

### Options

`/bladestormstopper auto` - Toggles whether or not the addon will automatically remove the Bladestorm buff when you gain it.

`/bladestormstopper stop` - Manually remove the Bladestorm buff. If `auto` is disabled, you may want to be able to manually remove the buff using a macro or some other means. Easier and faster than manually trying to find and click the buff icon to remove it.

`/bladestormstopper showAlert` - Toggles whether or not to show a simple alert in the chat window that notifies you when the addon has removed a Bladestorm buff.

---

### Fubar support

The addon is fully supported by Fubar. You can run all commands through the Fubar tooltip. You can also click the icon/name on the Fubar panel to manually remove the Bladestorm buff.

### Lag disclaimer

Depending on server lag, you may or may not see your character begin to spin when the Bladestorm buff is gained. Even though you may see your character temporarily spin, the addon will properly remove the buff as designed.
