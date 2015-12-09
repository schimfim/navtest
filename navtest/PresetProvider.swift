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
        return [FPalette.init("P01", preset: 0), FPalette.init("P02", preset: 1), FPalette.init("P03", preset: 2), FPalette.init("P04", preset: 3)]
    }
}

let presets = [
    [white_c, black_c, red_c, yellow_c, green_c, cyan_c, blue_c, magenta_c], // full
    [black_c, white_c, yellow_c, cyan_c],
    [black_c, red_c, green_c, blue_c],
    [white_c, black_c, blue_c]
]

