#These are Generic missions, available to all tags that don't have an override.

#Below are mission series, within them are the actual missions.

military_missions = { #Series name is displayed over the slot?
	slot = 2 #ie, second upper left column
	generic = yes #if a mission without generic = yes wants this slot then it overrides this.
	ai = no #Can exist under the series itself or within individual missions.
	potential = {
		always = yes
	} #These are triggers for the entire series
	
	#missions
	#1st tier: (they appear in the order scripted here in the interface, all missions within one "series" has an arrow going down to the next one scripted)
	build_army_mission = { #Localized as reclaim_maine_title and reclaim_maine_desc
		icon = mission_build_up_to_force_limit
		required_missions = {  } #None
		trigger = {
			army_size_percentage = 1 #What you need to complete the mission, displayed for mission tooltip
		}
		effect = { #This is what you get after you finished your mission.
			add_country_modifier = {
				name = "thriving_arms_industry"
				duration = 9125 #25 years
			}
			custom_tooltip = claim_neighbor_province
			hidden_effect = {
				every_owned_province = {
					every_neighbor_province = {
						limit = {
							NOT = { owned_by = ROOT }
							NOT = { is_permanent_claim = ROOT	}
							NOT = { is_core = ROOT	}
						}
						add_claim = ROOT
					}
				}
			}
		}
		ai_weight = {
			factor = 10 # AI will go (up to) this many percent above army budget in order to reach the army size needed
		}
	}
	#2nd tier: (second because it is the second mission to be listed)
	expand_country_mission = {
		icon = mission_conquer_50_development
		required_missions = { build_army_mission }
		trigger = { grown_by_development = 50 }
		effect = {
			capital_scope = {
				add_base_tax = 1
				add_base_production = 1
				add_base_manpower = 1
				area = {
					limit = { owned_by = ROOT }
					add_province_modifier = {
						name = "growth_of_capital"
						duration = 9125 #25 years
					}
				}
			}
			custom_tooltip = claim_neighbor_province
			hidden_effect = {
				every_owned_province = {
					every_neighbor_province = {
						limit = {
							NOT = { owned_by = ROOT }
							NOT = { is_permanent_claim = ROOT	}
							NOT = { is_core = ROOT	}
						}
						add_claim = ROOT
					}
				}
			}
		}
	}
	#3d Tier: (not actually scripted as third, it's third as it is the 3rd one in this mission series)
	conquer_states = {
		icon = mission_cannons_firing
		required_missions = { expand_country_mission }
		trigger = { grown_by_states = 5 }
		effect = {
			add_mil_power = 100
			add_country_modifier = {
				name = "expansionist_country"
				duration = 9125 #25 years
			}
			custom_tooltip = perma_claim_neighbor_area
			hidden_effect = {
				every_owned_province = {
					every_neighbor_province = {
						area = {
							limit = {
								NOT = { owned_by = ROOT }
								NOT = { is_permanent_claim = ROOT    }
								NOT = { is_core = ROOT    }
							}
							add_permanent_claim = ROOT
						}
					}
				}
			}
		}
	}
	#4th
	assemble_an_army = {
		icon = mission_assemble_an_army
		required_missions = { conquer_states }
		trigger = { army_size = 80 }
		effect = {
			add_army_tradition_or_mil_power = { amount = 20 }
			add_country_modifier = {
				name = "army_enthusiasm"
				duration = 9125 #25 years
			}
			custom_tooltip = perma_claim_home_region
			hidden_effect = {
				capital_scope = {
					every_province = {
						limit = {
							region = PREV
							NOT = { owned_by = ROOT }
							NOT = { is_core = ROOT }
						}
						add_permanent_claim = ROOT
					}
				}
			}
		}
	}
	#5th
	unite_home_region = {
		icon = mission_unite_home_region
		required_missions = { assemble_an_army }
		provinces_to_highlight = {
			region_for_scope_province = {
				is_capital_of = ROOT
			}
			NOT = { owned_by = ROOT }
		}
		trigger = {
			custom_trigger_tooltip = {
				tooltip = unite_home_region_ct
				capital_scope = {
					region_for_scope_province = {
						type = all
						owned_by = ROOT #Subjects won't count, empty provinces will need to be colonized.
					}
				}
			}
		}
		effect = {
			add_power_projection = {
				type = mission_rewards_power_projection
				amount = 25
			}
			add_country_modifier = {
				name = "hegemonic_ambition"
				duration = 9125 #25 years
			}
			custom_tooltip = home_region_generic_reward
			tooltip = {
				add_nationalism = -10
			}
			custom_tooltip = " "
			custom_tooltip = perma_claim_neighbor_area
			hidden_effect = {
				every_owned_province = {
					every_neighbor_province = {
						area = {
							limit = {
								NOT = { owned_by = ROOT }
								NOT = { is_permanent_claim = ROOT    }
								NOT = { is_core = ROOT    }
							}
							add_permanent_claim = ROOT
						}
					}
				}
				every_owned_province = {
					limit = {
						region = capital
					}
					add_nationalism = -10
				}
			}
		}
	}
}


