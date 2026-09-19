---
name: unr3_scene
description: DÃ¹ng khi ngÆ°á»i dÃ¹ng Ä‘Æ°a má»™t Ká»ŠCH Báº¢N dáº¡ng SHOT cÃ³ STYLE ANCHOR (thÆ°á»ng tá»« unr3_writing) vÃ  muá»‘n sinh PROMPT táº¡o áº£nh vÃ  PROMPT táº¡o video. LÃ  bÆ°á»›c 2 cá»§a quy trÃ¬nh. KhÃ´ng dÃ¹ng Ä‘á»ƒ viáº¿t ká»‹ch báº£n.
---

# unr3_scene â€” Ká»‹ch báº£n â†’ Prompt áº£nh + Prompt video

## Overview
Äá»c ká»‹ch báº£n Ä‘Ã£ duyá»‡t vÃ  sinh 2 file prompt tiáº¿ng Anh: `image_prompts.md` (khung hÃ¬nh
tÄ©nh) vÃ  `video_prompts.md` (animate Ä‘Ãºng khung Ä‘Ã³ 8 giÃ¢y báº±ng Veo 3.1). NgÆ°á»i dÃ¹ng táº¡o
áº£nh trÆ°á»›c rá»“i dÃ¹ng áº£nh lÃ m frame cho video, nÃªn áº£nh vÃ  video PHáº¢I khá»›p theo thá»© tá»±.

## Khi nÃ o dÃ¹ng
- CÃ³ sáºµn ká»‹ch báº£n dáº¡ng SHOT + STYLE ANCHOR (thÆ°á»ng do unr3_writing táº¡o).
- BÆ°á»›c 2 cá»§a quy trÃ¬nh 2 skill.
- KHÃ”NG dÃ¹ng Ä‘á»ƒ viáº¿t ká»‹ch báº£n â€” Ä‘Ã³ lÃ  unr3_writing.

## Input
- File ká»‹ch báº£n (hoáº·c dÃ¡n ná»™i dung). Náº¿u thiáº¿u STYLE ANCHOR hoáº·c khÃ´ng tÃ¡ch Ä‘Æ°á»£c SHOT:
  bÃ¡o vÃ  há»i, KHÃ”NG tá»± bá»‹a.

## CÃ¡ch Ä‘á»c ká»‹ch báº£n
1. TrÃ­ch STYLE ANCHOR (mÃ¹a, mÃ u, cháº¥t phim, á»‘ng kÃ­nh, nhÃ¢n váº­t/motif).
2. Äáº¿m sá»‘ SHOT = N.
3. Sinh Ä‘Ãºng N dÃ²ng á»Ÿ Má»–I file. **Sá»‘ dÃ²ng 2 file Báº°NG NHAU tuyá»‡t Ä‘á»‘i.**

## Khá»›p theo dÃ²ng (Báº¤T BIáº¾N)
DÃ²ng k cá»§a `image_prompts.md` â‡„ dÃ²ng k cá»§a `video_prompts.md` â‡„ SHOT k.
- KHÃ”NG Ä‘Ã¡nh sá»‘, KHÃ”NG bullet, KHÃ”NG dÃ²ng trá»‘ng xen giá»¯a.
- Má»—i dÃ²ng lÃ  Má»˜T prompt hoÃ n chá»‰nh, tá»± Ä‘á»©ng Ä‘á»™c láº­p (copy nguyÃªn dÃ²ng lÃ  cháº¡y Ä‘Æ°á»£c).

## Prompt áº¢NH â€” cÃ´ng thá»©c (má»—i shot = 1 dÃ²ng, tiáº¿ng Anh)
MÃ´ táº£ má»™t KHUNG HÃŒNH TÄ¨NH. NhÃ©t sáºµn STYLE ANCHOR vÃ o tá»«ng dÃ²ng:
`[subject & tráº¡ng thÃ¡i tÄ©nh], [bá»‘i cáº£nh cá»¥ thá»ƒ], [bá»‘ cá»¥c & á»‘ng kÃ­nh vd 35mm], [Ã¡nh sÃ¡ng & thá»i Ä‘iá»ƒm], [báº£ng mÃ u & cháº¥t phim/grain], [mood], cinematic, 16:9`

