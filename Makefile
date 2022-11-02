SPLIT = $(subst -, ,$@)
COMPONENT = $(word 2, $(SPLIT))
FILE = insert.scad
TARGET = tribes-of-the-wind-insert.zip

all: tiles_x1 action_cards_x1 other_cards_x2 pollution_x1 water_x1 wooden_piece_bottom_small_x1 wooden_piece_top_small_x1 wooden_piece_big_x1 optional_spacer
	@echo Done!

zip: clean all
	zip $(TARGET) dist/*.stl

tiles_x1: box-tiles_x1 lid-tiles_x1
action_cards_x1: box-action_cards_x1 lid-action_cards_x1
pollution_x1: box-pollution_x1 lid-pollution_x1
water_x1: box-water_x1 lid-water_x1
wooden_piece_top_small_x1: box-wooden_piece_top_small_x1 lid-wooden_piece_top_small_x1
wooden_piece_big_x1: box-wooden_piece_big_x1 lid-wooden_piece_big_x1
other_cards_x2: box-other_cards_x2
wooden_piece_bottom_small_x1: box-wooden_piece_bottom_small_x1 
optional_spacer: box-optional_spacer

dist: 
	mkdir -p dist

lid-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "g_lid_solid=true" -o dist/$(COMPONENT)-lid-solid.stl $(FILE)
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "g_lid_solid=false" -D "g_lid_label=false" -o dist/$(COMPONENT)-lid.stl $(FILE)
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "g_lid_solid=false" -D "g_lid_label=true" -o dist/$(COMPONENT)-lid-label.stl $(FILE)

box-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=false" -D "g_b_print_box=true" -o dist/$(COMPONENT)-box.stl $(FILE)

clean:
	rm -f dist/*.stl $(TARGET)