#2nd mission series:
diplomatic_missions = {
	slot = 3
	
	generic = yes
	
	potential = {
	   always = yes
	}
	
	building_alliances = {
		icon = mission_alliances
		required_missions = {  } #none
		trigger = {
			custom_trigger_tooltip = {
				tooltip = building_alliances.tooltip
				num_of_allies = 2
				calc_true_if = {
					all_ally = {
						has_opinion = {
							who = ROOT
							value = 150
						}
					}
					amount = 2
				}
			}
		}
		effect = {
			add_country_modifier = {
				name = "influential_diplomacy"
				duration = 9125 #25 years
			}
			define_advisor = {
				type = diplomat
				skill = 1
				culture = ROOT
				religion = ROOT
				cost_multiplier = 0.5
			}
		}
	}
	have_two_subjects = {
		icon = mission_have_two_subjects
		required_missions = { building_alliances }
		trigger = { num_of_non_tributary_subjects = 2 }
		effect = {
			add_dip_power = 100
			add_country_modifier = {
				name = "obedient_subjects"
				duration = 9125 #25 years
			}
			every_subject_country = {
				add_liberty_desire = -10
			}
		}
	}
	establish_high_seas_navy = {
		icon = mission_establish_high_seas_navy
		required_missions = { have_two_subjects }
		trigger = { 
			OR = {
				num_of_heavy_ship = 10 
				num_of_galley = 30
			}
		}
		effect = {
			add_country_modifier = {
				name = "naval_enthusiasm_mission"
				duration = 9125 #25 years
			}
			if = {
				limit = {
					NOT = {
						navy_tradition = 40
					}
				}
				create_admiral = { tradition = 40 }
			}
			else_if = {
				limit = {
					NOT = {
						navy_tradition = 60
					}
				}
				create_admiral = { tradition = 60 }
			}
			else_if = {
				limit = {
					NOT = {
						navy_tradition = 80
					}
				}
				create_admiral = { tradition = 80 }
			}
			else = {
				create_admiral = { tradition = 100 }
			}
		}
	}
	dominate_home_trade_node = {
		icon = mission_dominate_home_trade_node
		required_missions = { establish_high_seas_navy }
		trigger = {
			home_trade_node = {
				trade_share = {
					country = ROOT
					share = 75
				}
			}
		}
		effect = {
			hidden_effect = {
				home_trade_node_effect_scope = {
					random_trade_node_member_province = {
						limit = {
							owned_by = ROOT
						}
						save_event_target_as = reward_province
					}
					random_trade_node_member_province = {
						limit = {
							owned_by = ROOT
							is_capital = yes
						}
						save_event_target_as = reward_province
					}
					random_trade_node_member_province = {
						limit = {
							owned_by = ROOT
							development = CAPITAL
							is_capital = no
						}
						save_event_target_as = reward_province
					}
					random_trade_node_member_province = {
						limit = {
							owned_by = ROOT
							development = CAPITAL
							is_capital = no
							development = 20
						}
						save_event_target_as = reward_province
					}
					random_trade_node_member_province = {
						limit = {
							owned_by = ROOT
							development = CAPITAL
							is_capital = no
							development = 25
						}
						save_event_target_as = reward_province
					}
					random_trade_node_member_province = {
						limit = {
							owned_by = ROOT
							development = CAPITAL
							is_capital = no
							development = 30
						}
						save_event_target_as = reward_province
					}
				}
			}
			if = {
				limit = { has_saved_event_target = reward_province }
				event_target:reward_province = {
					add_province_modifier = {
						name = "dominant_trade_hub"
						duration = -1
					}
				}
			}
			else = {
				custom_tooltip = dominant_home_node_reward_tooltip
			}
			custom_tooltip = " "
			add_mercantilism_or_monarch_power = { amount = 3 }
		}
	}
	trade_company_region_abroad = {
		icon = mission_trade_company_region_abroad
		required_missions = { dominate_home_trade_node }
		trigger = {
			custom_trigger_tooltip = {
				tooltip = trade_company_region_abroad_tooltip
				calc_true_if = {
					all_trade_node = {
						calc_true_if = {
							all_trade_node_member_province = {
								owned_by = ROOT
								is_node_in_trade_company_region = yes
								NOT = { continent = CAPITAL }
							}
							amount = 5
						}
					}
					amount = 3
				}
			}
		}
		effect = {
			add_country_modifier = {
				name = "east_india_trade_rush"
				duration = 9125 #25 years
			}
			if = {
				limit = {
					NOT = {
						navy_tradition = 40
					}
				}
				create_explorer = { tradition = 40 }
			}
			else_if = {
				limit = {
					NOT = {
						navy_tradition = 60
					}
				}
				create_explorer = { tradition = 60 }
			}
			else_if = {
				limit = {
					NOT = {
						navy_tradition = 80
					}
				}
				create_explorer = { tradition = 80 }
			}
			else = {
				create_explorer = { tradition = 100 }
			}
		}
	}
}

 #3nd mission series:
