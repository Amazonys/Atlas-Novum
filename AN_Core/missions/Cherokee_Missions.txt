cherokee_1 = {
	slot = 1
	generic = no
	ai = yes
	potential_on_load = {
		has_dlc = "Leviathan"
	}
	potential = {
		tag = CHE
		has_dlc = "Leviathan"
	}
	has_country_shield = yes
	
	che_principal_people = {
		icon = mission_che_principal_peole
		position = 1
		required_missions = {	}
		provinces_to_highlight = {	}
		
		trigger = {
			prestige = 30
			NOT = { corruption = 1 }
		}
		
		effect = {
			add_country_modifier = {
				name = che_the_seven_clans
				duration = 7300
			}
		}
	}
	
	che_the_council_house = {
		icon = mission_che_the_council_house
		position = 2
		required_missions = { che_principal_people }
		provinces_to_highlight = {
			owned_by = ROOT
			is_capital = yes
		}
		
		trigger = {
			num_of_allies = 2
			capital_scope = {
				OR = {
					has_building = native_longhouse
					fort_level = 3
				}
			}
		}
		
		effect = {
			every_country = {
				limit = {
					alliance_with = ROOT
					religion = totemism
				}
				add_opinion = {
					who = ROOT
					modifier = che_conciliatory_views
				}
			}
			custom_tooltip = che_conciliatory_views_tooltip
			add_dip_power = 50
		}
	}
	
	che_white_government = {
		icon = mission_iroquois_the_five_nations
		position = 3
		required_missions = { che_the_council_house }
		provinces_to_highlight = {	}
		
		trigger = {	
			stability = 1
			treasury = 200
			has_dip_advisor = yes
		}
		
		effect = {
			add_dip_power = 100
			define_advisor = {
				type = treasurer
				skill = 2
				religion = totemism
				culture = ROOT
				discount = yes
			}
		}
	}
	
	che_red_government = {
		icon = mission_che_red_government
		position = 4
		required_missions = { che_white_government }
		provinces_to_highlight = {	}
		
		trigger = {	
			num_of_generals = 1
			manpower_percentage = 0.6
			army_size_percentage = 1
		}
		
		effect = {
			add_mil_power = 100
			create_general = {
				tradition = 75
			}
		}
	}
}

cherokee_2 = {
	slot = 2
	generic = no
	ai = yes
	potential_on_load = {
		has_dlc = "Leviathan"
	}
	potential = {
		tag = CHE
		has_dlc = "Leviathan"
	}
	has_country_shield = yes
	
	che_botanical_exports = {
		icon = mission_che_botanical_exports
		position = 1
		required_missions = {  }
		provinces_to_highlight = {
			province_id = 1500
		}
		
		trigger = {
			1500 = { is_strongest_trade_power = ROOT }
		}
		
		effect = {
			add_country_modifier = {
				name = che_black_drink
				duration = 5475
			}
			add_ruler_modifier = {
				name = "che_effective_remedies"
				duration = -1
			}
		}
	}
	
	che_the_cave_country = {
		icon = mission_che_the_cave_country
		position = 2
		required_missions = {  }
		provinces_to_highlight = {
			owned_by = ROOT
			NOT = { has_building = native_great_trail }
			NOT = { has_building = workshop }
		}
		
		trigger = {
			if = {
				limit = {
					government = native
				}
				calc_true_if = {
					all_owned_province = {
						has_building = native_great_trail
					}
					amount = 2
				}
			}
			else_if = {
				limit = {
					NOT = { government = native }
				}
				calc_true_if = {
					all_owned_province = {
						OR = {
							has_building = workshop
							has_building = counting_house
						}
					}
					amount = 2
				}
			}
		}
		
		effect = {
			add_country_modifier = {
				name = che_tunnels
				duration = 5475
			}
		}
	}
	
	che_the_beloved_woman = {
		icon = mission_che_the_beloved_woman
		position = 3
		required_missions = {  }
		provinces_to_highlight = {	}
		
		trigger = {
			OR = {
				employed_advisor = {
					is_female = yes
				}
				is_female = yes
				has_female_heir = yes
			}
		}
		
		effect = {
			add_country_modifier = {
				name = che_mother_clan
				duration = -1
			}
		}
	}
	
	che_thunder_and_lightning = {
		icon = mission_ne_agriculture
		position = 5
		required_missions = { che_red_government }
		provinces_to_highlight = {	}
		
		trigger = {
			prestige = 75
			num_of_allies = 4
			stability = 2
		}
		
		effect = {
			if = {
				limit = {
					NOT = { stability = 3 }
				}
				add_stability = 1
				add_adm_power = 50
			}
			else = {
				add_adm_power = 100
			}
			add_country_modifier = {
				name = che_perfect_stability
				duration = 5475
			}
		}
	}
}