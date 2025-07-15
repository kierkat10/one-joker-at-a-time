SMODS.Joker {
	key = "tyrone",
	name = "Tyrone",
	config = { extra = { chips_mod = 20, discards = 7, discards_remaining = 7, chips = 0 } },
	rarity = 3,
	atlas = "ojt_tyrone",
	pos = { x = 0, y = 0 },
	cost = 9,
	blueprint_compat = true,
	demicoloncompat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips_mod, card.ability.extra.discards, card.ability.extra.discards_remaining, card.ability.extra.chips } }
	end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if card.ability.extra.discards_remaining <= 1 then
                card.ability.extra.discards_remaining = card.ability.extra.discards
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
                return {
                    message = localize { type = "variable", key = "a_chips", vars = { card.ability.extra.chips } },
                    colour = G.C.BLUE
                }
            else
                card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
                return nil, true -- this is for joker retrigger purposes
            end
        end
        if (context.joker_main) or context.forcetrigger then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}