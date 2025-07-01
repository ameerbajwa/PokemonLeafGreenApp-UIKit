//
//  PokeAPIMocks.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 6/10/25.
//

import Foundation
@testable import PokemonLeafGreenApp_UIKit

struct PokeAPIMocks {
    static let PokeAPIPokemonMock = """
    {
      "id": 35,
      "name": "clefairy",
      "base_experience": 113,
      "height": 6,
      "is_default": true,
      "order": 56,
      "weight": 75,
      "abilities": [
        {
          "is_hidden": true,
          "slot": 3,
          "ability": {
            "name": "friend-guard",
            "url": "https://pokeapi.co/api/v2/ability/132/"
          }
        }
      ],
      "forms": [
        {
          "name": "clefairy",
          "url": "https://pokeapi.co/api/v2/pokemon-form/35/"
        }
      ],
      "game_indices": [
        {
          "game_index": 35,
          "version": {
            "name": "white-2",
            "url": "https://pokeapi.co/api/v2/version/22/"
          }
        }
      ],
      "location_area_encounters": "/api/v2/pokemon/35/encounters",
      "moves": [
        {
          "move": {
            "name": "pound",
            "url": "https://pokeapi.co/api/v2/move/1/"
          },
          "version_group_details": [
            {
              "level_learned_at": 1,
              "version_group": {
                "name": "firered-leafgreen",
                "url": "https://pokeapi.co/api/v2/version-group/1/"
              },
              "move_learn_method": {
                "name": "level-up",
                "url": "https://pokeapi.co/api/v2/move-learn-method/1/"
              },
              "order": 1
            }
          ]
        }
      ],
      "species": {
        "name": "clefairy",
        "url": "https://pokeapi.co/api/v2/pokemon-species/35/"
      },
      "sprites": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/35.png",
        "back_female": null,
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/35.png",
        "back_shiny_female": null,
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/35.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/35.png",
        "front_shiny_female": null,
        "other": {
          "dream_world": {
            "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/35.svg",
            "front_female": null
          },
          "home": {
            "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/35.png",
            "front_female": null,
            "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/35.png",
            "front_shiny_female": null
          },
          "official-artwork": {
            "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png",
            "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/35.png"
          },
          "showdown": {
            "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/35.gif",
            "back_female": null,
            "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/shiny/35.gif",
            "back_shiny_female": null,
            "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/35.gif",
            "front_female": null,
            "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/35.gif",
            "front_shiny_female": null
          }
        },
        "versions": {
          "generation-i": {
            "red-blue": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/35.png",
              "back_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/gray/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/35.png",
              "front_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/gray/35.png"
            },
            "yellow": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/35.png",
              "back_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/gray/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/35.png",
              "front_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/gray/35.png"
            }
          },
          "generation-ii": {
            "crystal": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/shiny/35.png"
            },
            "gold": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/shiny/35.png"
            },
            "silver": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/shiny/35.png"
            }
          },
          "generation-iii": {
            "emerald": {
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/shiny/35.png"
            },
            "firered-leafgreen": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/shiny/35.png"
            },
            "ruby-sapphire": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/shiny/35.png"
            }
          }
        }
      },
      "cries": {
        "latest": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/35.ogg",
        "legacy": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/legacy/35.ogg"
      },
      "stats": [
        {
          "base_stat": 35,
          "effort": 0,
          "stat": {
            "name": "speed",
            "url": "https://pokeapi.co/api/v2/stat/6/"
          }
        }
      ],
      "types": [
        {
          "slot": 1,
          "type": {
            "name": "fairy",
            "url": "https://pokeapi.co/api/v2/type/18/"
          }
        }
      ],
      "past_types": [
        {
          "generation": {
            "name": "generation-v",
            "url": "https://pokeapi.co/api/v2/generation/5/"
          },
          "types": [
            {
              "slot": 1,
              "type": {
                "name": "normal",
                "url": "https://pokeapi.co/api/v2/type/1/"
              }
            }
          ]
        }
      ],
      "past_abilities": [
        {
          "generation": {
            "name": "generation-iv",
            "url": "https://pokeapi.co/api/v2/generation/4/"
          },
          "abilities": [
            {
              "ability": null,
              "is_hidden": true,
              "slot": 3
            }
          ]
        }
      ]
    }
    """
    