VÃ­ dá»¥ (1 dÃ²ng):
`A young woman in a beige knit sweater standing at a quiet old-town street corner, autumn leaves on wet cobblestone, medium shot 35mm, soft morning light from the left, amber-brown palette with gentle 35mm film grain, nostalgic and calm, cinematic, 16:9`

## Prompt VIDEO â€” cÃ´ng thá»©c (má»—i shot = 1 dÃ²ng, Veo 3.1, tiáº¿ng Anh)
Chá»‰ ANIMATE Ä‘Ãºng khung áº£nh Ä‘Ã³ trong 8 giÃ¢y. KHÃ”NG Ä‘á»•i sang cáº£nh khÃ¡c.
`[má»™t chuyá»ƒn Ä‘á»™ng cam cháº­m: slow push-in / gentle pan / subtle parallax], [chá»§ thá»ƒ chuyá»ƒn Ä‘á»™ng nháº¹], [chuyá»ƒn Ä‘á»™ng ná»n: lÃ¡ rÆ¡i, hÆ¡i nÆ°á»›c, ngÆ°á»i xa xa], [Ã¡nh sÃ¡ng giá»¯ nguyÃªn mood], minimal ambient sound, slow calm pacing, 8s, 16:9`

VÃ­ dá»¥ (1 dÃ²ng):
`Slow push-in on the woman as she gently turns her head, autumn leaves drifting past and faint steam rising from a coffee cup, soft morning light holding steady, minimal ambient sound, slow calm pacing, 8s, 16:9`

## Ká»· luáº­t "frame â†’ animate"
- Video prompt pháº£i mÃ´ táº£ CÃ™NG khung áº£nh, chá»‰ thÃªm chuyá»ƒn Ä‘á»™ng. Cáº¤M mÃ´ táº£ cáº£nh má»›i,
  cáº¯t cáº£nh, hay nhÃ¢n váº­t má»›i trong 8s.
- Má»™t cÃº cam + world motion nháº¹. KhÃ´ng nhá»“i nhiá»u hÃ nh Ä‘á»™ng.
- Ã‚m thanh: Ä‘á»ƒ `minimal ambient sound` (hoáº·c bá») vÃ¬ ngÆ°á»i dÃ¹ng phá»§ nháº¡c piano lÃªn.
  KhÃ´ng thÃªm nháº¡c/giá»ng Ä‘á»c trong prompt.

## Giá»¯ nháº¥t quÃ¡n
- NhÃ¢n váº­t/trang phá»¥c/Ä‘á»‹a Ä‘iá»ƒm giá»¯ y há»‡t qua cÃ¡c dÃ²ng (láº¥y tá»« STYLE ANCHOR + motif).
- CÃ¹ng á»‘ng kÃ­nh/báº£ng mÃ u/cháº¥t phim á»Ÿ má»i dÃ²ng.

## Output
- Ghi `image_prompts.md` vÃ  `video_prompts.md`, present cáº£ hai.

## Tá»± kiá»ƒm trÆ°á»›c khi giao
- [ ] Sá»‘ dÃ²ng 2 file báº±ng nhau vÃ  báº±ng N shot.
- [ ] KhÃ´ng Ä‘Ã¡nh sá»‘, khÃ´ng dÃ²ng trá»‘ng, má»—i dÃ²ng tá»± Ä‘á»©ng Ä‘á»™c láº­p.
- [ ] Má»—i dÃ²ng cÃ³ `16:9`; video cÃ³ `8s` + `minimal ambient sound` + nhá»‹p cháº­m.
- [ ] Video animate Ä‘Ãºng khung áº£nh cÃ¹ng dÃ²ng, khÃ´ng Ä‘á»•i cáº£nh.
- [ ] STYLE ANCHOR (mÃ u/á»‘ng kÃ­nh/cháº¥t phim) xuáº¥t hiá»‡n nháº¥t quÃ¡n á»Ÿ má»i dÃ²ng.
