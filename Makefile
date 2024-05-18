SKIN_NAME = neon
INKSCAPE = inkscape

textures_sd_obj = \
	songselect-top.png \
	songselect-bottom.png \
	selection-mode.png \
	selection-mode-over.png \
	selection-mods.png \
	selection-mods-over.png \
	selection-random.png \
	selection-random-over.png \
	selection-options.png \
	selection-options-over.png \
	selection-tab.png \
	menu-button-background.png \
	mania-stage-hint.png \
	mania-stage-left.png \
	mania-stage-right.png \
	mania-stage-light.png \
	mania-key-hint.png \
	mania-key-hint-active.png \
	mania-key-hint-active-mini.png \
	mania-key-hint-active-scratch.png \
	mania-note.png \
	mania-note-alt.png \
	mania-note-scratch.png \
	mania-hold-head.png \
	mania-hold-head-alt.png \
	mania-hold-head-scratch.png \
	mania-hold-body.png \
	mania-hold-body-alt.png \
	mania-hold-body-scratch.png \
	mania-hold-body-1.png \
	mania-hold-body-alt-1.png \
	mania-hold-body-scratch-1.png \
	mania-hold-tail.png \
	mania-hold-tail-alt.png \
	mania-hold-tail-scratch.png \
	mania-hit-splash.png \
	mania-hit-splash-mini.png \
	mania-hit-splash-1k.png \
	mania-hold-light.png \
	mania-hit300g-0.png \
	mania-hit300g-1.png \
	mania-hit300-0.png \
	mania-hit200-0.png \
	mania-hit100-0.png \
	mania-hit50-0.png \
	mania-hit0-0.png \
	mania-lazer-counter-score.png \
	mania-lazer-counter-pp.png \
	scorebar-bg.png \
	scorebar-colour.png \
	scorebar-marker.png

empty_images_obj = \
	mania-key-hint.svg \
	scorebar-marker.svg

lazer_layout_src = \
	skininfo.json \
	MainHUDComponents.json \
	Playfield.json

textures_hd_obj = $(textures_sd_obj:%.png=%@2x.png)

.PHONY: all
all: textures $(lazer_layout_src)

%.png: %.svg
	$(INKSCAPE) --export-type=png --export-filename=$@ -d 96 $<

%@2x.png: %.svg
	$(INKSCAPE) --export-type=png --export-filename=$@ -d 192 $<

$(empty_images_obj): empty.svg
	cp empty.svg $@

textures: textures_sd textures_hd

textures_sd: $(textures_sd_obj)

textures_hd: $(textures_hd_obj)

.PHONY: clean
clean:
	$(MAKE) -i clean_main

.PHONY: clean_main
clean_main:
	rm *.osk
	rm $(textures_sd_obj)
	rm $(textures_hd_obj)
	rm $(empty_images_obj)

$(SKIN_NAME).osk: all
	if [ -f $@ ]; then rm $@; fi
	zip -q -r $@ \
		LICENSE \
		$(textures_sd_obj) \
		$(textures_hd_obj) \
		$(lazer_layout_src) \
		skin.ini

.PHONY: dist
dist: $(SKIN_NAME).osk