    static let PokeAPIPokemonMockCorrupted = """
    {
      "i": 35,
      "nae": "clefairy",
      "bae_experience": 113,
      "height": 6,
      "is_default": true,
      "order": 56,
      "weight": 75,
      "abilities": [
        {
          "is_hidden": true,
          "slot": 3,
          "ability": {
            "name": "friend-guard",
            "url": "https://pokeapi.co/api/v2/ability/132/"
          }
        }
      ],
      "forms": [
        {
          "name": "clefairy",
          "url": "https://pokeapi.co/api/v2/pokemon-form/35/"
        }
      ],
      "game_indices": [
        {
          "game_index": 35,
          "version": {
            "name": "white-2",
            "url": "https://pokeapi.co/api/v2/version/22/"
          }
        }
      ],
      "location_area_encounters": "/api/v2/pokemon/35/encounters",
      "moes": [
        {
          "move": {
            "name": "pound",
            "url": "https://pokeapi.co/api/v2/move/1/"
          },
          "version_group_details": [
            {
              "level_learned_at": 1,
              "version_group": {
                "name": "red-blue",
                "url": "https://pokeapi.co/api/v2/version-group/1/"
              },
              "move_learn_method": {
                "name": "level-up",
                "url": "https://pokeapi.co/api/v2/move-learn-method/1/"
              },
              "order": 1
            }
          ]
        }
      ],
      "species": {
        "name": "clefairy",
        "url": "https://pokeapi.co/api/v2/pokemon-species/35/"
      },
      "spites": {
        "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/35.png",
        "back_female": null,
        "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/35.png",
        "back_shiny_female": null,
        "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/35.png",
        "front_female": null,
        "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/35.png",
        "front_shiny_female": null,
        "other": {
          "dream_world": {
            "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/35.svg",
            "front_female": null
          },
          "home": {
            "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/35.png",
            "front_female": null,
            "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/35.png",
            "front_shiny_female": null
          },
          "official-artwork": {
            "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png",
            "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/35.png"
          },
          "showdown": {
            "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/35.gif",
            "back_female": null,
            "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/shiny/35.gif",
            "back_shiny_female": null,
            "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/35.gif",
            "front_female": null,
            "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/35.gif",
            "front_shiny_female": null
          }
        },
        "verions": {
          "generation-i": {
            "red-blue": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/35.png",
              "back_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/gray/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/35.png",
              "front_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/gray/35.png"
            },
            "yellow": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/35.png",
              "back_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/gray/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/35.png",
              "front_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/gray/35.png"
            }
          },
          "generation-ii": {
            "crystal": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/shiny/35.png"
            },
            "gold": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/shiny/35.png"
            },
            "silver": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/shiny/35.png"
            }
          },
          "geeration-iii": {
            "emerald": {
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/shiny/35.png"
            },
            "fiered-leafgreen": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/shiny/35.png"
            },
            "ruby-sapphire": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/35.png",
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/shiny/35.png",
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/35.png",
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/shiny/35.png"
            }
          }
        }
      },
      "cries": {
        "latest": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/35.ogg",
        "legacy": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/legacy/35.ogg"
      },
      "stts": [
        {
          "bae_stat": 35,
          "efort": 0,
          "stt": {
            "nae": "speed",
            "url": "https://pokeapi.co/api/v2/stat/6/"
          }
        }
      ],
      "tyes": [
        {
          "slot": 1,
          "tye": {
            "nae": "fairy",
            "ul": "https://pokeapi.co/api/v2/type/18/"
          }
        }
      ],
      "past_types": [
        {
          "generation": {
            "name": "generation-v",
            "url": "https://pokeapi.co/api/v2/generation/5/"
          },
          "types": [
            {
              "slot": 1,
              "type": {
                "name": "normal",
                "url": "https://pokeapi.co/api/v2/type/1/"
              }
            }
          ]
        }
      ],
      "past_abilities": [
        {
          "generation": {
            "name": "generation-iv",
            "url": "https://pokeapi.co/api/v2/generation/4/"
          },
          "abilities": [
            {
              "ability": null,
              "is_hidden": true,
              "slot": 3
            }
          ]
        }
      ]
    }
    """

    static let PokeAPIPokemonSpeciesMock = """
    {
      "id": 1,
      "name": "bulbasaur",
      "growth_rate": {
        "name": "medium-slow",
        "url": "https://pokeapi.co/api/v2/growth-rate/4/"
      },
      "evolution_chain": {
        "url": "https://pokeapi.co/api/v2/evolution-chain/1/"
      },
      "generation": {
        "name": "generation-iii",
        "url": "https://pokeapi.co/api/v2/generation/3/"
      },
      "flavor_text_entries": [
        {
          "flavor_text": "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.",
          "language": {
            "name": "en",
            "url": "https://pokeapi.co/api/v2/language/9/"
          },
          "version": {
            "name": "red",
            "url": "https://pokeapi.co/api/v2/version/1/"
          }
        },
        {
          "flavor_text": "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.",
          "language": {
            "name": "en",
            "url": "https://pokeapi.co/api/v2/language/9/"
          },
          "version": {
            "name": "leafgreen",
            "url": "https://pokeapi.co/api/v2/version/2/"
          }
        }
      ]
    }
    """
    
