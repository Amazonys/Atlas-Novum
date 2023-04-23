#<government_mechanic_id> = { #The ID of the government mechanic which is used by the government_abilities in the gov reform files
# alert_icon_gfx = <icon> #defines which GFX icon strip the alert icon to use for this mechanic is in
# alert_icon_index = <int> #the index of the icon for this mechanic in the above strip
# available = <trigger> #criteria for the mechanic to be available
#
# powers = {} #1..n of
#  <government_power_type_id> = {
#   gui = <string> #link to the gui that will be used to display this power. By default, it will be government_shared_power if it's not a power only associated with one action, or if it is a unique power for one interaction, this will be ignored and the bar from the interaction's gui will be used. New versions of this will need to contain the same elements so they can be filled in.
#   min = <int> #min power value - usually just leave this at 0.
#   max = <int> #Defines how much progress you can save up for the progress bar.
#   default = <int> #default power when resetting, usually leave as 0
#   reset_on_new_ruler = yes/no #Defines if a new ruler resets the progress bar. It does so if set to yes, otherwise the progress remains saved even if you get a new ruler.
#   base_monthly_growth = <float> #Defines the base amount of progress growing. At default, it is 0.
#   development_scaled_monthly_growth = <float> #defines the amount of monthly growth you get from development scaled by Development/COUNTRY_DEVELOPMENT_SCALE (i.e. was in country_development)
#   monarch_power = <adm/mil/dip> #specify if the power also gains from the ruler's skill value. Don't specify if you don't want this feature
#   scaled_modifier = <conditional modifier> #optional country modifier that scales with the percentage of power. You can have n of them in the power.
#   reverse_scaled_modifier = <conditional modifier> #optional country modifier that scales with ( 1 - percentage of power ). You can have n of them in the power.
#   on_max_reached = <effect> #effect when you get to full power
#   on_min_reached = <effect> #effect when you get to the least available power
#   is_good = <yes/no> #is this power....desirable?
#  }
#
# Modifiers will be generated for the power types like this:
#  monthly_<government_power_type_id> = <float> #a monthly amount of this power given to the country
#  <government_power_type_id>_gain_modifier = <float> #Modifies the gain from the add_government_power effect
# for each of these, you'll need to add a string for the generated modifier id and an icon.
#
# There are effects for all government powers:
#  add_government_power = { mechanic_type = <government_mechanic_id> power_type = <government_power_type_id> value = <float> } #adds government power
#  add_government_power_scaled_to_seats = { mechanic_type = <government_mechanic_id> power_type = <government_power_type_id> value = <float> } #adds government power, scaled to the number of seats in parliament
#  set_government_power = { mechanic_type = <government_mechanic_id> power_type = <government_power_type_id> value = <float> } #sets government power
#  freeze_government_power = { mechanic_type = <government_mechanic_id> power_type = <government_power_type_id> } #government power no longer changes
#  unfreeze_government_power = { mechanic_type = <government_mechanic_id> power_type = <government_power_type_id> } #government power can change again
#
# ...and triggers:
#  has_government_power = { mechanic_type = <government_mechanic_id> power_type = <government_power_type_id> value = <float> } #tests if government power is at least value
#  government_power_frozen = { mechanic_type = <government_mechanic_id> power_type = <government_power_type_id> } #tests if government power is frozen
#
# interactions = {} #1..n of
#  <government_power_interaction_id> = {
#   gui = <string> #link to the gui that will be used to display this power. By default, it will be government_interaction_type if not specified. New versions of this will need to contain the same elements so they can be filled in.
#   icon = <gfx icon name> #Defines how the icon of the button should look like.
#   cost_type = <progress_type_id> # which progress type we're spending (if any)
#   cost = <int> #Defines how much progress you need to press the button. If pressed, it drains <int> amount of progress from the progress bar.
#   trigger = { <country triggers> } #Defines the triggers needed for the button to be used. At default, it is empty which means there are no triggers greying the button out
#   effect = { <country effects> } #Defines the effects happening when you press the button
#   cooldown_years = <int> #Defines the cooldown years for this one button.
#   cooldown_token = <any token> #defines the cooldown to use. If not specified, it will use the id of the action, so the cooldown will be unique to the action. This is useful if actions are to be mutually exclusive
#   cooldown_desc = <string key> #defines the string to use for the name of the cooldown. If not specified, it will use the name of the interaction.
#   ai_chance = <mtth> #mean time to happen, used to test to see how interested the AI is in doing this interaction
#  }
# }
# in theory, you can have as many interactions and powers as you like, but you'll need to make sure the UI script can handle them.