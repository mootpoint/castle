minetest.register_node("castle:ropes",{
	description = "Rope",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"castle_ropes.png"},
	groups = {choppy=3,snappy=3,oddly_breakable_by_hand=3,flammable=1},
	sounds = default.node_sound_defaults(),
	paramtype = "light",
	climbable = true,
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
})

minetest.register_craft({
	output = "castle:ropes",
	recipe = {
		{"farming:string"},
		{"farming:string"},
		{"farming:string"},
	}
})

minetest.register_node("castle:box_rope", {
	description = "Rope from Ropebox",
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"castle_ropes.png"},
	groups = {not_in_creative_inventory=1},
	climbable = true,
	walkable = false,
	diggable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if node.name == "castle:box_rope" then
			minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
		end
	end,
})

minetest.register_node("castle:ropebox", {
	description = "Ropebox",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"castle_ropebox_top.png",
		"castle_ropebox_top.png",
		"castle_ropebox_side_1.png",
		"castle_ropebox_side_1.png",
		"castle_ropebox_side_2.png",
		"castle_ropebox_side_2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=3},
	sounds = default.node_sound_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-2/16, -2/16, -4/16, 2/16, 2/16, 4/16},
			{-2/16, -4/16, -2/16, 2/16, 4/16, 2/16},
			{-2/16, -3/16, -3/16, 2/16, 3/16, 3/16},
			{-3/16, -2/16, -2/16, -2/16, 8/16, 2/16},
			{2/16, -2/16, -2/16, 3/16, 8/16, 2/16},
			{-1/16, -8/16, -1/16, 1/16, -4/16, 1/16},
		},
	},
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if node.name == "castle:box_rope" then
			minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
		end
	end,
})

minetest.register_abm({
	nodenames = {"castle:ropebox"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
		minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="castle:box_rope"})
	end
})

minetest.register_abm({
	nodenames = {"castle:box_rope"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
		minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="castle:box_rope"})
	end
})

minetest.register_craft({
	output = "castle:ropebox",
	recipe = {
		{"default:wood"},
		{"castle:ropes"},
	}
})


-- this adds a ropebox, and a rope node that produce light for shaft mining.

-- ropes produce a little less light than traditional Torch

minetest.register_node("castle:light_ropes",{
	description = "Light producing Rope",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"castle_light_ropes.png"},
	groups = {choppy=3,snappy=3,oddly_breakable_by_hand=3,flammable=1},
	sounds = default.node_sound_defaults(),
	paramtype = "light",
	climbable = true,
	walkable = false,
	light_source = default.LIGHT_MAX - 2,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
})

minetest.register_craft({
	output = "castle:light_ropes 3",
	recipe = {
		{"default:mese_fragment"},
		{"farming:string"},
		{"farming:string"},
	}
})

minetest.register_node("castle:light_box_rope", {
	description = "Light producing Rope from Ropebox",
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"castle_light_ropes.png"},
	groups = {not_in_creative_inventory=1},
	climbable = true,
	walkable = false,
	diggable = false,
	light_source = default.LIGHT_MAX - 2,
	node_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16}, 
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/16, -8/16, -1/16, 1/16, 8/16, 1/16},
		},
	},
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if node.name == "castle:light_box_rope" then
			minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
		end
	end,
})

minetest.register_node("castle:light_ropebox", {
	description = "Light Producing Ropebox",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"castle_light_ropebox_top.png",
		"castle_light_ropebox_top.png",
		"castle_light_ropebox_side_1.png",
		"castle_light_ropebox_side_1.png",
		"castle_light_ropebox_side_2.png",
		"castle_light_ropebox_side_2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy=3},
	sounds = default.node_sound_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-2/16, -2/16, -4/16, 2/16, 2/16, 4/16},
			{-2/16, -4/16, -2/16, 2/16, 4/16, 2/16},
			{-2/16, -3/16, -3/16, 2/16, 3/16, 3/16},
			{-3/16, -2/16, -2/16, -2/16, 8/16, 2/16},
			{2/16, -2/16, -2/16, 3/16, 8/16, 2/16},
			{-1/16, -8/16, -1/16, 1/16, -4/16, 1/16},
		},
	},
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
		if node.name == "castle:light_box_rope" then
			minetest.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
		end
	end,
})

minetest.register_abm({
	nodenames = {"castle:light_ropebox"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
		minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="castle:light_box_rope"})
	end
})

minetest.register_abm({
	nodenames = {"castle:light_box_rope"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
		minetest.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="castle:light_box_rope"})
	end
})

minetest.register_craft({
	output = "castle:light_ropebox",
	recipe = {
		{"default:wood"},
		{"castle:light_ropes"},
	}
})

