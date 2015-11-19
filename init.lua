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
	groups = {snappy = 3, flammable = 2, leafdecay = 3,
		leafdecay_drop = 1, rfruit = 1, not_in_creative_inventory = 1},
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
	groups = {snappy = 3, flammable = 2, leafdecay = 3,
		leafdecay_drop = 1, rfruit = 1, not_in_creative_inventory = 1},
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

--ABM

rfruit.grow_fruit = function (pos, node)

-- tell the ABM what has to be transformed into what
	if node.name == "ethereal_refruit:bud_apple" then
		minetest.set_node(pos, {name = "ethereal_refruit:flower_apple"})

	elseif node.name == "ethereal_refruit:flower_apple" then
		minetest.set_node(pos, {name = "default:apple"})

	elseif node.name == "ethereal_refruit:bud_banana" then
		minetest.set_node(pos, {name = "ethereal_refruit:flower_banana"})

	elseif node.name == "ethereal_refruit:flower_banana" then
		minetest.set_node(pos, {name = "ethereal:banana"})

	elseif node.name == "ethereal_refruit:bud_orange" then
		minetest.set_node(pos, {name = "ethereal_refruit:flower_orange"})

	elseif node.name == "ethereal_refruit:flower_orange" then
		minetest.set_node(pos, {name = "ethereal:orange"})

	elseif node.name == "ethereal_refruit:bud_coconut" then
		minetest.set_node(pos, {name = "ethereal_refruit:flower_coconut"})

	elseif node.name == "ethereal_refruit:flower_coconut" then
		minetest.set_node(pos, {name = "ethereal:coconut"})

	elseif node.name == "ethereal_refruit:bud_golden_apple" then
		minetest.set_node(pos, {name = "ethereal_refruit:flower_golden_apple"})

	elseif node.name == "ethereal_refruit:flower_golden_apple" then
		minetest.set_node(pos, {name = "ethereal:golden_apple"})
	end
end

minetest.register_abm({
	nodenames = {"group:rfruit"},
	neighbors = {"group:leaves"},
	interval = 90,
	chance = 2,
--	catch_up = false,
	action = function(pos, node)
		rfruit.grow_fruit(pos, node)
	end,
})