administrative_missions = {
	slot = 4
	
	generic = yes
	
	potential = {
	   always = yes
	}
	high_income_mission = {
		icon = mission_high_income
		required_missions = {  } #None
		trigger = { share_of_starting_income = 1.5 }
		effect = {
			add_country_modifier = {
				name = "growing_economy"
				duration = 9125 #25 years
			}
			define_advisor = {
				type = treasurer
				skill = 1
				culture = ROOT
				religion = ROOT
				cost_multiplier = 0.5
			}
		}
	}
	build_temples = {
		icon = mission_early_game_buildings
		required_missions = { high_income_mission }
		trigger = {
			num_of_owned_provinces_with = {
				has_tax_building_trigger = yes
				value = 5
			}
			num_of_owned_provinces_with = {
				has_production_building_trigger = yes
				value = 5
			}
		}
		effect = {
			add_adm_power = 50
			add_country_modifier = {
				name = "building_spree"
				duration = 9125
			}
		}
	}
	build_treasury = {
		icon = mission_war_chest
		required_missions = { build_temples }
		trigger = { treasury = 2000 }
		effect = {
			add_country_modifier = {
				name = "strong_treasury"
				duration = 9125
			}
			add_corruption = -2
		}
	}
	build_manufactories = {
		icon = mission_have_manufactories
		required_missions = { build_treasury }
		trigger = {
			calc_true_if = {
				desc = build_manufactories_mission_tooltip
				all_owned_province = {
					OR = {
						has_building = mills
						has_building = farm_estate
						has_building = tradecompany
						has_building = plantations
						has_building = textile
						has_building = weapons
						has_building = wharf
						has_building = furnace
					}
				}
				amount = 20
			}
		}
		effect = {
			add_country_modifier = {
				name = "proto_industrialization"
				duration = 9125
			}
			add_years_of_income = 1.5
		}
	}
	imperial_ambition_mission = {
		icon = mission_empire
		required_missions = { build_manufactories }
		trigger = {
			total_development = 1000
		}
		effect = {
			add_prestige_or_monarch_power = {
				amount = 30
			}
			add_country_modifier = {
				name = "imperial_ambition"
				duration = 9125
			}
			custom_tooltip = perma_claim_neighbor_area
			hidden_effect = {
				every_owned_province = {
					every_neighbor_province = {
						area = {
							limit = {
								NOT = { owned_by = ROOT }
								NOT = { is_permanent_claim = ROOT    }
								NOT = { is_core = ROOT    }
							}
							add_permanent_claim = ROOT
						}
					}
				}
			}
		}
	}
}