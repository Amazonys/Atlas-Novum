# Scripts in ai_army can be used to influence how the army AI behaves when certain conditions (Defined in the "active" trigger) are met.
# It is intended not to control daily decision making of armies but to define a general attitude that will influence (or overwrite) hard-coded AI behaviour.
# The value is (re)calculated on the first AI daily tick (or console command "ai_army_tick") after any of the following happens:
#  * The list of countries the AI is at war with changes
#  * The country gains or loses a province
#  * It's a new year
#  * A new game starts, or save game is loaded
#
# Remember: AI will choose the province with the *lowest* value. Use console command "mapmode armyeval" (and select an army) to debug it. 
#
