-----------------------------------
-- Mystic Boon
-- Club weapon skill
-- Skill level: N/A
-- Converts damage dealt to own MP. Damage varies with TP. Yagrush: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (White Mage) quest.
-- Damage is significantly affected by Attack. Verification Needed
-- Not aligned with any "elemental gorgets" or elemental belts due to it's absence of Skillchain properties.
-- Element: None
-- Modifiers: STR:30% ; MND:70%
-- 100%TP    200%TP    300%TP
-- 2.5        4.0        7.0
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID, tp, primary)

    local params = {};
    params.numHits = 1;
    params.ftp100 = 1; params.ftp200 = 1.5; params.ftp300 = 2;
    params.str_wsc = 0.3; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.5; params.chr_wsc = 0.0;
    params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
    params.canCrit = false;
    params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
    params.atkmulti = 1;

    if (USE_ADOULIN_WEAPON_SKILL_CHANGES == true) then
        params.ftp100 = 2.5; params.ftp200 = 4; params.ftp300 = 7;
        params.str_wsc = 0.3; params.mnd_wsc = 0.7;
    end

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, primary);

    -- Todo: MOD_AFTERMATH instead of Item ID checks in all these..
    if ((player:getEquipID(SLOT_MAIN) == 18993) and (player:getMainJob() == JOB_WHM)) then
        if (damage > 0) then
            -- AFTERMATH LV1
            if ((tp >= 100) and (tp <= 110)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 10, 0, 180, 0, 2);
            elseif ((tp >= 111) and (tp <= 120)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 11, 0, 180, 0, 2);
            elseif ((tp >= 121) and (tp <= 130)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 12, 0, 180, 0, 2);
            elseif ((tp >= 131) and (tp <= 140)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 13, 0, 180, 0, 2);
            elseif ((tp >= 141) and (tp <= 150)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 14, 0, 180, 0, 2);
            elseif ((tp >= 151) and (tp <= 160)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 15, 0, 180, 0, 2);
            elseif ((tp >= 161) and (tp <= 170)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 16, 0, 180, 0, 2);
            elseif ((tp >= 171) and (tp <= 180)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 17, 0, 180, 0, 2);
            elseif ((tp >= 181) and (tp <= 190)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 18, 0, 180, 0, 2);
            elseif ((tp >= 191) and (tp <= 199)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV1, 19, 0, 180, 0, 2);

            -- AFTERMATH LV2
            elseif ((tp >= 200) and (tp <= 210)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 24, 0, 180, 0, 2);
            elseif ((tp >= 211) and (tp <= 219)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 28, 0, 180, 0, 2);
            elseif ((tp >= 221) and (tp <= 229)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 32, 0, 180, 0, 2);
            elseif ((tp >= 231) and (tp <= 239)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 36, 0, 180, 0, 2);
            elseif ((tp >= 241) and (tp <= 249)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 40, 0, 180, 0, 2);
            elseif ((tp >= 251) and (tp <= 259)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 44, 0, 180, 0, 2);
            elseif ((tp >= 261) and (tp <= 269)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 48, 0, 180, 0, 2);
            elseif ((tp >= 271) and (tp <= 279)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 52, 0, 180, 0, 2);
            elseif ((tp >= 281) and (tp <= 289)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 56, 0, 180, 0, 2);
            elseif ((tp >= 291) and (tp <= 299)) then
                    player:addStatusEffect(EFFECT_AFTERMATH_LV2, 59, 0, 180, 0, 2);

            -- AFTERMATH LV3
            elseif ((tp == 300)) then
                player:addStatusEffect(EFFECT_AFTERMATH_LV3, 45, 0, 120, 0, 1);
            end
        end
    end

    player:addMP(damage);
    return tpHits, extraHits, criticalHit, damage;
end
