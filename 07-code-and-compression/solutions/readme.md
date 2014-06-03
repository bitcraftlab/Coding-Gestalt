Solutions — Code and Compression 
================================

### [Solution 01][] – Run Length Encoding

[![Solution 01 Image][]][Solution 01] 

This sketch shows 3 images:

* left   ⟶ original image
* center ⟶ image encoded to run length code
* right  ⟶ runlength decoded image

| Key Map   |                                     |
|-----------|-------------------------------------|
| `[SPACE]` | switch between source images        |
| `[s]`     | save image in `.rle` format         |


### [Solution 03][] – Glitch

[![Solution 03 Image][]][Solution 03] 

This is a glitch version of *Solution 01*.

| Key Map   |                                     |
|-----------|-------------------------------------|
| `[SPACE]` | switch between source images        |
| `[s]`     | save glitched image as `.png`       |
| `[1]`     | mutation  (low rate, big amount)    |
| `[2]`     | mutation  (high rate, small amount) |
| `[3]`     | delete single bytes                 |
| `[4]`     | delete pairs of bytes               |

[Solution 01]: coding_gestalt__exercise_07_01__runlength_encoding
[Solution 03]: coding_gestalt__exercise_07_03__rle_glitch

[Solution 01 Image]: coding_gestalt__exercise_07_01__runlength_encoding.jpg
[Solution 03 Image]: coding_gestalt__exercise_07_03__rle_glitch.jpg

