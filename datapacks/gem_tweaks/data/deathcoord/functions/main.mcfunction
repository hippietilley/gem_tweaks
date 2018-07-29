

execute as @a[scores={death=1..}] run tellraw @s {"text":"your death coordinates:","color":"gold"}


execute as @a[scores={death=1..}] store result score @s deathX run data get entity @s Pos[0]
execute as @a[scores={death=1..}] run tellraw @s ["",{"text":"X: ","color":"dark_green"},{"score":{"name":"@s","objective":"deathX"},"color":"dark_green"}]
execute as @a[scores={death=1..}] store result score @s deathY run data get entity @s Pos[1]
execute as @a[scores={death=1..}] run tellraw @s ["",{"text":"Y: ","color":"dark_green"},{"score":{"name":"@s","objective":"deathY"},"color":"dark_green"}]
execute as @a[scores={death=1..}] store result score @s deathZ run data get entity @s Pos[2]
execute as @a[scores={death=1..}] run tellraw @s ["",{"text":"Z: ","color":"dark_green"},{"score":{"name":"@s","objective":"deathZ"},"color":"dark_green"}]


execute as @a[nbt={Dimension:0},scores={death=1..}] run tellraw @s {"text":"in: the overworld","color":"green"}
execute as @a[nbt={Dimension:1},scores={death=1..}] run tellraw @s {"text":"in: the end","color":"green"}
execute as @a[nbt={Dimension:-1},scores={death=1..}] run tellraw @s {"text":"in: the nether","color":"green"}


scoreboard players set @a[nbt={Dimension:0},scores={death=1..}] dimension 0
scoreboard players set @a[nbt={Dimension:1},scores={death=1..}] dimension 1
scoreboard players set @a[nbt={Dimension:-1},scores={death=1..}] dimension -1


scoreboard players enable @a deathTP
execute as @a[scores={death=1..}] run tellraw @a ["",{"text":"click here to teleport ","color":"dark_blue","clickEvent":{"action":"run_command","value":"/trigger deathTP set 1"}},{"text":"(work only in creative)","color":"dark_blue"}]


execute as @a[gamemode=creative,scores={deathTP=1..}] at @s run summon armor_stand ~ ~ ~ {CustomName:"{\"text\":\"deathTP\"}",NoGravity:1,Marker:1,Invisible:1}
execute as @a[gamemode=creative,scores={deathTP=1..}] at @s store result entity @e[type=armor_stand,limit=1,sort=nearest,name=deathTP] Pos[0] double 1 run scoreboard players get @s deathX
execute as @a[gamemode=creative,scores={deathTP=1..}] at @s store result entity @e[type=armor_stand,limit=1,sort=nearest,name=deathTP] Pos[1] double 1 run scoreboard players get @s deathY
execute as @a[gamemode=creative,scores={deathTP=1..}] at @s store result entity @e[type=armor_stand,limit=1,sort=nearest,name=deathTP] Pos[2] double 1 run scoreboard players get @s deathZ

execute as @a[gamemode=creative,scores={dimension=0,deathTP=1..}] run tp @s @e[type=armor_stand,limit=1,sort=nearest,name=deathTP]
execute as @a[gamemode=creative,scores={dimension=1,deathTP=1..}] in the_end run tp @s @e[type=armor_stand,limit=1,sort=nearest,name=deathTP]
execute as @a[gamemode=creative,scores={dimension=-1,deathTP=1..}] in the_nether run tp @s @e[type=armor_stand,limit=1,sort=nearest,name=deathTP]

execute as @a[gamemode=creative,scores={deathTP=1..}] at @s run tp @s ~0.5 ~ ~0.5
execute as @a[gamemode=creative,scores={deathTP=1..}] at @s run playsound minecraft:block.note.pling master @s



execute as @a[gamemode=!creative,scores={deathTP=1..}] run tellraw @s {"text":"you must be in creative to do that","color":"dark_red"}
execute as @a[gamemode=!creative,scores={deathTP=1..}] at @s run playsound minecraft:entity.villager.no master @s


kill @e[type=armor_stand,name=deathTP]
scoreboard players set @a death 0
scoreboard players set @a deathTP 0

