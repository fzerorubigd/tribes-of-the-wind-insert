include <bit/boardgame_insert_toolkit_lib.2.scad>;

// determines whether lids are output.
g_b_print_lid = true;

// determines whether boxes are output.
g_b_print_box = true; 

// Focus on one box
g_isolated_print_box = ""; 

// Used to visualize how all of the boxes fit together. 
g_b_visualization = f;          
        
// this is the outer wall thickness. 
//Default = 1.5mm
g_wall_thickness = 1.5;

// The tolerance value is extra space put between planes of the lid and box that fit together.
// Increase the tolerance to loosen the fit and decrease it to tighten it.
//
// Note that the tolerance is applied exclusively to the lid.
// So if the lid is too tight or too loose, change this value ( up for looser fit, down for tighter fit ) and 
// you only need to reprint the lid.
// 
// The exception is the stackable box, where the bottom of the box is the lid of the box below,
// in which case the tolerance also affects that box bottom.
//
g_tolerance = 0.15;

// This adjusts the position of the lid detents downward. 
// The larger the value, the bigger the gap between the lid and the box.
g_tolerance_detents_pos = 0.1;

// Tribes of the wind
gw = g_wall_thickness;
gw2 = gw * 2;
gw3 = gw * 3;
gw4 = gw * 4;
g_lid_solid = f;

lid_attr = [[ LID_SOLID_B, g_lid_solid]];
g_cut = 3.5;

box_width = 280;
box_height = 280;
box_depth = 40;

// tiles 
tiles_width = 80;
tiles_height = 100;
tiles_depth = box_depth;

tile_r = (tiles_height - gw3) / 2;

// cards 

cards_width = (box_width - tiles_width - gw) / 3;
cards_height = tiles_height;

action_cards_depth =  box_depth;
other_cards_depth = 15;

// cardboard tokens
tokens_width = cards_width;
tokens_height = cards_height;

tokens_depth = box_depth - other_cards_depth;

// wooden pieces

wood_width = tiles_width;
wood_height = (box_height-tiles_height)/2;

small_wood_depth = box_depth/2;
large_wood_depth = box_depth;

// spacer 

spacer_width = box_width - tiles_height;
spacer_height = box_height - tiles_width;
spacer_depth = 7;

data =
[
    [   "tiles_x1",
        [
            [ BOX_SIZE_XYZ, [tiles_width, tiles_height, tiles_depth] ],
            [ BOX_LID,
                lid_attr,
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tiles_width-gw2, tile_r,tiles_depth - gw ] ],
                    [POSITION_XY,               [0,0]],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, t, f ] ],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tiles_width-gw2, tile_r,tiles_depth - gw ] ],
                    [POSITION_XY,               [0,tile_r+gw,CENTER]],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, f, t ] ],
                ]
            ]
        ]
    ],
    [   "action_cards_x1",
        [
            [ BOX_SIZE_XYZ, [cards_width, cards_height, action_cards_depth]],
            [ BOX_LID,
                lid_attr,
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cards_width-gw2, cards_height-gw2,action_cards_depth - gw ] ],
                    [POSITION_XY,               [0,0]],
                    [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ],
        ]
    ],
    [   "other_cards_x2",
        [
            [ BOX_SIZE_XYZ, [cards_width, cards_height, other_cards_depth]],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ cards_width-gw2, cards_height-gw2,other_cards_depth - gw ] ],
                    [POSITION_XY,               [0,0]],
                    [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ],
        ]
    ],
    [   "tokens_x2",
        [
            [ BOX_SIZE_XYZ, [tokens_width, tokens_height, tokens_depth]],
            [ BOX_LID,
                lid_attr,
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ tokens_width-gw2, tokens_height-gw2,tokens_depth - gw ] ],
                    [POSITION_XY,               [0,0]],
                ]
            ],
        ]
    ],   
    [   "wooden_piece_bottom_small_x1",
        [
            [ BOX_SIZE_XYZ, [wood_width, wood_height, small_wood_depth]],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true], 
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ wood_width-gw2, wood_height-gw2, small_wood_depth-gw] ],
                    [POSITION_XY,               [0,0]],
                ]
            ],
        ]
    ],
    [   "wooden_piece_top_small_x1",
        [
            [ BOX_SIZE_XYZ, [wood_width, wood_height, small_wood_depth]],
            [ BOX_LID,
                lid_attr,
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ wood_width-gw2, wood_height-gw2, small_wood_depth-gw] ],
                    [POSITION_XY,               [0,0]],
                ]
            ],
        ]
    ], 
    [   "wooden_piece_big_x1",
        [
            [ BOX_SIZE_XYZ, [wood_width, wood_height, large_wood_depth]],
            [ BOX_LID,
                lid_attr,
            ],
            [ BOX_COMPONENT,
                [
                    [ CMP_COMPARTMENT_SIZE_XYZ, [ wood_width-gw2, wood_height-gw2, large_wood_depth-gw] ],
                    [POSITION_XY,               [0,0]],
                ]
            ],
        ]
    ],    
    [   "optional_spacer",
        [
            [ BOX_SIZE_XYZ, [spacer_width, spacer_height, spacer_depth] ],
            [ BOX_NO_LID_B, true],  
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ spacer_width-gw2, spacer_height-gw2, spacer_depth -gw ],],
                    [POSITION_XY,                           [0,0]],
                    [ CMP_CUTOUT_BOTTOM_B, true ],
                ]
            ]]]
];


MakeAll();