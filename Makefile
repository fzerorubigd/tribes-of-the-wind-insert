SPLIT = $(subst -, ,$@)
COMPONENT = $(word 2, $(SPLIT))
FILE = insert.scad
TARGET = tribes-of-the-wind-insert.zip

all: tiles_x1 action_cards_x1 other_cards_x2 tokens_x2 wooden_piece_bottom_small_x1 wooden_piece_top_small_x1 wooden_piece_big_x1
	@echo Done!

zip: clean all
	zip $(TARGET) dist/*.stl

tiles_x1: box-tiles_x1 lid-tiles_x1
action_cards_x1: box-action_cards_x1 lid-action_cards_x1
tokens_x2: box-tokens_x2 lid-tokens_x2
wooden_piece_top_small_x1: box-wooden_piece_top_small_x1 lid-wooden_piece_top_small_x1
wooden_piece_big_x1: box-wooden_piece_big_x1 lid-wooden_piece_big_x1
other_cards_x2: box-other_cards_x2
wooden_piece_bottom_small_x1: box-wooden_piece_bottom_small_x1 

dist: 
	mkdir -p dist

lid-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -o dist/$(COMPONENT)-lid-solid.stl $(FILE)

box-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=false" -D "g_b_print_box=true" -o dist/$(COMPONENT)-box.stl $(FILE)

clean:
	rm -f dist/*.stl $(TARGET)