#if !defined(USING_MAP_DATUM)

	#include "../exodus/exodus_announcements.dm"
	#include "../exodus/exodus_areas.dm"
	#include "../exodus/exodus_effects.dm"
	#include "../exodus/exodus_elevator.dm"
	#include "../exodus/exodus_holodecks.dm"
	#include "../exodus/exodus_presets.dm"
	#include "../exodus/exodus_shuttles.dm"
	#include "../exodus/exodus_jobs.dm"

	#include "../exodus/exodus_unit_testing.dm"
	#include "../exodus/exodus_zas_tests.dm"

	#include "../shared/exodus_torch/_include.dm"


	#include "destruct.dmm"
	#include "../exodus/exodus-3.dmm"


	#define USING_MAP_DATUM /datum/map/destruct

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Chujop

#endif
