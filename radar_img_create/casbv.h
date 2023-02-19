
#ifndef _HEATMAP_COLORSCHEMES_CASVB_H
#define _HEATMAP_COLORSCHEMES_CASVB_H

#ifdef __cplusplus
extern "C" {
#endif

/* This one has only N discrete colors. */
extern const heatmap_colorscheme_t* heatmap_cs_casbv_discrete;
/* This is a very soft gradient along abovementioned discrete colors. */
extern const heatmap_colorscheme_t* heatmap_cs_casbv_soft;
/* This is a mix of the above two. Makes for a pretty result in many cases. */
extern const heatmap_colorscheme_t* heatmap_cs_casbv_mixed;
/* An exponential version of the default mix of the above two. */
/* Use this if your maximum is very "spiked". */
extern const heatmap_colorscheme_t* heatmap_cs_casbv_mixed_exp;

#ifdef __cplusplus
}
#endif

#endif /* _HEATMAP_COLORSCHEMES_RDYLGN_H */
