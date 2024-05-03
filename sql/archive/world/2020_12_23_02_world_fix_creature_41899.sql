-- non attackable_1 & immunce to pc (player) & no select
update creature_template set unit_flags=33557378 where entry=41899;
-- non attackable_2
update creature_template set unit_flags2=65536 where entry=41899;
-- 0
update creature_template set unit_flags3=0 where entry=41899;