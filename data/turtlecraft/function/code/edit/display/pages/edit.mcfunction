# Executed by the player. All turtle components have tag "turtlecraft.tmp"
scoreboard players set @s turtlecraft.page 2


# Clear top
tellraw @s [{"text":"\nYou should not click on any text above this!\n\n","color":"red"},{"text":"                                               ","color":"dark_gray","strikethrough":true}]


# Header
tellraw @s {"text":"\n Edit Instructions ","color":"dark_aqua"}


# Instruction page selection
scoreboard players operation $current_page turtlecraft.tmp = @s turtlecraft.line
scoreboard players operation $current_page turtlecraft.tmp /= #10 turtlecraft.math
scoreboard players add $current_page turtlecraft.tmp 1

scoreboard players operation $last_page turtlecraft.tmp = $line_count turtlecraft.tmp
scoreboard players operation $last_page turtlecraft.tmp /= #10 turtlecraft.math
scoreboard players add $last_page turtlecraft.tmp 1

tellraw @s ["",{"text":"      "},{"text":"1","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -310"},"hoverEvent":{"action":"show_text","contents":[{"text":"First page","color":"gray"}]}},{"text":" < ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -311"},"hoverEvent":{"action":"show_text","contents":[{"text":"Previous page","color":"gray"}]}},{"score":{"name":"$current_page","objective":"turtlecraft.tmp"},"color":"gray"},{"text":" > ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -312"},"hoverEvent":{"action":"show_text","contents":[{"text":"Next page","color":"gray"}]}},{"score":{"name":"$last_page","objective":"turtlecraft.tmp"},"color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -313"},"hoverEvent":{"action":"show_text","contents":[{"text":"Last page","color":"gray"}]}},"      ",{"text":" ✕ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -314"},"hoverEvent":{"action":"show_text","contents":[{"text":"Remove line","color":"red"}]}},{"text":" ✂ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -315"},"hoverEvent":{"action":"show_text","contents":[{"text":"Cut","color":"gray"}]}},{"text":" 🗍 ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -316"},"hoverEvent":{"action":"show_text","contents":[{"text":"Copy","color":"gray"}]}},{"text":" 🗐 ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -317"},"hoverEvent":{"action":"show_text","contents":[{"text":"Paste","color":"gray"}]}},{"text":" ↑ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -318"},"hoverEvent":{"action":"show_text","contents":[{"text":"Switch up","color":"gray"}]}},{"text":" ↓ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -319"},"hoverEvent":{"action":"show_text","contents":[{"text":"Switch down","color":"gray"}]}},{"text":" ❏ ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -320"},"hoverEvent":{"action":"show_text","contents":[{"text":"Toggle Numpad","color":"gray"}]}}]

scoreboard players reset $current_page turtlecraft.tmp
scoreboard players reset $last_page turtlecraft.tmp


# Display instructions
function turtlecraft:code/edit/display/print_lines


# Buttons
execute if score $display_page turtlecraft.tmp matches 2 run function turtlecraft:code/edit/display/pages/edit_buttons


# Tabs
tellraw @s ["\n",{"translate":"turtlecraft.tab.home","fallback":"HOME","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -100"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.home.description","fallback":"Home Page","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.edit","fallback":"EDIT","color":"dark_aqua"},"  ",{"translate":"turtlecraft.tab.counters","fallback":"COUNTERS","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -206"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.counters.description","fallback":"Show List of Counters","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.options","fallback":"OPTIONS","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -207"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.options.description","fallback":"Other Options","color":"gray"}]}},"  ",{"translate":"turtlecraft.tab.more","fallback":"MORE","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger TurtleCraft set -208"},"hoverEvent":{"action":"show_text","contents":[{"translate":"turtlecraft.tab.more.description","fallback":"Credits and Tutorials","color":"gray"}]}}]
