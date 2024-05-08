#Missions for Plains Americans

plains_natives_missions = {
	slot = 3
	generic = no
	ai = yes
	potential = {
		OR = {
			culture_group = caddoan
			culture_group = plains_algonquian
			culture_group = siouan
			primary_culture = chipewyan
			primary_culture = kiowa
			primary_culture = shoshone
		}
		NOT = {	
			primary_culture = caddo
			primary_culture = chiwere
			primary_culture = osage
		}
		capital_scope = {
			NOT = { continent = new_world }
		}
	}
	has_country_shield = yes
	
	bond_to_the_land = {
		icon = mission_native_dev_capital
		position = 1
		required_missions = { }
		
		trigger = {	
			capital_scope = {
				has_building = native_storehouse
			}
		}
		
		effect = {
			add_country_modifier = {
				name = great_hunters
				duration = 7300
			}
		}
	}
	
	why_cant_we_be_friends = {
		icon = native_royal_marriage
		position = 2
		required_missions = { bond_to_the_land }
		
		trigger = {	
			calc_true_if = {
				all_known_country = {
					has_opinion = {
						who = ROOT
						value = 100
					}
				}
				amount = 10
			}
		}
		
		effect = {
			add_country_modifier = {
				name = improved_dip_reputation
				duration = 7300
			}
		}
	}
	
	teach_plains_sign_language = {
		icon = mission_control_unrest
		position = 3
		required_missions = { why_cant_we_be_friends }
		provinces_to_highlight = {
			NOT = { has_building = native_longhouse }
			owned_by = ROOT
		}
		
		trigger = {	
			native_longhouse = 2
		}
		
		effect = {
			add_country_modifier = {
				name = boom_economy
				duration = 7300
			}
		}
	}
	
	plains_power = {
		icon = native_royal_marriage
		position = 4
		required_missions = { teach_plains_sign_language }
		
		trigger = {	
			grown_by_development = 20
		}
		
		effect = {
			add_prestige_or_monarch_power = {
				amount = 10
			}
		}
	}
	
	horse_culture = {
		icon = mission_non-western_cavalry_raid
		position = 5
		required_missions = { plains_power }
		
		trigger = {	
			mil_tech = 6
		}
		
		effect = {
			add_country_modifier = {
				name = horse_population_boom
				duration = -1
			}
		}
	}
}