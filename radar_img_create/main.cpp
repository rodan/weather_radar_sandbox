
#include <algorithm>
#include <iostream>
#include <iomanip>
#include <random>
#include <vector>
#include <cmath>
#include <array>
#include <time.h>
#include <unistd.h>

#include "lib_convert.h"
#include "lodepng.h"
#include "heatmap.h"
#include "greys.h"
#include "casbv.h"
#include "version.h"

#define    SPIRAL_MAX_CNT  16
//#define  SHOW_POINTS_ONLY  1

#define min(a,b) ((a) < (b) ? (a) : (b))

using namespace std;

struct spiral_conf {
    uint16_t img_w;
    uint16_t img_h;
    uint32_t seed;
};

typedef struct spiral_conf sc_t;

uint16_t spiral(const sc_t *sc, uint16_t *sp_out)
{
    float angle;
    float angle_mult; // between 0.5 and 1
    uint16_t i, j;
    int exp_dist; // spiral expansion distance - between 1 and 100 
    int exp_rate; // spiral expansion rate (1 draws a circle) - between 1 and 180.
    uint16_t points_req;
    uint8_t direction;
    int32_t coord_x, coord_y;
    float rndf;
    uint16_t root_x;
    uint16_t root_y;

    //srand(sc->seed);

    exp_rate = rand()%(sc->img_h/4) + 20;
    exp_dist = rand()%(sc->img_h/7) + 20;
    direction = rand() & 0x1;
    points_req = rand() & 0xf;
    //points_req = 7;
    if (points_req < 5) {
        points_req = 5;
    }

    root_x = 100 + rand()%(sc->img_w - 200);
    root_y = 100 + rand()%(sc->img_h - 200);

    angle_mult = (rand()%500)/1000.0 + 0.5f;
    //angle_mult = 0.7;

    i = 0;
    j = 0;
    while ((i < points_req) && (j < 100)) {
        rndf = rand()%10 / 10.0;
        if (rndf < 0.95f) {
            angle = angle_mult * j;
            if (direction) {
                coord_x = root_x + (exp_dist + exp_rate * angle) * cos(angle);
                coord_y = root_y + (exp_dist + exp_rate * angle) * sin(angle);
            } else {
                coord_x = root_x + (exp_dist + exp_rate * angle) * sin(angle);
                coord_y = root_y + (exp_dist + exp_rate * angle) * cos(angle);
            }
            if ((coord_x > 0) && (coord_y > 0) &&
               (coord_x < sc->img_w) && (coord_y < sc->img_h)) {
                *(sp_out + i*2) = coord_x;
                *(sp_out + i*2+1) = coord_y;
                i++;
            }
        }
        j++;
    }

    return i;
}

void show_usage(void)
{
    fprintf(stdout, "Usage:\n");
    fprintf(stdout, " radar_img_create  -w width  -h height [-r radius] [-s seed]\n");
    exit(EXIT_FAILURE);
}

void show_version(void)
{
    fprintf(stdout, "radar_img_create %d.%d\nbuild %d commit %d\n", VER_MAJOR, VER_MINOR, BUILD, COMMIT);
}

int main(int argc, char* argv[])
{
    uint16_t spiral_arr[SPIRAL_MAX_CNT * 2];
    uint16_t spc = 0; // spiral point count
    uint16_t i, j;
    uint32_t seed_prev = 0;
    uint32_t seed = 0;      // image seed
    uint16_t w = 0;         // image width
    uint16_t h = 0;         // image height
    uint16_t r = 0;         // stamp radius
    sc_t sc;
    int opt;
    uint16_t npoints;


    while ((opt = getopt(argc, argv, "h:w:s:r:v")) != -1) {
        switch (opt) {
        case 's':
            hstr_to_uint32(optarg, &seed, 0, strlen(optarg) - 1, 0, -1);
            break;
        case 'w':
            w = atoi(optarg);
            break;
        case 'h':
            h = atoi(optarg);
            break;
        case 'r':
            r = atoi(optarg);
            break;
        case 'v':
            show_version();
            exit(0);
            break;
        default:
            break;
        }
    }

    if ((w == 0) || (h == 0)) {
        fprintf(stderr, "Invalid arguments!\n");
        show_usage();
    }

    if (r == 0) {
        r = min(w,h)/20;
    }


    //const size_t w = atoi(argv[1]), h = atoi(argv[2]), r = (argc == 4 ? atoi(argv[3]) : min(w,h)/20);

    pair<const heatmap_colorscheme_t*, const char*> schemes[] = {
        make_pair(heatmap_cs_Greys_soft,     "greys_soft_8b.png"),
        make_pair(heatmap_cs_Greys_discrete, "greys_discrete_8b.png"),
        make_pair(heatmap_cs_casbv_discrete, "casbv_discrete_32b.png"),
    };

    // create a heatmap which will be rendered using all colorschemes
    heatmap_t* hm = heatmap_new(w, h);
    heatmap_stamp_t* stamp = heatmap_stamp_gen(r);

    random_device rd;
    mt19937 prng(rd());

    sc.img_w = w;
    sc.img_h = h;
    spc = 0;
    while (spc < 4) {
        if ((seed == 0) || (seed == seed_prev)) {
            seed = time(NULL);
        }
        srand(seed);
        sc.seed = seed;
        //printf("seed 0x%0x, seed_prev 0x%0x\n", seed, seed_prev);
        if (sc.seed != seed_prev) {
            printf("seed 0x%08x\n", sc.seed);
            memset(spiral_arr, 0, SPIRAL_MAX_CNT * 2 * 2);
            spc = spiral(&sc, &spiral_arr[0]);
            seed_prev = sc.seed;
        } else {
            fprintf(stderr, "warning: not enough entropy available, sleeping for 1s\n");
            sleep(2);
        }
        //printf("spc %d\n", spc);
    }

    npoints = rand()%6000 + 500;

    for (i = 0; i < spc; i++) {
        printf("point @ %d %d\n", spiral_arr[i*2], spiral_arr[i*2+1]);
#ifndef SHOW_POINTS_ONLY
        normal_distribution<float> spx(spiral_arr[i*2], 0.11f*w), spy(spiral_arr[i*2+1], 0.11f*h);

        for (j = 0 ; j < npoints; ++j) {
            heatmap_add_point_with_stamp(hm, spx(prng), spy(prng), stamp);
            //heatmap_add_point(hm, spx(prng), spy(prng));
        }
#else
        heatmap_add_point(hm, spiral_arr[i*2], spiral_arr[i*2+1]);
#endif
    }

    // draw the palette to the right
    for(unsigned y = 0 ; y < h ; ++y) {
        for(unsigned x = 0 ; x < min(20UL, w); x++) {
            hm->buf[y*w + w-x - 1] = (h-y)*hm->max/(h-1);
        }
    }

    // render the same heatmap in all color schemes
    vector<unsigned char> image(w*h*4);
    for(auto p : schemes) {
        fprintf(stderr, "rendering %s, color_type %d\n", p.second, p.first->color_type);
        heatmap_render_to(hm, p.first, &image[0]);

        if(unsigned error = lodepng::encode(p.second, image, w, h, (enum LodePNGColorType) p.first->color_type, p.first->bpp)) {
            fprintf(stderr, "encoder error %d: %s\n", error, lodepng_error_text(error));
        }
    }

    heatmap_free(hm);
    return 0;
}
