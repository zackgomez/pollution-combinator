100 pollution combinators in the same chunk

== store entities, fetch controls

.04 just iteration (with entity.valid check)

.09 just create signal

.29 just get control

.34 get control and create signal

.45 all in - get control, create signal, set signal



== store control

.15 all in!!

.11 only create a single signal

.11 only create a single signal and modify it

.35 also access control.entity

.41 also access control.entity.position


== store entry with control, entity, pos

.13 all in, including accessing position and entity

.17 also touch entity.valid

.37 also touch entity.surface

.43 set output to surface.get_pollution

.23 also store surface (with short circuit)

.20 no surface short circuit

reran short circuit/no short circuit a couple of times- no real difference -- take these numbers with a grain of salt or a bit of leeway