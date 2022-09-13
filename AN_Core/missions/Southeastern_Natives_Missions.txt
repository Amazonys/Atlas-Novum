southeast = {
	slot = 3
	generic = no
	ai = yes
	potential = {
		OR = {
			culture_group = muskogean
			primary_culture = caddo
			tag = CHE
			tag = TSC
		}
		capital_scope = {
			NOT = { continent = new_world }
		}
	}
	has_country_shield = yes
	
	se_birdmen = {
		icon = mission_se_birdmen
		position = 1
		required_missions = {	}
		provinces_to_highlight = {	}
		
		trigger = {
			is_subject = no
			all_neighbor_country = {
				NOT = { army_size = ROOT }
			}
			army_size_percentage = 1
			NOT = { num_of_mercenaries = 1 }
		}
		
		effect = {
			add_country_modifier = {
				name = se_birdmen_hunt
				duration = 7300
			}
		}
	}
	
	se_the_thunderers = {
		icon = mission_native_build_army_mission
		position = 2
		required_missions = { se_birdmen }
		provinces_to_highlight = {
			owner = {
				war_with = ROOT
			}
		}
		
		trigger = {
			any_country = {
				war_with = ROOT
				army_strength = {
					who = ROOT
					value = 1.5
				}
			}
		}
		
		effect = {
			add_mil_power = 75
			mississippi_area = { 
				limit = {
					NOT = { is_core = ROOT }
					NOT = { is_permanent_claim = ROOT }
				}
				add_permanent_claim = ROOT
			}
			west_florida_area = { 
				limit = {
					NOT = { is_core = ROOT }
					NOT = { is_permanent_claim = ROOT }
				}
				add_permanent_claim = ROOT
			}
			alabama_area = { 
				limit = {
					NOT = { is_core = ROOT }
					NOT = { is_permanent_claim = ROOT }
				}
				add_permanent_claim = ROOT
			}
			kentucky_area = { 
				limit = {
					NOT = { is_core = ROOT }
					NOT = { is_permanent_claim = ROOT }
				}
				add_permanent_claim = ROOT
			}
			upper_louisiana_area = { 
				limit = {
					NOT = { is_core = ROOT }
					NOT = { is_permanent_claim = ROOT }
				}
				add_permanent_claim = ROOT
			}
		}
	}
	
	se_along_the_river = {
		icon = mission_se_along_the_river
		position = 3
		required_missions = { se_the_thunderers }
		provinces_to_highlight = {
			OR = {
				area = mississippi_area
				area = west_florida_area
				area = alabama_area
				area = kentucky_area
				area = upper_louisiana_area
			}
			NOT = { owned_by = ROOT }
			NOT = { is_core = ROOT }
		}
		
		trigger = {
			num_of_owned_provinces_with = {
				value = 15
				OR = {
					area = mississippi_area
					area = west_florida_area
					area = alabama_area
					area = kentucky_area
					area = upper_louisiana_area
				}
			}
		}
		
		effect = {
			if = {
				limit = {
					OR = { 
						has_reform = native_martial_tradition_reform
						has_reform = native_war_band_reform
					}
				}
				add_country_modifier = {
					name = "se_our_river"
					duration = 9125
				}
			}
			else = {
				add_mil_power = 100
			}
		}
	}
	
	se_platform_mounds = {
		icon = mission_se_platform_mounds
		position = 4
		required_missions = {	}
		provinces_to_highlight = {
			owned_by = ROOT
		}
		
		trigger = {
			calc_true_if = {
				all_owned_province = {
					OR = {
						has_building = native_palisade
						has_building = native_fortified_house 
					}
				}
				amount = 2
			}
		}
		
		effect = {
			every_province = {
				limit = {
					owned_by = ROOT
					OR = {
						has_building = native_palisade
						has_building = native_fortified_house
					}
				}
				add_province_modifier = {
					name = "ne_palisaded_village" #same as NE
					duration = 7300
				}
			}
			custom_tooltip = platform_mounds_reward_tooltip
		}
	}
	
	se_medicine_wheel = {
		icon = mission_se_medicine_wheel
		position = 5
		required_missions = {	}
		provinces_to_highlight = {
			
		}
		
		trigger = {
			if = {
				limit = {
					religion = totemism
				}
				any_owned_province = {
					has_building = native_sweat_lodge
				}
				stability = 1
			}
			else = {
				calc_true_if = {
					all_owned_province = {
						OR = {
							has_building = temple
							has_building = cathedral
						}
					}
					amount = 3
				}
			}
		}
		
		effect = {
			add_country_modifier = {
				name = se_solar_blessing
				duration = 5475
			}
		}
	}

	se_agriculture = {
		icon = mission_ne_agriculture
		position = 6
		required_missions = {	}
		provinces_to_highlight = {
			owned_by = ROOT
		}
		
		trigger = {
			calc_true_if = {
				all_owned_province = {
					has_building = native_irrigation 
				}
				amount = 3
			}
			total_development = 50
		}
		
		effect = {
			add_years_of_income = 1
			add_country_modifier = {
				name = ne_agricultural_complex #same as NE
				duration = 7300
			}
		}
	}
}