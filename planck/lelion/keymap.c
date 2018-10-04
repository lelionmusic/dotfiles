#include "planck.h"
#include "action_layer.h"

extern keymap_config_t keymap_config;

enum planck_layers {
  _QWERTY,
  _LOWER,
  _RAISE,
  _ADJUST,
  _NAV
};

enum planck_keycodes {
  QWERTY = SAFE_RANGE,
  LOWER,
  RAISE,
  BACKLIT,
  UNICODE
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Custom macros */
#define CTL_ESC     CTL_T(KC_ESC)  // Tap for Esc, hold for Ctrl
#define SFT_ENT     SFT_T(KC_ENT)  // Tap for Enter, hold for Shift
#define HPR_TAB     ALL_T(KC_TAB)  // Tap for Tab, hold for Hyper (Super+Ctrl+Alt+Shift)
#define CTL_QUOT		CTL_T(KC_QUOT)
#define OS_LEFT     ALT_T(KC_LEFT)

/* Qwerty
 *  ,-----------------------------------------------------------------------------------.
 *  | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | Bksp |
 *  |------+------+------+------+------+-------------+------+------+------+------+------|
 *  | Esc  |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |  '   |
 *  |------+------+------+------+------+------|------+------+------+------+------+------|
 *  | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  | Enter|
 *  |------+------+------+------+------+------+------+------+------+------+------+------|
 *  | Caps |      |      |  OS  | Alt  |    Space    |Raise |Lower | Down |  Up  |Right |
 *  `-----------------------------------------------------------------------------------'
 *  Note: Z is NAV layer when held
 *        Esc is LCTRL when held
 */
[_QWERTY] = {
  {KC_TAB,  KC_Q,           KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_BSPC},
  {CTL_ESC, KC_A,           KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT},
  {KC_LSFT, LT(_NAV, KC_Z), KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, SFT_ENT},
  {KC_CAPS, _______,        _______, KC_LGUI, KC_LALT,   KC_SPC, KC_SPC,  RAISE,    LOWER, KC_DOWN, KC_UP,   KC_RGHT}},


/* Lower
 * ,-----------------------------------------------------------------------------------.
 * |   ~  |      |      |      |      |      |      |      |      |      |      |   å  |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      |      |      |   [  |   ]  |   (  |   )  |   {  |   }  |      |   ø  |  æ   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  |  F10 |  F11 |  F12 |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      | Play |
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = {
    {KC_TILD, _______, _______, _______, _______, _______, _______, _______, _______, _______, UNICODE,    UC(0x00E5)},
    {_______, _______, _______, KC_LBRC, KC_RBRC, KC_LPRN, KC_RPRN, KC_LCBR, KC_RCBR, KC_MINS, UC(0x00E6), UC(0x00F8)},
    {KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,     KC_F12},
    {BACKLIT, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,    KC_MPLY}},


/* Raise
 * ,-----------------------------------------------------------------------------------.
 * |   `  |      |      |   (  |   )  |      |      |   -  |   =  |   [  |   ]  | Del  |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |  \   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |   !  |   @  |   #  |   $  |   %  |   ^  |   &  |   *  |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      | Prev | Vol- | Vol+ | Next |
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = {
    {KC_GRV, _______, _______, KC_LPRN, KC_RPRN, _______, _______, KC_MINS, KC_EQL, KC_LBRC, KC_RBRC, KC_DEL},
    {_______,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_BSLS},
    {_______, KC_EXLM, KC_AT,   KC_HASH, KC_DLR,  KC_PERC, KC_CIRC, KC_AMPR, KC_ASTR, _______, KC_VOLU,  _______},
    {_______, _______, _______, _______, _______, _______, _______, _______,  _______, KC_MPRV, KC_VOLD, KC_MNXT}},


/* Adjust (Lower + Raise)
 * ,-----------------------------------------------------------------------------------.
 * |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |      | F10  | F11  |  F12 |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      | Reset|MuMode|Aud on|AudOff|      |      |      |      |      |      |      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |Voice-|Voice+|Mus on|Musoff|      |      |      |      |BRDOWN| BRUP |BRTOG |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_ADJUST] = {
  {AG_NORM, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______},
  {_______, RESET,   MU_MOD,  AU_ON,   AU_OFF,  _______, _______, _______, _______, _______, _______, _______},
  {MUV_DE,  MUV_IN,  MU_ON,   MU_OFF,  _______, _______, _______, _______, _______, _______, BL_BRTG, _______},
  {_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______}},


[_NAV] = {
  {_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______},
  {_______, _______, KC_HOME, KC_PGDN, KC_PGUP, KC_END, KC_LEFT, KC_DOWN, KC_UP, KC_RIGHT, _______, _______},
  {_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______},
  {_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______}},
};



void toggle_unicode_input_mode(void) {
    switch (get_unicode_input_mode()) {
    case UC_LNX:
        set_unicode_input_mode(UC_WINC);
        break;
    case UC_WINC:
        set_unicode_input_mode(UC_LNX);
        break;
    default:
        break;
    }
}


bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case QWERTY:
      if (record->event.pressed) {
        set_single_persistent_default_layer(_QWERTY);
      }
      return false;
      break;
    case LOWER:
      if (record->event.pressed) {
        layer_on(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case BACKLIT:
      if (record->event.pressed) {
        register_code(KC_RSFT);
        #ifdef BACKLIGHT_ENABLE
          backlight_step();
        #endif
      } else {
        unregister_code(KC_RSFT);
      }
      return false;
      break;
  case UNICODE:
      if (record->event.pressed) {
          #ifdef UNICODE_ENABLE
          toggle_unicode_input_mode();
          #endif
      }
      return false;
      break;
  }
  return true;
}


void matrix_init_user(void) {
    set_unicode_input_mode(UC_LNX);
};
