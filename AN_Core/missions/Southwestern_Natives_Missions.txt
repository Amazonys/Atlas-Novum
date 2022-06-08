southwest = {
	slot = 3
	generic = no
	ai = yes
	potential = {
		OR = {
			culture_group = apachean
			culture_group = sonoran
		}
		NOT = {
			OR = {
				primary_culture = kiowa
				primary_culture = shoshone
			}
		}
	}
	has_country_shield = yes
	
	sw_against_the_desert = {
		icon = mission_sw_against_the_desert
		position = 1
		required_missions = {	}
		provinces_to_highlight = {
			area_for_scope_province = {
				is_capital_of = ROOT
			}
			NOT = { owned_by = ROOT }
		}
		
		trigger = {
			capital_scope = {
				NOT = { devastation = 1 }
			}
			capital_scope = {
				area_for_scope_province = {
					type = all
					owned_by = ROOT
				}
			}
		}
		
		effect = {
			california_region = {
				limit = {
					NOT = { is_permanent_claim = ROOT }
					NOT = { is_core = ROOT }
				}
				add_permanent_claim = ROOT
			}
			rio_grande_region = {
				limit = {
					NOT = { is_permanent_claim = ROOT }
					NOT = { is_core = ROOT }
				}
				add_permanent_claim = ROOT
			}
		}
	}
	
	sw_the_taming_of_the_sands = {
		icon = mission_native_build_army_mission
		position = 2
		required_missions = { sw_against_the_desert }
		provinces_to_highlight = {
			region_for_scope_province = {
				is_capital_of = ROOT
			}
			NOT = { owned_by = ROOT }
			owner = {
				NOT = { tag = HNI }
			}
		}
		
		trigger = {
			calc_true_if = {
				amount = 15
				all_province = {
					OR = {
						region = california_region
						region = rio_grande_region
					}
					owned_by = ROOT
				}
			}
		}
		
		effect = {
			add_country_modifier = {
				name = "sw_conquered_southwest"
				duration = 7300
			}
		}
	}
	
	sw_turquoise_mines = {
		icon = mission_sw_torquoise_mining
		position = 3
		required_missions = {  }
		provinces_to_highlight = {
			area = arizona_area
			area = new_mexico_area
		}
		
		trigger = {
			calc_true_if = {
				amount = 3
				all_province = {
					OR = {
						trade_goods = gems
						trade_goods = salt
						trade_goods = gold
					}
					owned_by = ROOT
				}
			}
		}
		
		effect = {
			every_owned_province = {
				limit = {
					OR = {
						trade_goods = gems
						trade_goods = salt
						trade_goods = gold
					}
					owned_by = ROOT
				}
				add_province_modifier = {
					name = sw_turquoise
					duration = 5475
				}
			}
		}
	}
	
	sw_yucca_palms = {
		icon = mission_sw_yucca_plants
		required_missions = { }
		position = 4
		provinces_to_highlight = {
			province_id = 2492
		}
		trigger = {
			2492 = {
				owned_by = ROOT
				has_building = native_storehouse				
			}
		}
		effect = {
			2492 = {
				add_permanent_province_modifier = {
					name = sw_joshua_trees
					duration = -1
				}
			}
		}
	}
	
	sw_paquime = {
		icon = mission_sw_paquime
		required_missions = { }
		position = 5
		provinces_to_highlight = {
			province_id = 4644
		}
		trigger = {
			4644 = {
				owned_by = ROOT
				has_building = native_longhouse
				has_building = native_ceremonial_fire_pit
			}
		}
		effect = {
			4644 = {
				add_province_modifier = {
					name = sw_casas_grandes
					duration = 7300
				}
			}
		}
	}
	sw_medicine_wheel = { 
		icon = mission_se_medicine_wheel
		position = 6
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
}