northeast = {
	slot = 3
	generic = no
	ai = yes
	potential = {
		OR = {
			culture_group = central_algonquian
			culture_group = eastern_algonquian
			culture_group = iroquoian
			primary_culture = chiwere
			primary_culture = osage
		}
		NOT = {
			OR = {
				tag = CHE
				tag = TSC
			}
		}
		capital_scope = {
			NOT = { continent = new_world }
		}
	}
	has_country_shield = yes
	
	ne_birchbark_canoes = {
		icon = mission_ne_birch_bark_canoes
		position = 1
		required_missions = {	}
		provinces_to_highlight = {
			OR = {
				province_id = 958
				province_id = 959
				province_id = 960
				province_id = 961
			}
			NOT = { owned_by = ROOT }
		}
		
		trigger = {
			is_subject = no
			stability = 1
			OR = {
				958 = { owned_by = ROOT }
				959 = { owned_by = ROOT }
				960 = { owned_by = ROOT }
				961 = { owned_by = ROOT }
			}
		}
		
		effect = {
			capital_scope = {
				add_province_modifier = {
					name = ne_canoes
					duration = 7300
				}
			}
		}
	}
	
	ne_longhouses = {
		icon = mission_ne_longhouses
		position = 2
		required_missions = {	}
		provinces_to_highlight = {
			owned_by = ROOT
		}
		
		trigger = {
			calc_true_if = {
				all_owned_province = {
					OR = {
						has_building = native_longhouse
						has_building = native_fortified_house 
					}
				}
				amount = 2
			}
		}
		
		effect = {
			add_country_modifier = {
				name = ne_fortified_village
				duration = 5475
			}
			944 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			987 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			2586 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			988 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			2670 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			989 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			2585 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			2671 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
		}
	}
	
	ne_palisades = {
		icon = mission_ne_palisades
		position = 3
		required_missions = { ne_longhouses }
		provinces_to_highlight = {
			owned_by = ROOT
		}
		
		trigger = {
			calc_true_if = {
				all_owned_province = {
					has_building = native_palisade
				}
				amount = 2
			}
		}
		
		effect = {
			every_owned_province = {
				limit = {
					has_building = native_palisade
				}
				add_province_modifier = {
					name = ne_palisaded_village
					duration = 5475
				}
			}
			954 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			4872 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			958 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			959 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			960 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			961 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			954 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			2587 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
			944 = {
				if = {
					limit = {
						NOT = { is_permanent_claim = ROOT }
						NOT = { is_core = ROOT }
					}
					add_permanent_claim = ROOT
				}
			}
		}
	}
	
	ne_great_lakes_conquest = {
		icon = mission_ne_great_lakes_conquest
		position = 4
		required_missions = {	}
		provinces_to_highlight = {
			OR = {
				province_id = 944
				province_id = 987
				province_id = 2586
				province_id = 988
				province_id = 2670
				province_id = 989
				province_id = 2585
				province_id = 2671
				province_id = 954
				province_id = 4872
				province_id = 958
				province_id = 959
				province_id = 960
				province_id = 961
				province_id = 964
				province_id = 954
				province_id = 2587
			}
			NOT = { owned_by = ROOT }
		}
		trigger = {
			OR = {
				AND = {
					944 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					987 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					2586 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					988 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					2670 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					989 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					2585 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					2671 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					954 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					4872 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					958 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					959 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					960 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					961 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					964 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					945 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
					2587 = {
						country_or_non_sovereign_subject_holds = ROOT
					}
				}
				federation_size = 6
			}
		}
		
		effect = {
			connecticut_valley_area = {
				limit = {
					NOT = { is_permanent_claim = ROOT }
					NOT = { is_core = ROOT	}
				}
				add_permanent_claim = ROOT
			}
			delaware_valley_area = {
				limit = {
					NOT = { is_permanent_claim = ROOT }
					NOT = { is_core = ROOT	}
				}
				add_permanent_claim = ROOT
			}
			hudson_valley_area = {
				limit = {
					NOT = { is_permanent_claim = ROOT }
					NOT = { is_core = ROOT	}
				}
				add_permanent_claim = ROOT
			}
			maryland_area = {
				limit = {
					NOT = { is_permanent_claim = ROOT }
					NOT = { is_core = ROOT	}
				}
				add_permanent_claim = ROOT
			}
			massachusetts_bay_area = {
				limit = {
					NOT = { is_permanent_claim = ROOT }
					NOT = { is_core = ROOT	}
				}
				add_permanent_claim = ROOT
			}
		}
	}
	
	ne_conquer_northeast = {
		icon = mission_iroquois_warriors
		position = 5
		required_missions = { ne_great_lakes_conquest }
		provinces_to_highlight = {
			region_for_scope_province = {
				is_capital_of = ROOT
			}
			NOT = { owned_by = ROOT }
		}
		
		trigger = {
			calc_true_if = {
				amount = 20
				all_province = {
					OR = {
						region = northeast_america_region
					}
					country_or_non_sovereign_subject_holds = ROOT
				}
			}
		}
		
		effect = {
			add_country_modifier = {
				name = ne_conquered_northeast
				duration = 7300
			}
			add_mil_power = 150
		}
	}
	
	ne_agriculture = {
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
				name = ne_agricultural_complex
				duration = 7300
			}
		}
	}
}