vehConfig = {
    blacklist = {
        [GetHashKey("cargoplane")] = true,
        [GetHashKey("jet")] = true,
        [GetHashKey("tug")] = true,
        [GetHashKey("bus")] = true,
        [GetHashKey("bus2")] = true,
        [GetHashKey("bus3")] = true,
        [GetHashKey("airbus")] = true,
        [GetHashKey("dump")] = true,
        [GetHashKey("blimp")] = true,
        [GetHashKey("blimp2")] = true,
        [GetHashKey("blimp3")] = true,
        [GetHashKey("lazer")] = true,
        [GetHashKey("frogger")] = true,
        [GetHashKey("frogger2")] = true,
        [GetHashKey("rhino")] = true,
        [GetHashKey("khanjali")] = true,
        [GetHashKey("volatol")] = true,
        [GetHashKey("thruster")] = true,
        [GetHashKey("titan")] = true,
        [GetHashKey("hydra")] = true,
        [GetHashKey("duster")] = true,
        [GetHashKey("tanker2")] = true,
        [GetHashKey("handler")] = true,
        [GetHashKey("cutter")] = true,
        [GetHashKey("police")] = false,
        [GetHashKey("police2")] = false,
        [GetHashKey("police3")] = false,
        [GetHashKey("policeb")] = true,
        [GetHashKey("tanker")] = true
    }
}

-- This is the time IN MILISECONDS (1000 = 1 second!) for each time it looks to delete everything blocked | Default: 15000 (15 Seconds)
vehConfig.LoopTime = 1000

-- This is the time IN MILISECONDS (1000 = 1 second!) in between each vehicle. | Default: 5 (5ms) DO NOT GO UNDER 1! Do NOT go ABOVE 25! |
vehConfig.TimeBetween = 5