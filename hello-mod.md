## Hello mod

Create these two filees in a folder called `Library/Application Support/factorio/mods/my_first_mod_0.0.1` on Mac OS X. Factorio does indeed run on Windows and Linux as well though but M1 macs are snappy to run it.

```lua
-- data.lua
local new_item = {
    type = "item",
    name = "custom-item",
    icon = "__base__/graphics/icons/iron-plate.png",
    icon_size = 64,
    subgroup = "raw-material",
    order = "z[custom-item]",
    stack_size = 100
  }
  
  data:extend({new_item})
```

```
{
  "name": "my_first_mod",
  "version": "0.0.1",
  "title": "My First Mod",
  "author": "marksaroufim",
  "factorio_version": "2.0",
  "dependencies": ["base >= 2.0"],
  "description": "This is my first Factorio mod"
}
```

Launch Factorio, if there are any issues the game will let you know

Once you launch a new game enable cheats with `~`  and type in `/c game.player.insert("custom-item")` and you should see a new custom item in your inventory