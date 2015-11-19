-- Replacements

minetest.override_item("default:apple", {
	drop = "default:apple",
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
	if oldnode.name == "default:apple" then
		if oldnode.param2 ~= 0 then
			return
		end
		minetest.set_node(pos,{name = "ethereal_refruit:bud_apple"})
	else
		return
	end
end,
})

minetest.override_item("ethereal:banana", {
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
	if oldnode.name == "ethereal:banana" then
		if oldnode.param2 ~= 0 then
			return
		end
		minetest.set_node(pos,{name = "ethereal_refruit:bud_banana"})
	else 
		return
	end
end,
})

minetest.override_item("ethereal:orange", {
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
	if oldnode.name == "ethereal:orange" then
		if oldnode.param2 ~= 0 then
			return
		end
		minetest.set_node(pos,{name = "ethereal_refruit:bud_orange"})
	else 
		return
	end
end,
})

minetest.override_item("ethereal:coconut", {
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
	if oldnode.name == "ethereal:coconut" then
		if oldnode.param2 ~= 0 then
			return
		end
		minetest.set_node(pos,{name = "ethereal_refruit:bud_coconut"})
	else 
		return
	end
end,
})

minetest.override_item("ethereal:golden_apple", {
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
	if oldnode.name == "ethereal:golden_apple" then
		if oldnode.param2 ~= 0 then
			return
		end
		minetest.set_node(pos,{name = "ethereal_refruit:bud_golden_apple"})
	else 
		return
	end
end,
})

-- Nodes

local rfruit = {}
rfruit.type = {
	{"apple", "Apple"},
	{"banana", "Banana"},
	{"orange", "Orange"},
	{"coconut", "Coconut"},
	{"golden_apple", "Golden Apple"},
}

for _, row in ipairs(rfruit.type) do

	local name = row[1]
	local desc = row[2]

minetest.register_node("ethereal_refruit:bud_"..name, {
	description = desc.." Bud",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"refruit_bud_"..name..".png"},
	inventory_image = "refruit_bud_"..name..".png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.1875, -0.3125, -0.1875, 0.1875, 0.3125, 0.1875}
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2, leafdecay = 3, leafdecay_drop = 1, fruit = 1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'default:stick'},
				rarity = 99,
			},
			{
				items = {'default:stick'},
				rarity = 99
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("ethereal_refruit:flower_"..name, {
	description = desc.." Flower",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"refruit_flower_"..name..".png"},
	inventory_image = "refruit_flower_"..name..".png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.1875, -0.3125, -0.1875, 0.1875, 0.3125, 0.1875}
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2, leafdecay = 3, leafdecay_drop = 1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {'default:stick'},
				rarity = 99,
			},
			{
				items = {'default:stick'},
				rarity = 99
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
})
end

--ABMs

-- Apple
minetest.register_abm({
	nodenames = {"ethereal_refruit:bud_apple"},
	neighbors = {"default:leaves"},
	interval = 34,
	chance = 10,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal_refruit:flower_apple"})
	end,
})

minetest.register_abm({
	nodenames = {"ethereal_refruit:flower_apple"},
	neighbors = {"default:leaves"},
	interval = 33,
	chance = 60,
	action = function(pos, node)
		minetest.set_node(pos, {name = "default:apple"})
	end,
})

-- Banana

minetest.register_abm({
	nodenames = {"ethereal_refruit:bud_banana"},
	neighbors = {"ethereal:bananaleaves"},
	interval = 37,
	chance = 10,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal_refruit:flower_banana"})
	end,
})

minetest.register_abm({
	nodenames = {"ethereal_refruit:flower_banana"},
	neighbors = {"ethereal:bananaleaves"},
	interval = 36,
	chance = 60,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal:banana"})
	end,
})

-- Orange

minetest.register_abm({
	nodenames = {"ethereal_refruit:bud_orange"},
	neighbors = {"ethereal:orange_leaves"},
	interval = 36,
	chance = 10,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal_refruit:flower_orange"})
	end,
})

minetest.register_abm({
	nodenames = {"ethereal_refruit:flower_orange"},
	neighbors = {"ethereal:orange_leaves"},
	interval = 35,
	chance = 60,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal:orange"})
	end,
})

-- Coconut

minetest.register_abm({
	nodenames = {"ethereal_refruit:bud_coconut"},
	neighbors = {"ethereal:palmleaves"},
	interval = 39,
	chance = 10,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal_refruit:flower_coconut"})
	end,
})

minetest.register_abm({
	nodenames = {"ethereal_refruit:flower_coconut"},
	neighbors = {"ethereal:palmleaves"},
	interval = 38,
	chance = 60,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal:coconut"})
	end,
})

-- Golden Apple

minetest.register_abm({
	nodenames = {"ethereal_refruit:bud_golden_apple"},
	neighbors = {"ethereal:yellowleaves"},
	interval = 40,
	chance = 10,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal_refruit:flower_golden_apple"})
	end,
})

minetest.register_abm({
	nodenames = {"ethereal_refruit:flower_golden_apple"},
	neighbors = {"ethereal:yellowleaves"},
	interval = 39,
	chance = 60,
	action = function(pos, node)
		minetest.set_node(pos, {name = "ethereal:golden_apple"})
	end,
})