    static let PokeAPIPokemonSpeciesMockCorrupted = """
    {
      "i": 1,
      "nae": "bulbasaur",
      "grwth_rate": {
        "nae": "medium-slow",
        "ul": "https://pokeapi.co/api/v2/growth-rate/4/"
      },
      "evlution_chain": {
        "ur": "https://pokeapi.co/api/v2/evolution-chain/1/"
      },
      "generation": {
        "name": "generation-iii",
        "url": "https://pokeapi.co/api/v2/generation/3/"
      },
      "flaor_text_entries": [
        {
          "flavr_text": "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.",
          "lanuage": {
            "name": "en",
            "url": "https://pokeapi.co/api/v2/language/9/"
          },
          "verion": {
            "name": "red",
            "url": "https://pokeapi.co/api/v2/version/1/"
          }
        },
        {
          "flavor_text": "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.",
          "language": {
            "name": "en",
            "url": "https://pokeapi.co/api/v2/language/9/"
          },
          "version": {
            "name": "blue",
            "url": "https://pokeapi.co/api/v2/version/2/"
          }
        }
      ]
    }
    """

    static let PokeAPIMove = """
    {
      "id": 1,
      "name": "pound",
      "accuracy": 100,
      "effect_chance": null,
      "pp": 35,
      "priority": 0,
      "power": 40,
      "contest_combos": {
        "normal": {
          "use_before": [
            {
              "name": "double-slap",
              "url": "https://pokeapi.co/api/v2/move/3/"
            },
            {
              "name": "headbutt",
              "url": "https://pokeapi.co/api/v2/move/29/"
            },
            {
              "name": "feint-attack",
              "url": "https://pokeapi.co/api/v2/move/185/"
            }
          ],
          "use_after": null
        },
        "super": {
          "use_before": null,
          "use_after": null
        }
      },
      "contest_type": {
        "name": "tough",
        "url": "https://pokeapi.co/api/v2/contest-type/5/"
      },
      "contest_effect": {
        "url": "https://pokeapi.co/api/v2/contest-effect/1/"
      },
      "damage_class": {
        "name": "physical",
        "url": "https://pokeapi.co/api/v2/move-damage-class/2/"
      },
      "effect_entries": [
        {
          "effect": "Inflicts [regular damage]{mechanic:regular-damage}.",
          "short_effect": "Inflicts regular damage with no additional effect.",
          "language": {
            "name": "en",
            "url": "https://pokeapi.co/api/v2/language/9/"
          }
        }
      ],
      "effect_changes": [],
      "generation": {
        "name": "generation-i",
        "url": "https://pokeapi.co/api/v2/generation/1/"
      },
      "meta": {
        "ailment": {
          "name": "none",
          "url": "https://pokeapi.co/api/v2/move-ailment/0/"
        },
        "category": {
          "name": "damage",
          "url": "https://pokeapi.co/api/v2/move-category/0/"
        },
        "min_hits": null,
        "max_hits": null,
        "min_turns": null,
        "max_turns": null,
        "drain": 0,
        "healing": 0,
        "crit_rate": 0,
        "ailment_chance": 0,
        "flinch_chance": 0,
        "stat_chance": 0
      },
      "names": [
        {
          "name": "Pound",
          "language": {
            "name": "en",
            "url": "https://pokeapi.co/api/v2/language/9/"
          }
        }
      ],
      "past_values": [],
      "stat_changes": [
        {
          "change": -1,
          "stat": {
            "name": "defense",
            "url": "https://pokeapi.co/api/v2/stat/3/"
          }
        }
      ],
      "super_contest_effect": {
        "url": "https://pokeapi.co/api/v2/super-contest-effect/5/"
      },
      "target": {
        "name": "selected-pokemon",
        "url": "https://pokeapi.co/api/v2/move-target/10/"
      },
      "type": {
        "name": "normal",
        "url": "https://pokeapi.co/api/v2/type/1/"
      },
      "learned_by_pokemon": [
        {
          "name": "clefairy",
          "url": "https://pokeapi.co/api/v2/pokemon/35/"
        }
      ],
      "flavor_text_entries": [
        {
          "flavor_text": "A physical attack delivered with a long tail or a foreleg, etc.",
          "language": {
            "url": "https://pokeapi.co/api/v2/language/9/",
            "name": "en"
          },
          "version_group": {
            "url": "https://pokeapi.co/api/v2/version-group/7/",
            "name": "firered-leafgreen"
          }
        }
      ]
    }
    """
    
    static let PokeAPIMoveStatChange = """
    {
      "change": -1,
      "stat": {
        "name": "attack",
        "url": "https://pokeapi.co/api/v2/stat/2/"    
      }
    }
    """
    
