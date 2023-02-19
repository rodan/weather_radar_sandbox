/* heatmap - High performance heatmap creation in C.
 *
 * The MIT License (MIT)
 *
 * Copyright (c) 2013 Lucas Beyer
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include "heatmap.h"
#include "colorschemes/gray.h"

static const unsigned char b2w_data[] = {
    0, 0, 0, 0, 0, 0, 0, 255, 1, 1, 1, 255, 2, 2, 2, 255, 3, 3, 3, 255, 4, 4, 4, 255, 5, 5, 5, 255, 6, 6, 6, 255, 7, 7, 7, 255, 8, 8, 8, 255, 9, 9, 9, 255, 10, 10, 10, 255, 11, 11, 11, 255, 12, 12, 12, 255, 13, 13, 13, 255, 14, 14, 14, 255, 15, 15, 15, 255, 16, 16, 16, 255, 17, 17, 17, 255, 18, 18, 18, 255, 19, 19, 19, 255, 20, 20, 20, 255, 21, 21, 21, 255, 22, 22, 22, 255, 23, 23, 23, 255, 24, 24, 24, 255, 25, 25, 25, 255, 26, 26, 26, 255, 27, 27, 27, 255, 28, 28, 28, 255, 29, 29, 29, 255, 30, 30, 30, 255, 31, 31, 31, 255, 32, 32, 32, 255, 33, 33, 33, 255, 34, 34, 34, 255, 35, 35, 35, 255, 36, 36, 36, 255, 37, 37, 37, 255, 38, 38, 38, 255, 39, 39, 39, 255, 40, 40, 40, 255, 41, 41, 41, 255, 42, 42, 42, 255, 43, 43, 43, 255, 44, 44, 44, 255, 45, 45, 45, 255, 46, 46, 46, 255, 47, 47, 47, 255, 48, 48, 48, 255, 49, 49, 49, 255, 50, 50, 50, 255, 51, 51, 51, 255, 52, 52, 52, 255, 53, 53, 53, 255, 54, 54, 54, 255, 55, 55, 55, 255, 56, 56, 56, 255, 57, 57, 57, 255, 58, 58, 58, 255, 59, 59, 59, 255, 60, 60, 60, 255, 61, 61, 61, 255, 62, 62, 62, 255, 63, 63, 63, 255, 64, 64, 64, 255, 65, 65, 65, 255, 66, 66, 66, 255, 67, 67, 67, 255, 68, 68, 68, 255, 69, 69, 69, 255, 70, 70, 70, 255, 71, 71, 71, 255, 72, 72, 72, 255, 73, 73, 73, 255, 74, 74, 74, 255, 75, 75, 75, 255, 76, 76, 76, 255, 77, 77, 77, 255, 78, 78, 78, 255, 79, 79, 79, 255, 80, 80, 80, 255, 81, 81, 81, 255, 82, 82, 82, 255, 83, 83, 83, 255, 84, 84, 84, 255, 85, 85, 85, 255, 86, 86, 86, 255, 87, 87, 87, 255, 88, 88, 88, 255, 89, 89, 89, 255, 90, 90, 90, 255, 91, 91, 91, 255, 92, 92, 92, 255, 93, 93, 93, 255, 94, 94, 94, 255, 95, 95, 95, 255, 96, 96, 96, 255, 97, 97, 97, 255, 98, 98, 98, 255, 99, 99, 99, 255, 100, 100, 100, 255, 101, 101, 101, 255, 102, 102, 102, 255, 103, 103, 103, 255, 104, 104, 104, 255, 105, 105, 105, 255, 106, 106, 106, 255, 107, 107, 107, 255, 108, 108, 108, 255, 109, 109, 109, 255, 110, 110, 110, 255, 111, 111, 111, 255, 112, 112, 112, 255, 113, 113, 113, 255, 114, 114, 114, 255, 115, 115, 115, 255, 116, 116, 116, 255, 117, 117, 117, 255, 118, 118, 118, 255, 119, 119, 119, 255, 120, 120, 120, 255, 121, 121, 121, 255, 122, 122, 122, 255, 123, 123, 123, 255, 124, 124, 124, 255, 125, 125, 125, 255, 126, 126, 126, 255, 127, 127, 127, 255, 128, 128, 128, 255, 129, 129, 129, 255, 130, 130, 130, 255, 131, 131, 131, 255, 132, 132, 132, 255, 133, 133, 133, 255, 134, 134, 134, 255, 135, 135, 135, 255, 136, 136, 136, 255, 137, 137, 137, 255, 138, 138, 138, 255, 139, 139, 139, 255, 140, 140, 140, 255, 141, 141, 141, 255, 142, 142, 142, 255, 143, 143, 143, 255, 144, 144, 144, 255, 145, 145, 145, 255, 146, 146, 146, 255, 147, 147, 147, 255, 148, 148, 148, 255, 149, 149, 149, 255, 150, 150, 150, 255, 151, 151, 151, 255, 152, 152, 152, 255, 153, 153, 153, 255, 154, 154, 154, 255, 155, 155, 155, 255, 156, 156, 156, 255, 157, 157, 157, 255, 158, 158, 158, 255, 159, 159, 159, 255, 160, 160, 160, 255, 161, 161, 161, 255, 162, 162, 162, 255, 163, 163, 163, 255, 164, 164, 164, 255, 165, 165, 165, 255, 166, 166, 166, 255, 167, 167, 167, 255, 168, 168, 168, 255, 169, 169, 169, 255, 170, 170, 170, 255, 171, 171, 171, 255, 172, 172, 172, 255, 173, 173, 173, 255, 174, 174, 174, 255, 175, 175, 175, 255, 176, 176, 176, 255, 177, 177, 177, 255, 178, 178, 178, 255, 179, 179, 179, 255, 180, 180, 180, 255, 181, 181, 181, 255, 182, 182, 182, 255, 183, 183, 183, 255, 184, 184, 184, 255, 185, 185, 185, 255, 186, 186, 186, 255, 187, 187, 187, 255, 188, 188, 188, 255, 189, 189, 189, 255, 190, 190, 190, 255, 191, 191, 191, 255, 192, 192, 192, 255, 193, 193, 193, 255, 194, 194, 194, 255, 195, 195, 195, 255, 196, 196, 196, 255, 197, 197, 197, 255, 198, 198, 198, 255, 199, 199, 199, 255, 200, 200, 200, 255, 201, 201, 201, 255, 202, 202, 202, 255, 203, 203, 203, 255, 204, 204, 204, 255, 205, 205, 205, 255, 206, 206, 206, 255, 207, 207, 207, 255, 208, 208, 208, 255, 209, 209, 209, 255, 210, 210, 210, 255, 211, 211, 211, 255, 212, 212, 212, 255, 213, 213, 213, 255, 214, 214, 214, 255, 215, 215, 215, 255, 216, 216, 216, 255, 217, 217, 217, 255, 218, 218, 218, 255, 219, 219, 219, 255, 220, 220, 220, 255, 221, 221, 221, 255, 222, 222, 222, 255, 223, 223, 223, 255, 224, 224, 224, 255, 225, 225, 225, 255, 226, 226, 226, 255, 227, 227, 227, 255, 228, 228, 228, 255, 229, 229, 229, 255, 230, 230, 230, 255, 231, 231, 231, 255, 232, 232, 232, 255, 233, 233, 233, 255, 234, 234, 234, 255, 235, 235, 235, 255, 236, 236, 236, 255, 237, 237, 237, 255, 238, 238, 238, 255, 239, 239, 239, 255, 240, 240, 240, 255, 241, 241, 241, 255, 242, 242, 242, 255, 243, 243, 243, 255, 244, 244, 244, 255, 245, 245, 245, 255, 246, 246, 246, 255, 247, 247, 247, 255, 248, 248, 248, 255, 249, 249, 249, 255, 250, 250, 250, 255, 251, 251, 251, 255, 252, 252, 252, 255, 253, 253, 253, 255, 254, 254, 254, 255, 255, 255, 255, 255,
};
static const heatmap_colorscheme_t b2w = { b2w_data, sizeof(b2w_data)/sizeof(b2w_data[0])/4, CT_RGBA, 8};
const heatmap_colorscheme_t* heatmap_cs_b2w = &b2w;

static const unsigned char b2w_o_data[] = {
    0, 0, 0, 255, 1, 1, 1, 255, 2, 2, 2, 255, 3, 3, 3, 255, 4, 4, 4, 255, 5, 5, 5, 255, 6, 6, 6, 255, 7, 7, 7, 255, 8, 8, 8, 255, 9, 9, 9, 255, 10, 10, 10, 255, 11, 11, 11, 255, 12, 12, 12, 255, 13, 13, 13, 255, 14, 14, 14, 255, 15, 15, 15, 255, 16, 16, 16, 255, 17, 17, 17, 255, 18, 18, 18, 255, 19, 19, 19, 255, 20, 20, 20, 255, 21, 21, 21, 255, 22, 22, 22, 255, 23, 23, 23, 255, 24, 24, 24, 255, 25, 25, 25, 255, 26, 26, 26, 255, 27, 27, 27, 255, 28, 28, 28, 255, 29, 29, 29, 255, 30, 30, 30, 255, 31, 31, 31, 255, 32, 32, 32, 255, 33, 33, 33, 255, 34, 34, 34, 255, 35, 35, 35, 255, 36, 36, 36, 255, 37, 37, 37, 255, 38, 38, 38, 255, 39, 39, 39, 255, 40, 40, 40, 255, 41, 41, 41, 255, 42, 42, 42, 255, 43, 43, 43, 255, 44, 44, 44, 255, 45, 45, 45, 255, 46, 46, 46, 255, 47, 47, 47, 255, 48, 48, 48, 255, 49, 49, 49, 255, 50, 50, 50, 255, 51, 51, 51, 255, 52, 52, 52, 255, 53, 53, 53, 255, 54, 54, 54, 255, 55, 55, 55, 255, 56, 56, 56, 255, 57, 57, 57, 255, 58, 58, 58, 255, 59, 59, 59, 255, 60, 60, 60, 255, 61, 61, 61, 255, 62, 62, 62, 255, 63, 63, 63, 255, 64, 64, 64, 255, 65, 65, 65, 255, 66, 66, 66, 255, 67, 67, 67, 255, 68, 68, 68, 255, 69, 69, 69, 255, 70, 70, 70, 255, 71, 71, 71, 255, 72, 72, 72, 255, 73, 73, 73, 255, 74, 74, 74, 255, 75, 75, 75, 255, 76, 76, 76, 255, 77, 77, 77, 255, 78, 78, 78, 255, 79, 79, 79, 255, 80, 80, 80, 255, 81, 81, 81, 255, 82, 82, 82, 255, 83, 83, 83, 255, 84, 84, 84, 255, 85, 85, 85, 255, 86, 86, 86, 255, 87, 87, 87, 255, 88, 88, 88, 255, 89, 89, 89, 255, 90, 90, 90, 255, 91, 91, 91, 255, 92, 92, 92, 255, 93, 93, 93, 255, 94, 94, 94, 255, 95, 95, 95, 255, 96, 96, 96, 255, 97, 97, 97, 255, 98, 98, 98, 255, 99, 99, 99, 255, 100, 100, 100, 255, 101, 101, 101, 255, 102, 102, 102, 255, 103, 103, 103, 255, 104, 104, 104, 255, 105, 105, 105, 255, 106, 106, 106, 255, 107, 107, 107, 255, 108, 108, 108, 255, 109, 109, 109, 255, 110, 110, 110, 255, 111, 111, 111, 255, 112, 112, 112, 255, 113, 113, 113, 255, 114, 114, 114, 255, 115, 115, 115, 255, 116, 116, 116, 255, 117, 117, 117, 255, 118, 118, 118, 255, 119, 119, 119, 255, 120, 120, 120, 255, 121, 121, 121, 255, 122, 122, 122, 255, 123, 123, 123, 255, 124, 124, 124, 255, 125, 125, 125, 255, 126, 126, 126, 255, 127, 127, 127, 255, 128, 128, 128, 255, 129, 129, 129, 255, 130, 130, 130, 255, 131, 131, 131, 255, 132, 132, 132, 255, 133, 133, 133, 255, 134, 134, 134, 255, 135, 135, 135, 255, 136, 136, 136, 255, 137, 137, 137, 255, 138, 138, 138, 255, 139, 139, 139, 255, 140, 140, 140, 255, 141, 141, 141, 255, 142, 142, 142, 255, 143, 143, 143, 255, 144, 144, 144, 255, 145, 145, 145, 255, 146, 146, 146, 255, 147, 147, 147, 255, 148, 148, 148, 255, 149, 149, 149, 255, 150, 150, 150, 255, 151, 151, 151, 255, 152, 152, 152, 255, 153, 153, 153, 255, 154, 154, 154, 255, 155, 155, 155, 255, 156, 156, 156, 255, 157, 157, 157, 255, 158, 158, 158, 255, 159, 159, 159, 255, 160, 160, 160, 255, 161, 161, 161, 255, 162, 162, 162, 255, 163, 163, 163, 255, 164, 164, 164, 255, 165, 165, 165, 255, 166, 166, 166, 255, 167, 167, 167, 255, 168, 168, 168, 255, 169, 169, 169, 255, 170, 170, 170, 255, 171, 171, 171, 255, 172, 172, 172, 255, 173, 173, 173, 255, 174, 174, 174, 255, 175, 175, 175, 255, 176, 176, 176, 255, 177, 177, 177, 255, 178, 178, 178, 255, 179, 179, 179, 255, 180, 180, 180, 255, 181, 181, 181, 255, 182, 182, 182, 255, 183, 183, 183, 255, 184, 184, 184, 255, 185, 185, 185, 255, 186, 186, 186, 255, 187, 187, 187, 255, 188, 188, 188, 255, 189, 189, 189, 255, 190, 190, 190, 255, 191, 191, 191, 255, 192, 192, 192, 255, 193, 193, 193, 255, 194, 194, 194, 255, 195, 195, 195, 255, 196, 196, 196, 255, 197, 197, 197, 255, 198, 198, 198, 255, 199, 199, 199, 255, 200, 200, 200, 255, 201, 201, 201, 255, 202, 202, 202, 255, 203, 203, 203, 255, 204, 204, 204, 255, 205, 205, 205, 255, 206, 206, 206, 255, 207, 207, 207, 255, 208, 208, 208, 255, 209, 209, 209, 255, 210, 210, 210, 255, 211, 211, 211, 255, 212, 212, 212, 255, 213, 213, 213, 255, 214, 214, 214, 255, 215, 215, 215, 255, 216, 216, 216, 255, 217, 217, 217, 255, 218, 218, 218, 255, 219, 219, 219, 255, 220, 220, 220, 255, 221, 221, 221, 255, 222, 222, 222, 255, 223, 223, 223, 255, 224, 224, 224, 255, 225, 225, 225, 255, 226, 226, 226, 255, 227, 227, 227, 255, 228, 228, 228, 255, 229, 229, 229, 255, 230, 230, 230, 255, 231, 231, 231, 255, 232, 232, 232, 255, 233, 233, 233, 255, 234, 234, 234, 255, 235, 235, 235, 255, 236, 236, 236, 255, 237, 237, 237, 255, 238, 238, 238, 255, 239, 239, 239, 255, 240, 240, 240, 255, 241, 241, 241, 255, 242, 242, 242, 255, 243, 243, 243, 255, 244, 244, 244, 255, 245, 245, 245, 255, 246, 246, 246, 255, 247, 247, 247, 255, 248, 248, 248, 255, 249, 249, 249, 255, 250, 250, 250, 255, 251, 251, 251, 255, 252, 252, 252, 255, 253, 253, 253, 255, 254, 254, 254, 255, 255, 255, 255, 255,
};
static const heatmap_colorscheme_t b2w_o = { b2w_o_data, sizeof(b2w_o_data)/sizeof(b2w_o_data[0])/4, CT_RGBA, 8};
const heatmap_colorscheme_t* heatmap_cs_b2w_opaque = &b2w_o;

static const unsigned char w2b_data[] = {
    255, 255, 255, 0, 255, 255, 255, 255, 254, 254, 254, 255, 253, 253, 253, 255, 252, 252, 252, 255, 251, 251, 251, 255, 250, 250, 250, 255, 249, 249, 249, 255, 248, 248, 248, 255, 247, 247, 247, 255, 246, 246, 246, 255, 245, 245, 245, 255, 244, 244, 244, 255, 243, 243, 243, 255, 242, 242, 242, 255, 241, 241, 241, 255, 240, 240, 240, 255, 239, 239, 239, 255, 238, 238, 238, 255, 237, 237, 237, 255, 236, 236, 236, 255, 235, 235, 235, 255, 234, 234, 234, 255, 233, 233, 233, 255, 232, 232, 232, 255, 231, 231, 231, 255, 230, 230, 230, 255, 229, 229, 229, 255, 228, 228, 228, 255, 227, 227, 227, 255, 226, 226, 226, 255, 225, 225, 225, 255, 224, 224, 224, 255, 223, 223, 223, 255, 222, 222, 222, 255, 221, 221, 221, 255, 220, 220, 220, 255, 219, 219, 219, 255, 218, 218, 218, 255, 217, 217, 217, 255, 216, 216, 216, 255, 215, 215, 215, 255, 214, 214, 214, 255, 213, 213, 213, 255, 212, 212, 212, 255, 211, 211, 211, 255, 210, 210, 210, 255, 209, 209, 209, 255, 208, 208, 208, 255, 207, 207, 207, 255, 206, 206, 206, 255, 205, 205, 205, 255, 204, 204, 204, 255, 203, 203, 203, 255, 202, 202, 202, 255, 201, 201, 201, 255, 200, 200, 200, 255, 199, 199, 199, 255, 198, 198, 198, 255, 197, 197, 197, 255, 196, 196, 196, 255, 195, 195, 195, 255, 194, 194, 194, 255, 193, 193, 193, 255, 192, 192, 192, 255, 191, 191, 191, 255, 190, 190, 190, 255, 189, 189, 189, 255, 188, 188, 188, 255, 187, 187, 187, 255, 186, 186, 186, 255, 185, 185, 185, 255, 184, 184, 184, 255, 183, 183, 183, 255, 182, 182, 182, 255, 181, 181, 181, 255, 180, 180, 180, 255, 179, 179, 179, 255, 178, 178, 178, 255, 177, 177, 177, 255, 176, 176, 176, 255, 175, 175, 175, 255, 174, 174, 174, 255, 173, 173, 173, 255, 172, 172, 172, 255, 171, 171, 171, 255, 170, 170, 170, 255, 169, 169, 169, 255, 168, 168, 168, 255, 167, 167, 167, 255, 166, 166, 166, 255, 165, 165, 165, 255, 164, 164, 164, 255, 163, 163, 163, 255, 162, 162, 162, 255, 161, 161, 161, 255, 160, 160, 160, 255, 159, 159, 159, 255, 158, 158, 158, 255, 157, 157, 157, 255, 156, 156, 156, 255, 155, 155, 155, 255, 154, 154, 154, 255, 153, 153, 153, 255, 152, 152, 152, 255, 151, 151, 151, 255, 150, 150, 150, 255, 149, 149, 149, 255, 148, 148, 148, 255, 147, 147, 147, 255, 146, 146, 146, 255, 145, 145, 145, 255, 144, 144, 144, 255, 143, 143, 143, 255, 142, 142, 142, 255, 141, 141, 141, 255, 140, 140, 140, 255, 139, 139, 139, 255, 138, 138, 138, 255, 137, 137, 137, 255, 136, 136, 136, 255, 135, 135, 135, 255, 134, 134, 134, 255, 133, 133, 133, 255, 132, 132, 132, 255, 131, 131, 131, 255, 130, 130, 130, 255, 129, 129, 129, 255, 128, 128, 128, 255, 127, 127, 127, 255, 126, 126, 126, 255, 125, 125, 125, 255, 124, 124, 124, 255, 123, 123, 123, 255, 122, 122, 122, 255, 121, 121, 121, 255, 120, 120, 120, 255, 119, 119, 119, 255, 118, 118, 118, 255, 117, 117, 117, 255, 116, 116, 116, 255, 115, 115, 115, 255, 114, 114, 114, 255, 113, 113, 113, 255, 112, 112, 112, 255, 111, 111, 111, 255, 110, 110, 110, 255, 109, 109, 109, 255, 108, 108, 108, 255, 107, 107, 107, 255, 106, 106, 106, 255, 105, 105, 105, 255, 104, 104, 104, 255, 103, 103, 103, 255, 102, 102, 102, 255, 101, 101, 101, 255, 100, 100, 100, 255, 99, 99, 99, 255, 98, 98, 98, 255, 97, 97, 97, 255, 96, 96, 96, 255, 95, 95, 95, 255, 94, 94, 94, 255, 93, 93, 93, 255, 92, 92, 92, 255, 91, 91, 91, 255, 90, 90, 90, 255, 89, 89, 89, 255, 88, 88, 88, 255, 87, 87, 87, 255, 86, 86, 86, 255, 85, 85, 85, 255, 84, 84, 84, 255, 83, 83, 83, 255, 82, 82, 82, 255, 81, 81, 81, 255, 80, 80, 80, 255, 79, 79, 79, 255, 78, 78, 78, 255, 77, 77, 77, 255, 76, 76, 76, 255, 75, 75, 75, 255, 74, 74, 74, 255, 73, 73, 73, 255, 72, 72, 72, 255, 71, 71, 71, 255, 70, 70, 70, 255, 69, 69, 69, 255, 68, 68, 68, 255, 67, 67, 67, 255, 66, 66, 66, 255, 65, 65, 65, 255, 64, 64, 64, 255, 63, 63, 63, 255, 62, 62, 62, 255, 61, 61, 61, 255, 60, 60, 60, 255, 59, 59, 59, 255, 58, 58, 58, 255, 57, 57, 57, 255, 56, 56, 56, 255, 55, 55, 55, 255, 54, 54, 54, 255, 53, 53, 53, 255, 52, 52, 52, 255, 51, 51, 51, 255, 50, 50, 50, 255, 49, 49, 49, 255, 48, 48, 48, 255, 47, 47, 47, 255, 46, 46, 46, 255, 45, 45, 45, 255, 44, 44, 44, 255, 43, 43, 43, 255, 42, 42, 42, 255, 41, 41, 41, 255, 40, 40, 40, 255, 39, 39, 39, 255, 38, 38, 38, 255, 37, 37, 37, 255, 36, 36, 36, 255, 35, 35, 35, 255, 34, 34, 34, 255, 33, 33, 33, 255, 32, 32, 32, 255, 31, 31, 31, 255, 30, 30, 30, 255, 29, 29, 29, 255, 28, 28, 28, 255, 27, 27, 27, 255, 26, 26, 26, 255, 25, 25, 25, 255, 24, 24, 24, 255, 23, 23, 23, 255, 22, 22, 22, 255, 21, 21, 21, 255, 20, 20, 20, 255, 19, 19, 19, 255, 18, 18, 18, 255, 17, 17, 17, 255, 16, 16, 16, 255, 15, 15, 15, 255, 14, 14, 14, 255, 13, 13, 13, 255, 12, 12, 12, 255, 11, 11, 11, 255, 10, 10, 10, 255, 9, 9, 9, 255, 8, 8, 8, 255, 7, 7, 7, 255, 6, 6, 6, 255, 5, 5, 5, 255, 4, 4, 4, 255, 3, 3, 3, 255, 2, 2, 2, 255, 1, 1, 1, 255, 0, 0, 0, 255,
};
static const heatmap_colorscheme_t w2b = { w2b_data, sizeof(w2b_data)/sizeof(w2b_data[0])/4, CT_RGBA, 8};
const heatmap_colorscheme_t* heatmap_cs_w2b = &w2b;

static const unsigned char w2b_o_data[] = {
    255, 255, 255, 255, 254, 254, 254, 255, 253, 253, 253, 255, 252, 252, 252, 255, 251, 251, 251, 255, 250, 250, 250, 255, 249, 249, 249, 255, 248, 248, 248, 255, 247, 247, 247, 255, 246, 246, 246, 255, 245, 245, 245, 255, 244, 244, 244, 255, 243, 243, 243, 255, 242, 242, 242, 255, 241, 241, 241, 255, 240, 240, 240, 255, 239, 239, 239, 255, 238, 238, 238, 255, 237, 237, 237, 255, 236, 236, 236, 255, 235, 235, 235, 255, 234, 234, 234, 255, 233, 233, 233, 255, 232, 232, 232, 255, 231, 231, 231, 255, 230, 230, 230, 255, 229, 229, 229, 255, 228, 228, 228, 255, 227, 227, 227, 255, 226, 226, 226, 255, 225, 225, 225, 255, 224, 224, 224, 255, 223, 223, 223, 255, 222, 222, 222, 255, 221, 221, 221, 255, 220, 220, 220, 255, 219, 219, 219, 255, 218, 218, 218, 255, 217, 217, 217, 255, 216, 216, 216, 255, 215, 215, 215, 255, 214, 214, 214, 255, 213, 213, 213, 255, 212, 212, 212, 255, 211, 211, 211, 255, 210, 210, 210, 255, 209, 209, 209, 255, 208, 208, 208, 255, 207, 207, 207, 255, 206, 206, 206, 255, 205, 205, 205, 255, 204, 204, 204, 255, 203, 203, 203, 255, 202, 202, 202, 255, 201, 201, 201, 255, 200, 200, 200, 255, 199, 199, 199, 255, 198, 198, 198, 255, 197, 197, 197, 255, 196, 196, 196, 255, 195, 195, 195, 255, 194, 194, 194, 255, 193, 193, 193, 255, 192, 192, 192, 255, 191, 191, 191, 255, 190, 190, 190, 255, 189, 189, 189, 255, 188, 188, 188, 255, 187, 187, 187, 255, 186, 186, 186, 255, 185, 185, 185, 255, 184, 184, 184, 255, 183, 183, 183, 255, 182, 182, 182, 255, 181, 181, 181, 255, 180, 180, 180, 255, 179, 179, 179, 255, 178, 178, 178, 255, 177, 177, 177, 255, 176, 176, 176, 255, 175, 175, 175, 255, 174, 174, 174, 255, 173, 173, 173, 255, 172, 172, 172, 255, 171, 171, 171, 255, 170, 170, 170, 255, 169, 169, 169, 255, 168, 168, 168, 255, 167, 167, 167, 255, 166, 166, 166, 255, 165, 165, 165, 255, 164, 164, 164, 255, 163, 163, 163, 255, 162, 162, 162, 255, 161, 161, 161, 255, 160, 160, 160, 255, 159, 159, 159, 255, 158, 158, 158, 255, 157, 157, 157, 255, 156, 156, 156, 255, 155, 155, 155, 255, 154, 154, 154, 255, 153, 153, 153, 255, 152, 152, 152, 255, 151, 151, 151, 255, 150, 150, 150, 255, 149, 149, 149, 255, 148, 148, 148, 255, 147, 147, 147, 255, 146, 146, 146, 255, 145, 145, 145, 255, 144, 144, 144, 255, 143, 143, 143, 255, 142, 142, 142, 255, 141, 141, 141, 255, 140, 140, 140, 255, 139, 139, 139, 255, 138, 138, 138, 255, 137, 137, 137, 255, 136, 136, 136, 255, 135, 135, 135, 255, 134, 134, 134, 255, 133, 133, 133, 255, 132, 132, 132, 255, 131, 131, 131, 255, 130, 130, 130, 255, 129, 129, 129, 255, 128, 128, 128, 255, 127, 127, 127, 255, 126, 126, 126, 255, 125, 125, 125, 255, 124, 124, 124, 255, 123, 123, 123, 255, 122, 122, 122, 255, 121, 121, 121, 255, 120, 120, 120, 255, 119, 119, 119, 255, 118, 118, 118, 255, 117, 117, 117, 255, 116, 116, 116, 255, 115, 115, 115, 255, 114, 114, 114, 255, 113, 113, 113, 255, 112, 112, 112, 255, 111, 111, 111, 255, 110, 110, 110, 255, 109, 109, 109, 255, 108, 108, 108, 255, 107, 107, 107, 255, 106, 106, 106, 255, 105, 105, 105, 255, 104, 104, 104, 255, 103, 103, 103, 255, 102, 102, 102, 255, 101, 101, 101, 255, 100, 100, 100, 255, 99, 99, 99, 255, 98, 98, 98, 255, 97, 97, 97, 255, 96, 96, 96, 255, 95, 95, 95, 255, 94, 94, 94, 255, 93, 93, 93, 255, 92, 92, 92, 255, 91, 91, 91, 255, 90, 90, 90, 255, 89, 89, 89, 255, 88, 88, 88, 255, 87, 87, 87, 255, 86, 86, 86, 255, 85, 85, 85, 255, 84, 84, 84, 255, 83, 83, 83, 255, 82, 82, 82, 255, 81, 81, 81, 255, 80, 80, 80, 255, 79, 79, 79, 255, 78, 78, 78, 255, 77, 77, 77, 255, 76, 76, 76, 255, 75, 75, 75, 255, 74, 74, 74, 255, 73, 73, 73, 255, 72, 72, 72, 255, 71, 71, 71, 255, 70, 70, 70, 255, 69, 69, 69, 255, 68, 68, 68, 255, 67, 67, 67, 255, 66, 66, 66, 255, 65, 65, 65, 255, 64, 64, 64, 255, 63, 63, 63, 255, 62, 62, 62, 255, 61, 61, 61, 255, 60, 60, 60, 255, 59, 59, 59, 255, 58, 58, 58, 255, 57, 57, 57, 255, 56, 56, 56, 255, 55, 55, 55, 255, 54, 54, 54, 255, 53, 53, 53, 255, 52, 52, 52, 255, 51, 51, 51, 255, 50, 50, 50, 255, 49, 49, 49, 255, 48, 48, 48, 255, 47, 47, 47, 255, 46, 46, 46, 255, 45, 45, 45, 255, 44, 44, 44, 255, 43, 43, 43, 255, 42, 42, 42, 255, 41, 41, 41, 255, 40, 40, 40, 255, 39, 39, 39, 255, 38, 38, 38, 255, 37, 37, 37, 255, 36, 36, 36, 255, 35, 35, 35, 255, 34, 34, 34, 255, 33, 33, 33, 255, 32, 32, 32, 255, 31, 31, 31, 255, 30, 30, 30, 255, 29, 29, 29, 255, 28, 28, 28, 255, 27, 27, 27, 255, 26, 26, 26, 255, 25, 25, 25, 255, 24, 24, 24, 255, 23, 23, 23, 255, 22, 22, 22, 255, 21, 21, 21, 255, 20, 20, 20, 255, 19, 19, 19, 255, 18, 18, 18, 255, 17, 17, 17, 255, 16, 16, 16, 255, 15, 15, 15, 255, 14, 14, 14, 255, 13, 13, 13, 255, 12, 12, 12, 255, 11, 11, 11, 255, 10, 10, 10, 255, 9, 9, 9, 255, 8, 8, 8, 255, 7, 7, 7, 255, 6, 6, 6, 255, 5, 5, 5, 255, 4, 4, 4, 255, 3, 3, 3, 255, 2, 2, 2, 255, 1, 1, 1, 255, 0, 0, 0, 255,
};
static const heatmap_colorscheme_t w2b_o = { w2b_o_data, sizeof(w2b_o_data)/sizeof(w2b_o_data[0])/4, CT_RGBA, 8};
const heatmap_colorscheme_t* heatmap_cs_w2b_opaque = &w2b_o;

