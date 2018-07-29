scoreboard objectives add death minecraft.custom:minecraft.deaths
scoreboard objectives add deathX dummy
scoreboard objectives add deathY dummy
scoreboard objectives add deathZ dummy
scoreboard objectives add dimension dummy
scoreboard objectives add deathTP trigger

tellraw @a ["",{"text":"====================================================","color":"gold"},{"text":"\n"},{"text":"death utilities command by Hubiug is enabled on this world\n","color":"dark_aqua"},{"text":"for more creation, check my planetminecraft:","color":"dark_aqua"},{"text":"http://www.planetminecraft.com/member/hubiug","color":"dark_red","clickEvent":{"action":"open_url","value":"http://www.planetminecraft.com/member/hubiug"}},{"text":"\n"},{"text":"====================================================","color":"gold"}]
playsound block.note.pling master @a ~ ~ ~ 1 1 1