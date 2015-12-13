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
            FPalette("P01", cents: [white_c, black_c, red_c, yellow_c, green_c, cyan_c, blue_c, magenta_c]),
            FPalette("P02", cents: [black_c, white_c, yellow_c, cyan_c]),
            FPalette("P03", cents: [black_c, red_c, green_c, blue_c]),
            FPalette("P04", cents: [white_c, black_c, blue_c])
        ]
    }
}
