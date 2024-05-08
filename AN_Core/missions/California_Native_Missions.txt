#Missions for California Americans

california_natives_missions = {
	slot = 3
	generic = no
	ai = yes
	potential = {
		government = native
		primary_culture = yokuts
	}
	has_country_shield = yes
	
	such_a_lovely_place = {
		icon = mission_ne_longhouses
		position = 1
		required_missions = { }
		
		trigger = {	
			capital_scope = {
				has_building = native_storehouse
			}
		}
		
		effect = {
			add_country_modifier = {
				name = lovely_place
				duration = 7300
			}
		}
	}
	
	in_harmony_with_nature = {
		icon = mission_ne_agriculture
		position = 2
		required_missions = { such_a_lovely_place }
		
		trigger = {	
			grown_by_development = 20
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
	
	basketweaving_trade = {
		icon = mission_native_dev_capital
		position = 3
		required_missions = { in_harmony_with_nature }
		
		trigger = {	
			calc_true_if = {
				all_known_country = {
					NOT = {
						production_efficiency = ROOT
					}
				}
				amount = 5
			}
		}
		
		effect = {
			add_country_modifier = {
				name = boom_economy
				duration = 7300
			}
		}
	}
	
	paint_the_land = {
		icon = mission_control_unrest
		position = 4
		required_missions = { basketweaving_trade }
		
		trigger = {	
			has_country_modifier = rock_art_dec
		}
		
		effect = {
			capital_scope = {
				add_base_tax = 1
				add_base_production = 1
				add_base_manpower = 1
			}
		}
	}
	
	settle_our_tribe = {
		icon = mission_native_dev_capital
		position = 4
		required_missions = { paint_the_land }
		
		trigger = {	
			num_of_cities = 2
		}
		
		effect = {
			add_stability = 3
			add_prestige_or_monarch_power = {
				amount = 20
			}
		}
	}
}