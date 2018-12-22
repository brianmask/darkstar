-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Gigas Torturer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 785, 1, dsp.regime.type.GROUNDS)
end;