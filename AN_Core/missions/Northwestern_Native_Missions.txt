#Missions for Northwestern Americans

north_western_natives_missions = {
	slot = 3
	generic = no
	ai = yes
	potential = {
		government = native
		OR = {
			primary_culture = athabascan
			primary_culture = chinook
			primary_culture = haida
			primary_culture = salish
		}
	}
	has_country_shield = yes
	
	be_the_leader = {
		icon = mission_ne_longhouses
		position = 1
		required_missions = { }
		
		trigger = {	
			capital_scope = {
				has_building = native_longhouse
			}
		}
		
		effect = {
			capital_scope = {
				add_base_tax = 1
				add_base_production = 1
				add_base_manpower = 1
			}
		}
	}
	
	honour_the_ancestors = {
		icon = mission_control_unrest
		position = 2
		required_missions = { be_the_leader }
		
		trigger = {	
			if = {
				limit = {
					government = native 
				}
				capital_scope = {
					has_building = native_ceremonial_fire_pit
				}
			}
			else = {
				capital_scope = {
					has_building = temple
				}
			}
		}
		
		effect = {
			if = {
				limit = {
					NOT = { stability = 3 }
				}
				add_stability = 1
				add_adm_power = 50
				add_dip_power = 50
				add_mil_power = 50
			}
			else = {
				add_adm_power = 100
				add_dip_power = 100
				add_mil_power = 100
			}
		}
	}
	
	smells_like_teen_spirit = {
		icon = mission_war_chest
		position = 3
		required_missions = { honour_the_ancestors }
		
		trigger = {	
			grown_by_development = 10
			treasury = 200
		}
		
		effect = {
			add_prestige = 20
			add_country_modifier = {
				name = benign_ruler
				duration = 7300
			}
		}
	}
	
	celebrate_a_potlatch = {
		icon = native_royal_marriage
		position = 4
		required_missions = { smells_like_teen_spirit }
		
		trigger = {	
			num_of_allies = 2
			num_of_trusted_allies = 2
		}
		
		effect = {
			add_country_modifier = {
				name = potlatch_held
				duration = 7300
			}
		}
	}
		
	show_military_strength = {
		icon = mission_native_build_army_mission
		position = 5
		required_missions = { celebrate_a_potlatch }
		
		trigger = {	
			num_of_allies = 2
			calc_true_if = {
				all_ally = {
					military_strength = {
						who = FROM
						value = 2.0
					}
				}
				amount = 2
			}
		}
		
		effect = {
			add_country_modifier = {
				name = morale_boost
				duration = 7300
			}
		}
	}
}