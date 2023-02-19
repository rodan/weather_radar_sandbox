
// palette taken from http://meteo.logigestion.ca/radar/radar-CASBV-0.png

#ifdef __cplusplus
extern "C" {
#endif

#include "heatmap.h"
#include "casbv.h"

static const unsigned char discrete_data[] = {
    0, 0, 0, 0, 153, 255, 153, 255, 51, 255, 51, 255, 0, 153, 0, 255, 0, 102, 0, 255, 255, 102, 204, 255, 153, 51, 204, 255, 102, 0, 153, 255, 51, 0, 102, 255
};
static const heatmap_colorscheme_t discrete = { discrete_data, sizeof(discrete_data)/sizeof(discrete_data[0]/4), CT_RGBA, 8};
const heatmap_colorscheme_t* heatmap_cs_casbv_discrete = &discrete;

static const heatmap_colorscheme_t soft = { discrete_data, sizeof(discrete_data)/sizeof(discrete_data[0]/4), CT_RGBA, 8};
const heatmap_colorscheme_t* heatmap_cs_casbv_soft = &soft;

static const heatmap_colorscheme_t mixed = { discrete_data, sizeof(discrete_data)/sizeof(discrete_data[0]/4), CT_RGBA, 8};
const heatmap_colorscheme_t* heatmap_cs_casbv_mixed = &mixed;

static const heatmap_colorscheme_t mixed_exp = { discrete_data, sizeof(discrete_data)/sizeof(discrete_data[0]/4), CT_RGBA, 8};
const heatmap_colorscheme_t* heatmap_cs_casbv_mixed_exp = &mixed_exp;

#ifdef __cplusplus
}
#endif