    static let PokeAPIMoveCorrupted = """
    {
      "i": 1,
      "nme": "pound",
      "accracy": 100,
      "effect_chance": null,
      "ppa": 35,
      "priority": 0,
      "powera": 40,
      "contest_combos": {
        "normal": {
          "use_before": [
            {
              "name": "double-slap",
              "url": "https://pokeapi.co/api/v2/move/3/"
            },
            {
              "name": "headbutt",
              "url": "https://pokeapi.co/api/v2/move/29/"
            },
            {
              "name": "feint-attack",
              "url": "https://pokeapi.co/api/v2/move/185/"
            }
          ],
          "use_after": null
        },
        "super": {
          "use_before": null,
          "use_after": null
        }
      },
      "contest_type": {
        "name": "tough",
        "url": "https://pokeapi.co/api/v2/contest-type/5/"
      },
      "contest_effect": {
        "url": "https://pokeapi.co/api/v2/contest-effect/1/"
      },
      "damage_class": {
        "name": "physical",
        "url": "https://pokeapi.co/api/v2/move-damage-class/2/"
      },
      "effect_entries": [
        {
          "effect": "Inflicts [regular damage]{mechanic:regular-damage}.",
          "short_effect": "Inflicts regular damage with no additional effect.",
          "language": {
            "name": "en",
            "url": "https://pokeapi.co/api/v2/language/9/"
          }
        }
      ],
      "effect_changes": [],
      "generation": {
        "name": "generation-i",
        "url": "https://pokeapi.co/api/v2/generation/1/"
      },
      "meta": {
        "ailment": {
          "name": "none",
          "url": "https://pokeapi.co/api/v2/move-ailment/0/"
        },
        "category": {
          "name": "damage",
          "url": "https://pokeapi.co/api/v2/move-category/0/"
        },
        "min_hits": null,
        "max_hits": null,
        "min_turns": null,
        "max_turns": null,
        "drain": 0,
        "healing": 0,
        "crit_rate": 0,
        "ailment_chance": 0,
        "flinch_chance": 0,
        "stat_chance": 0
      },
      "names": [
        {
          "name": "Pound",
          "language": {
            "name": "en",
            "url": "https://pokeapi.co/api/v2/language/9/"
          }
        }
      ],
      "past_values": [],
      "stat_changes": [],
      "super_contest_effect": {
        "url": "https://pokeapi.co/api/v2/super-contest-effect/5/"
      },
      "target": {
        "name": "selected-pokemon",
        "url": "https://pokeapi.co/api/v2/move-target/10/"
      },
      "typew": {
        "nae": "normal",
        "urls": "https://pokeapi.co/api/v2/type/1/"
      },
      "learned_by_pokemon": [
        {
          "name": "clefairy",
          "url": "https://pokeapi.co/api/v2/pokemon/35/"
        }
      ],
      "flavor_txt_entries": [
        {
          "flavor_tet": "Pounds with fore­legs or tail.",
          "languages": {
            "urls": "https://pokeapi.co/api/v2/language/9/",
            "names": "en"
          },
          "version_groups": {
            "urls": "https://pokeapi.co/api/v2/version-group/3/",
            "names": "gold-silver"
          }
        }
      ]
    }
    """
    
    func returnPokeAPIPokemonMockResponses(mockDecoder: JSONDecoder) -> (PokeAPIPokemonDetails, PokeAPIPokemonSpeciesDetails)? {
        let pokeAPIPokemonMockData = Data(PokeAPIMocks.PokeAPIPokemonMock.utf8)
        let pokeAPIPokemonSpeciesMockData = Data(PokeAPIMocks.PokeAPIPokemonSpeciesMock.utf8)
        var pokeAPIPokemonMockResponse: PokeAPIPokemonDetails!
        var pokeAPIPokemonSpeciesMockResponse: PokeAPIPokemonSpeciesDetails!
        
        do {
            pokeAPIPokemonMockResponse = try mockDecoder.decode(PokeAPIPokemonDetails.self, from: pokeAPIPokemonMockData)
            pokeAPIPokemonSpeciesMockResponse = try mockDecoder.decode(PokeAPIPokemonSpeciesDetails.self, from: pokeAPIPokemonSpeciesMockData)
            return (pokeAPIPokemonMockResponse, pokeAPIPokemonSpeciesMockResponse)
        } catch {
            return nil
        }
    }
    
    func returnPokeAPIMoveMockResponse(mockDecoder: JSONDecoder) -> PokeAPIMoveDetails? {
        let pokeAPIMoveMockData = Data(PokeAPIMocks.PokeAPIMove.utf8)
        var pokeAPIMoveMockResponse: PokeAPIMoveDetails!
        
        do {
            pokeAPIMoveMockResponse = try mockDecoder.decode(PokeAPIMoveDetails.self, from: pokeAPIMoveMockData)
            return pokeAPIMoveMockResponse
        } catch {
            return nil
        }
    }
}
