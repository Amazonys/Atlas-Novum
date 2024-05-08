african_missions = {
	slot = 5
	generic = yes
	ai = yes
	potential = {
		capital_scope = {
			OR = {
				region = sahel_region
				region = niger_region
				region = guinea_region
				region = horn_of_africa_region
				region = east_africa_region
				region = central_africa_region
				region = kongo_region
				region = south_africa_region
			}
		}
	}

	africa_slave_trade = {
		icon = mission_african_soldier
		required_missions = { }
		trigger = {
			OR = {
				AND = {
					production_leader = {
						trade_goods = slaves
					}
					slaves = 4
				}
				AND = {
					has_country_modifier = the_abolish_slavery_act
					NOT = {
						any_neighbor_country = {
							slaves = 1
						}
					}
				}
			}
		}
		effect = {
			if = {
				limit = {
					production_leader = {
						trade_goods = slaves
					}
				}
				add_mercantilism_or_monarch_power = { amount = 2 }
				add_country_modifier = {
					name = "africa_slave_trade_mission"
					duration = 7300
				}
			}
			else = {
				add_country_modifier = {
					name = "african_abolitionists"
					duration = 7300
				}
			}
		}
	}
	
	africa_modernization = {
		icon = mission_have_manufactories
		required_missions = { }
		trigger = {
			is_tribal = no
			NOT = { has_reform = iqta }
			any_neighbor_country = {
				technology_group = western
				NOT = {
					tech_difference = 1
				}
			}
		}
		effect = {
			add_innovativeness_big_effect = yes
			add_prestige_or_monarch_power = {
				amount = 20
			}
		}
	}
	
	african_wealth_mission = {
		icon = mission_war_chest
		required_missions = { }
		trigger = {
			OR = {
				gold = 3
				AND = {
					production_leader = {
						trade_goods = ivory
					}
					ivory = 7
				}
				production_leader = {
					trade_goods = coffee
				}
			}
		}
		effect = {
			capital_scope = {
				add_base_tax = 1
				add_base_production = 1
				add_base_manpower = 1
			}
			add_country_modifier = {
				name = "wealth_of_africa_modifier"
				duration = 7300
			}
		}
	}
}