# Fuel <item> <count>

# Item (switch): any coal charcoal coal_block blaze_rod
execute if score $argument tc.tmp matches 1 if data storage tc:tmp {edit_arg:{item:"any"}} run data modify storage tc:tmp list_start[-1].A.item set value "coal"
execute if score $argument tc.tmp matches 1 if data storage tc:tmp {edit_arg:{item:"coal"}} run data modify storage tc:tmp list_start[-1].A.item set value "charcoal"
execute if score $argument tc.tmp matches 1 if data storage tc:tmp {edit_arg:{item:"charcoal"}} run data modify storage tc:tmp list_start[-1].A.item set value "coal_block"
execute if score $argument tc.tmp matches 1 if data storage tc:tmp {edit_arg:{item:"coal_block"}} run data modify storage tc:tmp list_start[-1].A.item set value "blaze_rod"
execute if score $argument tc.tmp matches 1 if data storage tc:tmp {edit_arg:{item:"blaze_rod"}} run data modify storage tc:tmp list_start[-1].A.item set value "any"


# Count (int): -10 -1 +1 +10
execute if score $argument tc.tmp matches 2..5 store result score $fuel_count tc.tmp run data get storage tc:tmp edit_arg.count
execute if score $argument tc.tmp matches 2 run scoreboard players remove $fuel_count tc.tmp 10
execute if score $argument tc.tmp matches 3 run scoreboard players remove $fuel_count tc.tmp 1
execute if score $argument tc.tmp matches 4 run scoreboard players add $fuel_count tc.tmp 1
execute if score $argument tc.tmp matches 5 run scoreboard players add $fuel_count tc.tmp 10
execute if score $argument tc.tmp matches 2..5 unless score $fuel_count tc.tmp matches 1.. run scoreboard players set $fuel_count tc.tmp 1
execute if score $argument tc.tmp matches 2..5 store result storage tc:tmp list_start[-1].A.count int 1 run scoreboard players get $fuel_count tc.tmp


# Clear tmp
scoreboard players reset $fuel_count tc.tmp
