let white_c   = RGB(1,1,1) // 0
let black_c   = RGB(0,0,0) // 1
let red_c     = RGB(1,0,0) // 2
let yellow_c  = RGB(1,1,0) // 3
let green_c   = RGB(0,1,0) // 4
let cyan_c    = RGB(0,1,1) // 5
let blue_c    = RGB(0,0,1) // 6
let magenta_c = RGB(1,0,1) // 7

class PresetProvider {

	static func defaultFilters() -> [Filter] {
        return [
            FPalette("F000 Neutral", cents: [white_c, black_c, red_c, yellow_c, green_c, cyan_c, blue_c, magenta_c]),
            FPalette("F001 Darken blue", cents: [white_c, black_c, red_c, yellow_c, green_c, cyan_c, RGB(h:2/3,v:0), magenta_c]),
            FPalette("F002 Desat red", cents: [white_c, black_c, RGB(h:0,s:0.5), yellow_c, green_c, cyan_c, blue_c, magenta_c]),
            FPalette("F003 Shift green to red", cents: [white_c, black_c, red_c, yellow_c, red_c, cyan_c, blue_c, magenta_c]),
            FPalette("F004 Blue shadows", cents: [white_c, RGB(h:2/3,v:0.7), red_c, yellow_c, green_c, cyan_c, blue_c, magenta_c]),

            FPalette("F005 Yellow turq", cents: [black_c, white_c, yellow_c, cyan_c]),
            FPalette("F006 RGB", cents: [black_c, red_c, green_c, blue_c]),
            FPalette("F007 wBb", cents: [white_c, black_c, blue_c]),
            FPalette("F008 Shades of red", cents: [white_c, black_c, red_c]),
            FPalette("F009 Singular blue", cents: [cyan_c, blue_c]),
            FPalette("F010 sat blu", cents: [white_c, black_c, red_c, yellow_c, green_c, blue_c, blue_c, blue_c])
        ]
    }
}
